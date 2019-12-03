/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.91
 * Generated at: 2018-12-16 08:50:40 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javabean.Article;
import javabean.Access_DB;

public final class Notice_005fread_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"EUC-KR\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css\">\r\n");
      out.write("<!-- 부가적인 테마 -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css\">\r\n");
      out.write("<!-- 합쳐지고 최소화된 최신 자바스크립트 -->\r\n");
      out.write("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("\tfunction move(url){\r\n");
      out.write("\t\tlocation.href=url;\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t");
 
		request.setCharacterEncoding("EUC-KR");
		Access_DB ac = new Access_DB();
		Article article = ac.getArticle(request.getParameter("article_number"));
		String delete_url = "'Delete_handle.jsp?article_number=" + article.getArticle_number()+ "&category=" + article.getCategory() + "&id=" + article.getId() + "&authority=" 
							+ ac.getidToAuthority(article.getId()) + "'";
	
      out.write("\r\n");
      out.write("\t<h2><em>Notice</em></h2>\r\n");
      out.write("\r\n");
      out.write("<table class=\"table table\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("     <td width='100px'>제목</td>\r\n");
      out.write("     <td style=\"text-align: left;\">");
      out.print(article.getArticle_name() );
      out.write("</td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td>작성자</td>\r\n");
      out.write("     <td style=\"text-align: left;\">");
      out.print(ac.getIdToName(article.getId()) );
      out.write("</td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td>날짜</td>\r\n");
      out.write("     <td style=\"text-align: left;\">");
      out.print(article.getDatetime().substring(0, 20) );
      out.write("</td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td>조회수</td>\r\n");
      out.write("     <td style=\"text-align: left;\">");
      out.print(article.getViews() );
      out.write("</td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td>내용</td>\r\n");
      out.write("     <td style=\"text-align: left; height: 300px;\">");
      out.print(article.getText() );
      out.write("</td>\r\n");
      out.write("    </tr>\r\n");
      out.write("     <tr> \r\n");
      out.write("     <td colspan=\"2\"  class=\"text-center\">\r\n");
      out.write("\t");
 
		if(session.getAttribute("authority") != null){
			if(session.getAttribute("authority").toString().equals("admin")){
				out.println("<input class='btn btn-danger' type='button' value='글삭제' onclick=\"move(" + delete_url + ");\"/>");
				out.println("<input class='btn btn-primary' type='button' value='글수정' onclick=\"move('Container.jsp?selected_page=notice_update&article_number="+ request.getParameter("article_number") + "');\"/>");
			}
		}
	
      out.write("\r\n");
      out.write("\t<input type=\"button\" value=\"취소\" class=\"btn btn-warning\" onclick='move(\"Container.jsp?selected_page=notice\");'>\r\n");
      out.write("     \r\n");
      out.write("     </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("</table>\r\n");
      out.write("\t\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
