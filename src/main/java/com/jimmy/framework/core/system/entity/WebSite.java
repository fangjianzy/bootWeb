package com.jimmy.framework.core.system.entity;

import java.io.Serializable;
/**
 * 网站设置实体对象
 * @author Jimmy.fang
 *
 */
public class WebSite implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String siteName;
	private String siteWwwname;
	private Long cacheTime;
	private Long maxFilekb;
	private String fileUploadtype;
	private String indexTitle;
	private String metaKey;
	private String metaInfo;
	private String siteVersion;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	public String getSiteWwwname() {
		return siteWwwname;
	}
	public void setSiteWwwname(String siteWwwname) {
		this.siteWwwname = siteWwwname;
	}
	public Long getCacheTime() {
		return cacheTime;
	}
	public void setCacheTime(Long cacheTime) {
		this.cacheTime = cacheTime;
	}
	public Long getMaxFilekb() {
		return maxFilekb;
	}
	public void setMaxFilekb(Long maxFilekb) {
		this.maxFilekb = maxFilekb;
	}
	public String getFileUploadtype() {
		return fileUploadtype;
	}
	public void setFileUploadtype(String fileUploadtype) {
		this.fileUploadtype = fileUploadtype;
	}
	public String getIndexTitle() {
		return indexTitle;
	}
	public void setIndexTitle(String indexTitle) {
		this.indexTitle = indexTitle;
	}
	public String getMetaKey() {
		return metaKey;
	}
	public void setMetaKey(String metaKey) {
		this.metaKey = metaKey;
	}
	public String getMetaInfo() {
		return metaInfo;
	}
	public void setMetaInfo(String metaInfo) {
		this.metaInfo = metaInfo;
	}
	public String getSiteVersion() {
		return siteVersion;
	}
	public void setSiteVersion(String siteVersion) {
		this.siteVersion = siteVersion;
	}
	
	
	
	
	
}
