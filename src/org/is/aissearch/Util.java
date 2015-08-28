package org.is.aissearch;


public class Util {

	
	/**
	 * Method simulating extraction of appropriate records from Lucene or from RDB.
	 * Notice that not all records are returned: only a small subset - if the total number
	 * of records found is big. 
	 */
	public static Result get(String queryString, int from, int num) throws Exception{

		queryString = queryString.replaceAll("'", "").trim().toLowerCase(); 		
		
		int total = 262265591; //total found
		
		Result result = new Result(from);
		result.setTotal(total);

		int end = Math.min(total, from + num);
		
		for(int i = from; i < end; i++) {
			
			Entry record = new Entry();
			record.setId(Integer.toString(i));
			record.setTitle("Title " + i);
			record.setUri("http://some.url.org");
			record.setDescription("This is a description");
			
			result.add(record);
        }
		return result;
	}
}
