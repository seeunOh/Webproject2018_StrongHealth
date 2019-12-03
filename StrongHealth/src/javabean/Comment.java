package javabean;

public class Comment {
	private String article_number;
	private String comment_number;
	private String id;
	private String datetime;
	private String text;
	
	
	public String getAttributes() {
		return "'" + article_number + "', '" + id + "', '" + datetime + "', '" + text + "', '" + comment_number + "'";
	}

	public String getComment_number() {
		return comment_number;
	}
	public void setComment_number(String comment_number) {
		this.comment_number = comment_number;
	}
	public String getArticle_number() {
		return article_number;
	}
	public void setArticle_number(String article_number) {
		this.article_number = article_number;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	
}
