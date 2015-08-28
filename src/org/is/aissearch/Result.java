package org.is.aissearch;


import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Iterator;


public class Result {

	private int total; //total satisfying results in the database
	private ArrayList list = new ArrayList();
    private int from;

    
    public Result(int from){
		this.from = from;
    }
    
    
	public ArrayList getList() {
		return list;
	}

	public void setList(ArrayList list) {
		this.list = list;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	void add(Entry entry){
		list.add(entry);
	}
	
	public int getFrom() {
		return from;
	}

	public void setFrom(int from) {
		this.from = from;
	}

	public int getNext() {
		int next = from+Constants.NUM_RECORDS_TO_SHOW;
		return next;
	}
	
	/**
	 * Convenience method for accessing to the constant from JSTL (through ${maxRecordsToShow})
	 */
	public int getMaxRecordsToShow() {
		return Constants.NUM_RECORDS_TO_SHOW;
	}
	
	
	/**
	 * Helper (for debugging purposes
	 */
	public void dump(PrintStream ps){
	    for (Iterator iter = list.iterator(); iter.hasNext();){
	    	Entry entry = (Entry)iter.next();
	    	ps.println(entry);
	    }
	}

	public int getLoopStart() {
		int start = getCurrentPages();
		if(start < Constants.NUM_GROUP_RECORDS_TO_SHOW){
			return 0;
		}else{
			return start - Constants.NUM_GROUP_RECORDS_TO_SHOW;
		}
	}	

	public int getLoopEnd() {
		int end = getCurrentPages() + Constants.NUM_GROUP_RECORDS_TO_SHOW;
		int totalPages = (int)(total/Constants.NUM_RECORDS_TO_SHOW)+((total%Constants.NUM_RECORDS_TO_SHOW)>0?1:0);
		if(end >totalPages -1 ){
			return totalPages - 1;
			//return  totalPages - 1;
		}else{
			return end;
		}
	}

	public int getCurrentPages() {
		return (int)(from/Constants.NUM_RECORDS_TO_SHOW);
	}


	public int getFromTo() {
		int fromTo = from+Constants.NUM_RECORDS_TO_SHOW;
		if(fromTo>total){
			fromTo = total;
		}
		return fromTo;
	}

	/**
	 * For debugging purposes only
	 */
	public String toString(){
		StringBuffer sb=new StringBuffer();
		sb.append("total=" + total);
		sb.append(", from=" + from);
		sb.append(", next=" + getNext());
		sb.append(", list.size()="+list.size());
		return sb.toString();
	}	
}
