package com.lbg.library.util;

import java.util.List;

public class PageUtil<T> {
	
	//当前页
	private int page;
	//每页显示记录数
	private int size;
	//总记录数
	private int totalSize;
	//总页数
	private int totalPage;
	//查询的起始位置
	private int start;
	//是否有上一页
	private boolean hasPrevious;
	//是否有下一页
	private boolean hasNext;
	//上一页
	private int prevPage;
	//下一页
	private int nextPage;
	//首页
	private int first;
	//尾页
	private int last;
	
	//查询到的结果集合,譬如student
	private List<T> list;
	
	
	public PageUtil(String page,int size,int totalSize){
		//当前页
		this.page = page == null || page.trim().length() == 0 ? 1 : Integer.parseInt(page);

		//每页显示记录数
		this.size = size;
		//总记录数
		this.totalSize = totalSize;
		//总页数
		this.totalPage = (int)Math.ceil((this.totalSize*1.0)/this.size);
		
		if(this.page<1){
			this.page=1;
		}
		if(this.page>totalPage){
			this.page = totalPage;
		}
		
		//查询的起始位置
		this.start = (this.page-1)*this.size;
		//是否有上一页
		if(this.page>1){
			this.hasPrevious=true;
			//上一页
			this.prevPage = this.page-1;
		}
		//是否有下一页
		if(this.page<this.totalPage){
			this.hasNext=true;
			//下一页
			this.nextPage = this.page+1;
		}

		//首页
		this.first = 1;
		
		//尾页
		this.last = this.totalPage;
		
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public boolean isHasPrevious() {
		return hasPrevious;
	}

	public void setHasPrevious(boolean hasPrevious) {
		this.hasPrevious = hasPrevious;
	}

	public boolean isHasNext() {
		return hasNext;
	}

	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}
	
	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}
	
}
