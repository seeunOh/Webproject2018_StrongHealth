package javabean;

public class Article {
	public static int NOTICE = 1;
	public static int QNA = 2;
	public static int MUSIC = 3;
	
	private String article_number;
	private String category;
	private String id;
	private String article_name;
	private String datetime;
	private int views;
	private String text;
	private String link;
	private String img;
	private String qna_category;
	
	public String getQna_category() {
		return qna_category;
	}

	public void setQna_category(String qna_category) {
		this.qna_category = qna_category;
	}

	public String getAttributes(int item) {
		String result = "";
		switch(item) {
		case 1:
			result = "'" + article_number +"', '" + category +"', '" + id +"', '" + article_name +
			 			"', '" + datetime +"', '" + views +"', '" + text + "'";
			break;
		case 2:
			result = "'" + article_number +"', '" + category +"', '" + id +"', '" + article_name +
			 			"', '" + datetime +"', '" + views +"', '" + text + "', '" + qna_category + "'";
			break;
		case 3:
			result = "'" + article_number +"', '" + category +"', '" + id +"', '" + article_name +
						"', '" + datetime +"', '" + views +"', '" + text +"', '" + link +"'";
			break;
		}
		System.out.println(result);
		return result;
	}
	
	public String getArticle_number() {
		return article_number;
	}
	public void setArticle_number(String article_number) {
		this.article_number = article_number;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getArticle_name() {
		return article_name;
	}
	public void setArticle_name(String article_name) {
		this.article_name = article_name;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
}
