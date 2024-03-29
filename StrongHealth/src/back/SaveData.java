package back;

import java.io.File;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;



class Coordinate{
	private int X;
	private int Y;
	
	Coordinate(int X, int Y){
		this.X = X;
		this.Y = Y;
	}
	public int getX() {
		return X;
	}
	public String getStringX() {
		return String.valueOf(X);
	}
	public void setX(int x) {
		X = x;
	}
	public int getY() {
		return Y;
	}
	public String getStringY() {
		return String.valueOf(Y);
	}
	public void setY(int y) {
		Y = y;
	}
	public String toString() {
		return X  + ", " + Y;
	}
}

public class SaveData extends TimerTask{
	
	static private String servicekey = "CuoptRvCjSiWrm5p42PHK1pkqvFSrcfsx6D%2FmOW0nw5Dzpa1K9xKIzyYeoBsJ3In0QV%2B14a7bjR%2Fkj%2B2%2Fw8Jnw%3D%3D";

	static private String air_cityAverage_URL = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureLIst";
	static private String air_city_URL = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty";
	
	static private String weather_URL = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData";
	
	static private String sensorytemp_URL = "http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getSensorytemLifeList";
	static private String frozen_URL = "http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getWinterLifeList";
	
	static private String medical_URL = "http://apis.data.go.kr/B550928/dissForecastInfoSvc/getDissForecastInfo";

	static private Map<String, Integer> cityCode = new HashMap<String, Integer>();
	static String cityNames[] = { "서울", "부산", "대구", "인천", "광주", "대전", "울산", "경기", "강원", "충북", "충남", "전북", "전남", "경북", "경남",
			"제주", "세종" };
	static int cityNums[] = { 11, 26, 27, 28, 29, 30, 31, 41, 42, 43, 44, 45, 46, 47, 48, 49, 36 };

	static private Map<String, Coordinate> cityCoor = new HashMap<>();
	static int[][] coordinates = { { 60, 127 }, { 98, 76 }, { 89, 90 }, { 55, 124 }, { 58, 74 }, { 67, 100 },
			{ 102, 84 }, { 60, 120 }, { 73, 134 }, { 69, 107 }, { 68, 100 }, { 63, 89 }, { 51, 67 }, { 89, 91 },
			{ 91, 77 }, { 52, 38 }, { 66, 103 } };
	

	static private String driverName = "com.mysql.jdbc.Driver";
	static private String dbURL = "jdbc:mysql://localhost:3306/stronghealthdb";
	static private String userName = "root";
	static private String passWord = "0000";
	static private Connection con = null;
	static private Statement st = null;
	
	public static void connectDB() {
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(dbURL, userName, passWord);
			st = con.createStatement();
			System.out.println("stronghealthdb에 연결되엇습니다.");
		} catch( Exception e) {
			System.out.println("stronghealthdb에 연결되지 않았습니다.");
		}
	}
	
	public static void closeDB() {
		try {
			con.close();
			st.close();
			System.out.println("정상적으로 종료 하였습니다.");
		} catch(Exception e) {
			System.out.println("정상적으로 종료하지 못하였습니다");
		}
	}

	public static void setCityCode() {
		for (int i = 0; i < cityNames.length; i++) {
			cityCode.put(cityNames[i], cityNums[i]);
		}
	}
	
	public static void setCityCoor() {
		for (int i=0; i<cityNames.length; i++) {
			cityCoor.put(cityNames[i], new Coordinate(coordinates[i][0], coordinates[i][1]));
		}
	}
	
	public static void getMedicalInfo() throws Exception {
		String base_query = "update weather set";
		
		PrintWriter pf = new PrintWriter(new File("MedicalInfo.txt"));
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dbBuilder = dbFactory.newDocumentBuilder();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		String toDay = df.format(new Date());
		String[] citycode= {"11110", "26110", "27110", "28110", "29110", "30110", "31110", "41111", "42110", "43111", "44131",
				"45111", "46110", "47111", "48121", "49110"};
		
				
		setCityCode();
		cityCode.replace("세종", 44);
		
		int diseaseNumEnd = 5;
		
		for(int i=0; i<cityCode.size(); i++) {
			for(int j=1; j<=diseaseNumEnd; j++) {
				StringBuilder urlBuilder = new StringBuilder(medical_URL); /* URL */
				urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + servicekey); /* Service Key */
				urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /* Service Key */
				urlBuilder.append("&" + URLEncoder.encode("dissCd", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(j), "UTF-8")); /* disease code (1:감기, 2:눈병, 3:식중독, 4:천식, 5:피부염) */
				urlBuilder.append("&" + URLEncoder.encode("znCd", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(cityCode.get(cityNames[i])), "UTF-8")); /* city code */

				System.out.println(urlBuilder.toString());
				URL url = new URL(urlBuilder.toString());
				Document document = dbBuilder.parse(url.toString());
				
				NodeList dissCd = document.getElementsByTagName("dissCd");
				NodeList dt = document.getElementsByTagName("dt");
				NodeList znCd = document.getElementsByTagName("znCd");
				NodeList lowrnkZnCd = document.getElementsByTagName("lowrnkZnCd");
				NodeList risk = document.getElementsByTagName("risk");
				NodeList dissRiskXpln = document.getElementsByTagName("dissRiskXpln");
				
				for(int k=0; k < dissCd.getLength(); k++) {
					if(!dt.item(k).getFirstChild().getNodeValue().equals(toDay)) 
						continue;
					if(!cityNames[i].equals("세종") && !requiredCheck(lowrnkZnCd.item(k).getFirstChild().getNodeValue(), citycode)) {
						continue;}
					if(cityNames[i].equals("세종") && !lowrnkZnCd.item(k).getFirstChild().getNodeValue().equals("36110"))
						continue;
					String result = dissCd.item(k).getFirstChild().getNodeValue() + "\t" + 
									dt.item(k).getFirstChild().getNodeValue() + "\t" + 
									znCd.item(k).getFirstChild().getNodeValue() + "\t" + 
									lowrnkZnCd.item(k).getFirstChild().getNodeValue() + "\t" + 
									risk.item(k).getFirstChild().getNodeValue() + "\t" +
									dissRiskXpln.item(k).getFirstChild().getNodeValue();
					System.out.println("질병코드  : " + dissCd.item(k).getFirstChild().getNodeValue());
					System.out.println("예측일자  : " + dt.item(k).getFirstChild().getNodeValue());
					System.out.println("지역코드 : " + znCd.item(k).getFirstChild().getNodeValue());
					System.out.println("하위지역코드  :  " + lowrnkZnCd.item(k).getFirstChild().getNodeValue());
					System.out.println("위혐도 : " + risk.item(k).getFirstChild().getNodeValue());
					System.out.println("지침 : " + dissRiskXpln.item(k).getFirstChild().getNodeValue());
					pf.println(result);
					
					String query= base_query;
					switch(dissCd.item(k).getFirstChild().getNodeValue()) {
					case "1":
						query += " flu='";
						break;
					case "2":
						query += " eyeDisease='"; 
						break;
					case "3":
						query += " foodPoison='";
						break;
					case"4":
						query += " asthma='";
						break;
					case"5":
						query += " skinDisease='";
						break;
					}
					switch(risk.item(k).getFirstChild().getNodeValue()) {
					case "1":
						query += "관심";
						break;
					case "2":
						query += "주의";
						break;
					case "3":
						query += "경고";
						break;
					case "4":
						query += "위험";
						break;
					}
					query += "' where cityName='" + cityNames[i] + "'";
					System.out.println(query);
					st.execute(query);
				}
			}
		}
		pf.flush();
		pf.close();
	}
	
	public static void getLifeInfo() throws Exception {
		String base_query = "update weather set";
		
		PrintWriter pf = new PrintWriter(new File("sensoryTemp.txt"));
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dbBuilder = dbFactory.newDocumentBuilder();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddkk");
		String toDay = df.format(new Date());
		setCityCode();
		cityCode.replace("제주", 50);
		
		for(int i=0; i<cityCode.size(); i++) {
				StringBuilder sensory_urlBuilder = new StringBuilder(sensorytemp_URL); /* URL */
				StringBuilder frozen_urlBuilder = new StringBuilder(frozen_URL); 
				sensory_urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + servicekey); /* Service Key */
				sensory_urlBuilder.append("&" + URLEncoder.encode("areaNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(cityCode.get(cityNames[i])) + "00000000", "UTF-8")); /* city code */
				sensory_urlBuilder.append("&" + URLEncoder.encode("time", "UTF-8") + "=" + URLEncoder.encode(toDay, "UTF-8")); /* city code */
				frozen_urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + servicekey); 
				frozen_urlBuilder.append("&" + URLEncoder.encode("areaNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(cityCode.get(cityNames[i])) + "00000000", "UTF-8")); /* city code */
				frozen_urlBuilder.append("&" + URLEncoder.encode("time", "UTF-8") + "=" + URLEncoder.encode(toDay, "UTF-8")); /* city code */
				
				URL sensory_url = new URL(sensory_urlBuilder.toString());
				URL frozen_url = new URL(frozen_urlBuilder.toString());
				Document sensory_document = dbBuilder.parse(sensory_url.toString());
				Document frozen_document = dbBuilder.parse(frozen_url.toString());
				System.out.println(frozen_url.toString());
				
				
				
				NodeList sensory_code = sensory_document.getElementsByTagName("code");
				NodeList sensory_areaNo = sensory_document.getElementsByTagName("areaNo");
				NodeList sensory_date = sensory_document.getElementsByTagName("date");
				NodeList sensory_h3 = sensory_document.getElementsByTagName("h3");
			
				NodeList frozen_h3 = frozen_document.getElementsByTagName("h3");
				
				
				for(int k=0; k<sensory_code.getLength(); k++) {
	
					String result = sensory_code.item(k).getFirstChild().getNodeValue() + "\t" + 
							sensory_areaNo.item(k).getFirstChild().getNodeValue() + "\t" + 
							sensory_date.item(k).getFirstChild().getNodeValue() + "\t" + 
							sensory_h3.item(k).getFirstChild().getNodeValue()+ "\t" +
							frozen_h3.item(k).getFirstChild().getNodeValue();
					System.out.println("지수코드  : " + sensory_code.item(k).getFirstChild().getNodeValue());
					System.out.println("지점코드  : " + sensory_areaNo.item(k).getFirstChild().getNodeValue());
					System.out.println("체감온도 발표시간 : " + sensory_date.item(k).getFirstChild().getNodeValue());
					System.out.println("체감온도 예측값  :  " + sensory_h3.item(k).getFirstChild().getNodeValue());
					System.out.println("동파지수 예측값  :  " + frozen_h3.item(k).getFirstChild().getNodeValue());
					pf.println(result);

					String sensory_qeury =base_query + " sensory='" + sensory_h3.item(k).getFirstChild().getNodeValue()+"' where cityName='" + cityNames[i]+"'";
					String frozen_query = base_query + " frozen='" + frozen_h3.item(k).getFirstChild().getNodeValue()+"' where cityName='" + cityNames[i] +"'";
					st.execute(sensory_qeury);
					st.execute(frozen_query);
				}
		}
		pf.flush();
		pf.close();
	}
	
	public static void getWeatherInfo() throws Exception {
		String base_query = "update weather set";
		
		String weather_code[] = {"POP", "PTY", "REH", "SKY"};
		PrintWriter pf = new PrintWriter(new File("Weather.txt"));
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dbBuilder = dbFactory.newDocumentBuilder();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat bs = new SimpleDateFormat("kk");
		Calendar c = Calendar.getInstance();	
		String toDay = df.format(new Date());
		String targetDay = null;
		String targetTomorrow = null;
		String hour = bs.format(new Date()) + "00";
		String thour = null;
		
		int iHour = Integer.parseInt(hour);
		if(iHour >= 300 && iHour < 900) {
			hour = "0200";
			thour = "0600";
		} else if(iHour >= 900 && iHour < 1500) {
			hour = "0800";
			thour = "1200";
		} else if(iHour >= 1500 && iHour < 2100) {
			hour = "1400";
			thour = "1800";
		} else {
			hour = "2000";
			thour = "0000";
			c.add(Calendar.DATE, 1);
		}
		targetDay = df.format(c.getTime());
		c.add(Calendar.DATE, 1);
		targetTomorrow = df.format(c.getTime());
		System.out.println(toDay + "    " + targetDay + "    " + targetTomorrow);
		setCityCoor();
		for(int i=0; i<cityCoor.size(); i++) {
			StringBuilder urlBuilder = new StringBuilder(weather_URL); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + servicekey); /* Service Key */
			urlBuilder.append("&" + URLEncoder.encode("base_date", "UTF-8") + "=" + URLEncoder.encode(toDay, "UTF-8")); /* base_date */
			urlBuilder.append("&" + URLEncoder.encode("base_time", "UTF-8") + "=" + URLEncoder.encode(hour, "UTF-8")); /* base_time */
			urlBuilder.append("&" + URLEncoder.encode("nx", "UTF-8") + "=" + URLEncoder.encode(cityCoor.get(cityNames[i]).getStringX(), "UTF-8")); /* x */
			urlBuilder.append("&" + URLEncoder.encode("ny", "UTF-8") + "=" + URLEncoder.encode(cityCoor.get(cityNames[i]).getStringY(), "UTF-8")); /* y */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(500), "UTF-8")); /* row */
			
			
			URL url = new URL(urlBuilder.toString());
			Document document = dbBuilder.parse(url.toString());
			
			System.out.println(url.toString());
			
			NodeList baseDate = document.getElementsByTagName("baseDate");
			NodeList baseTime = document.getElementsByTagName("baseTime");
			NodeList category = document.getElementsByTagName("category");
			NodeList fcstDate = document.getElementsByTagName("fcstDate");
			NodeList fcstTime = document.getElementsByTagName("fcstTime");
			NodeList fcstValue = document.getElementsByTagName("fcstValue");
			NodeList nx = document.getElementsByTagName("nx");
			NodeList ny = document.getElementsByTagName("ny");
			String PTY = "";
			String SKY = "";
			int cnt = 0;
			
			for(int k=0; k<baseDate.getLength(); k++) {
				if(!requiredCheck(category.item(k).getFirstChild().getNodeValue(), weather_code))
					continue;
				if(!thour.equals(fcstTime.item(k).getFirstChild().getNodeValue())) 
					continue;
				if(!targetDay.equals(fcstDate.item(k).getFirstChild().getNodeValue()) && !targetTomorrow.equals(fcstDate.item(k).getFirstChild().getNodeValue()))
					continue;
				
				if(category.item(k).getFirstChild().getNodeValue().equals("SKY")) {
					SKY = fcstValue.item(k).getFirstChild().getNodeValue();
					System.out.println("SKY_RESULT = " + SKY);
					if(!SKY.equals("") && !PTY.equals("")) {
						String output = baseDate.item(0).getFirstChild().getNodeValue() + "\t" + 
								baseTime.item(0).getFirstChild().getNodeValue() + "\t" + 
								"WTH" + "\t" + 
								fcstDate.item(0).getFirstChild().getNodeValue() + "\t" + 
								fcstTime.item(0).getFirstChild().getNodeValue() + "\t" + 
								getWeather(PTY, SKY) + "\t" + 
								nx.item(0).getFirstChild().getNodeValue() + "\t" + 
								ny.item(0).getFirstChild().getNodeValue();
						pf.println(output);

						String query = base_query;
						switch(cnt) {
						case 0:
							query += " dWeather='";
							break;
						case 1:
							query += " tWeather='";
							break;
						}
						query += getWeather(PTY, SKY) + "' where cityName='" + cityNames[i] + "'";
						System.out.println(query);
						st.execute(query);
						SKY="";
						PTY="";
						cnt++;
					}
					continue;
				}
				else if(category.item(k).getFirstChild().getNodeValue().equals("PTY")) {
					PTY = fcstValue.item(k).getFirstChild().getNodeValue();
					System.out.println("SKY_RESULT = " + PTY);
					continue;
				}

				
				String result = baseDate.item(k).getFirstChild().getNodeValue() + "\t" + 
								baseTime.item(k).getFirstChild().getNodeValue() + "\t" + 
								category.item(k).getFirstChild().getNodeValue() + "\t" + 
								fcstDate.item(k).getFirstChild().getNodeValue() + "\t" + 
								fcstTime.item(k).getFirstChild().getNodeValue() + "\t" + 
								fcstValue.item(k).getFirstChild().getNodeValue() + "\t" + 
								nx.item(k).getFirstChild().getNodeValue() + "\t" + 
								ny.item(k).getFirstChild().getNodeValue();
				System.out.println("발표날짜  : " + baseDate.item(k).getFirstChild().getNodeValue());
				System.out.println("발표시간  : " + baseTime.item(k).getFirstChild().getNodeValue());
				System.out.println("자료구분  : " + category.item(k).getFirstChild().getNodeValue());
				System.out.println("예보일자  :  " + fcstDate.item(k).getFirstChild().getNodeValue());
				System.out.println("예보시간  : " + fcstTime.item(k).getFirstChild().getNodeValue());
				System.out.println("예보 값  : " + fcstValue.item(k).getFirstChild().getNodeValue());
				System.out.println("X좌표 : " + nx.item(k).getFirstChild().getNodeValue());
				System.out.println("Y좌표  :  " + ny.item(k).getFirstChild().getNodeValue());
				pf.println(result);
				
				if(!targetDay.equals(fcstDate.item(k).getFirstChild().getNodeValue())){
					String query = base_query;
					switch(category.item(k).getFirstChild().getNodeValue()) {
					case "POP":
						query += " pop='";
						break;
					case "REH":
						query += " humidity='";
						break;
					}
					query +=  fcstValue.item(k).getFirstChild().getNodeValue() + "' where cityName='" + cityNames[i] + "'";
					st.execute(query);
				}
			}


	}
	pf.flush();
	pf.close();
	System.out.println(hour);
	}
	
	public static void getDustInfo() throws Exception {
		String base_query = "update weather set dust=";
		
		PrintWriter pf = new PrintWriter(new File("DustInfo.txt"));
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dbBuilder = dbFactory.newDocumentBuilder();
		SimpleDateFormat bs = new SimpleDateFormat("yyyy-MM-dd kk");
		String datatime = bs.format(new Date()) + ":00";
		
		StringBuilder urlBuilder = new StringBuilder(air_cityAverage_URL); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + servicekey); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("itemCode", "UTF-8") + "=" + URLEncoder.encode("PM10", "UTF-8")); /* item code */
		urlBuilder.append("&" + URLEncoder.encode("dataGubun", "UTF-8") + "=" + URLEncoder.encode("HOUR", "UTF-8")); /* dataGubun */
		urlBuilder.append("&" + URLEncoder.encode("searchCondition", "UTF-8") + "=" + URLEncoder.encode("WEEK", "UTF-8")); /* searchConditon */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("500", "UTF-8")); /* numOfRows */

		URL url = new URL(urlBuilder.toString());
		Document document = dbBuilder.parse(url.toString());
		
		String e_cityNames[] = {"seoul","busan","daegu","incheon","gwangju","daejeon","ulsan","gyeonggi","gangwon","chungbuk",
				"chungnam", "jeonbuk", "jeonnam", "gyeongbuk", "gyeongnam", "jeju", "sejong" };

		
		System.out.println(url.toString());
		System.out.println(datatime);
		NodeList dataTime = document.getElementsByTagName("dataTime");
		NodeList itemCode = document.getElementsByTagName("itemCode");
		NodeList dataGubun = document.getElementsByTagName("dataGubun");
		for(int i=0; i<e_cityNames.length; i++) {
			NodeList city = document.getElementsByTagName(e_cityNames[i]);
			for(int k=0; k<dataTime.getLength(); k++) {
				if(!datatime.equals(dataTime.item(k).getFirstChild().getNodeValue())) {
						continue;
	
				String result = dataTime.item(k).getFirstChild().getNodeValue() + "\t" + 
								itemCode.item(k).getFirstChild().getNodeValue() + "\t" + 
								dataGubun.item(k).getFirstChild().getNodeValue() + "\t" + 
								cityNames[i] + "\t" + 
								city.item(k).getFirstChild().getNodeValue();
				System.out.println("측정일시  : " + dataTime.item(k).getFirstChild().getNodeValue());
				System.out.println("조회항목  : " + itemCode.item(k).getFirstChild().getNodeValue());
				System.out.println("조회자료구분 : " + dataGubun.item(k).getFirstChild().getNodeValue());
				System.out.println(cityNames[i]);
				System.out.println("측정값  :  " + city.item(k).getFirstChild().getNodeValue());
				pf.println(result);
				
				String query = base_query + "'" + city.item(k).getFirstChild().getNodeValue() + "'" + " where cityName='" + cityNames[i]+"'";
				st.execute(query);
			}
		}
		pf.flush();
		pf.close();
	}
	
	public static boolean requiredCheck(String target, String[] list) {
		boolean result = false;
		for(int i=0; i< list.length; i++) {
			if(target.equals(list[i])) {
				result = true;
			}
		}
		return result;
	}
	
	public static String getWeather(String PTY, String SKY) {
		int pty = Integer.parseInt(PTY);
		int sky = Integer.parseInt(SKY);
		String result = "-";
		System.out.println("RESULT :" + pty + " :: " + sky);
		if(pty == 1) 
			result = "비";
		else if(pty == 2) 
			result = "눈/비";
		else if(pty == 3)
			result = "눈";
		else
			if(sky == 1)
				result = "맑음";
			else if(sky == 2)
				result = "구름조금";
			else if(sky == 3)
				result = "구름많음";
			else if(sky == 4)
				result = "흐림";
		System.out.println(result);
		return result;
	}
	
	
	public static void main(String[] args) {
		SaveData savedata = new SaveData();
		SimpleDateFormat df = new SimpleDateFormat("kk");
		Timer timer = new Timer();
		Calendar date = Calendar.getInstance();

		int startTime = Integer.parseInt(df.format(new Date()));
		if(startTime < 3) 
			startTime = 3;
		else if(startTime < 9) 
			startTime = 9;
		else if(startTime < 15)
			startTime = 15;
		else if(startTime < 21)
			startTime = 21; 
		else {
			startTime = 3;
			date.add(Calendar.DATE, 1);
		}
		date.set(Calendar.AM_PM, Calendar.AM);
		date.set(Calendar.HOUR, startTime);
		date.set(Calendar.MINUTE, 20);
		date.set(Calendar.SECOND, 0);
		date.set(Calendar.MILLISECOND, 0);
		System.out.print("갱신 예정 시각 : ");
		System.out.println(date.getTime());
		System.out.println("03시 09시 15시 21시 / 20분에 한번씩 6시간 간격으로 데이터를 갱신 합니다.");
		System.out.println("현재시간기준 다가오는 시간에 맞춰 갱신이 이뤄 집니다.");
		timer.scheduleAtFixedRate(savedata, date.getTime(), 1000*60*60*6);
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
	
		try {
			connectDB();
			SaveData.getMedicalInfo();
			SaveData.getLifeInfo();
			SaveData.getWeatherInfo();
			SaveData.getDustInfo();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

	}

}


