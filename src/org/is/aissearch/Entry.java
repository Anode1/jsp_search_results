package org.is.aissearch;


import java.io.PrintWriter;


/**
 * DTO for one entry/resource (to be passed from back-end to the web-layer
 */
public class Entry {

	private String id;
	private String title;
	private String uri;
	private String description;
	

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getUri() {
		return uri;
	}


	public void setUri(String uri) {
		this.uri = uri;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	/**
	 * For debugging purposes only
	 */
	public String toString(){
		StringBuffer sb=new StringBuffer();
		sb.append(id);
		sb.append(": title=" + title);
		sb.append(", uri=" + uri);
		return sb.toString();
	}	
}
