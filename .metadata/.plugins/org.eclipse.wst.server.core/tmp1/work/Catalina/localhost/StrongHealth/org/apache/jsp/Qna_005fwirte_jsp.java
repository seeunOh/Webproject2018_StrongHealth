/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.91
 * Generated at: 2018-12-16 09:02:29 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Qna_005fwirte_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("</head>\r\n");
      out.write("<body>\r\n");
 
	if(session.getAttribute("authority") == null){
		out.println("<script>");
		out.println("alert('로그인을 하신 후 글을 남길수 있습니다.')");
		out.println("location.href='Container.jsp?selected_page=qna'");
		out.println("</script>");
	}

      out.write("\r\n");
      out.write("<h2>QnA 쓰기</h2>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<form action=\"Write_handle.jsp\" method=\"post\">\r\n");
      out.write("<table class=\"table table-striped\">\r\n");
      out.write("\t<input type=hidden name=\"category\" id=\"category\" value=\"qna\">\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td>제목</td>\r\n");
      out.write("     <td><input type=\"text\" class=\"form-control\" name=\"article_name\" id=\"article_name\" placeholder=\"제목을 입력해주세요.\"></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("    \t<td>질문 카테고리</td>\r\n");
      out.write("    \t<td><label><input type=\"radio\" id=\"qna_category\" name=\"qna_category\" value=\"홈페이지\"> 홈페이지&nbsp;&nbsp;</label>\r\n");
      out.write("    \t\t<label><input type=\"radio\" id=\"qna_category\" name=\"qna_category\" value=\"건강관련\"> 건강관련&nbsp;&nbsp;</label>\r\n");
      out.write("    \t\t<label><input type=\"radio\" id=\"qna_category\" name=\"qna_category\" value=\"화원등급\"> 회원등급&nbsp;&nbsp;</label>\r\n");
      out.write("    \t\t<label><input type=\"radio\" id=\"qna_category\" name=\"qna_category\" value=\"기타\"> 기타</label></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("     <td>글내용</td>\r\n");
      out.write("     <td><textarea rows=\"15\" class=\"form-control\" name=\"text\" id=\"text\" style=\"width:100%; height:100%\" placeholder=\"내용을 입력해주세요.\"></textarea></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("     <tr> \r\n");
      out.write("     <td colspan=\"2\"  class=\"text-center\">\r\n");
      out.write("      <input type=\"submit\" value=\"쓰기완료\" class=\"btn btn-success\">\r\n");
      out.write("      <input type=\"button\" value=\"취소\" class=\"btn btn-warning\" onclick='move(\"Container.jsp?selected_page=qna\");'>\r\n");
      out.write("     </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
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
