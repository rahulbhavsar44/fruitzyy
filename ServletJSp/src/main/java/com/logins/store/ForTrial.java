package com.logins.store;

public class ForTrial {

	public static void main(String[] args) {
		
		
		String s = "1 [Oranges  - 200 - Sitabag - Rs 500] 2 [Oranges  - 200 - Sitabag - Rs 500] 3 [Oranges  - 200 - Sitabag - Rs 500]";
		String str[] = s.split("]");

		
		for(int i=0;i<str.length;i++) {System.out.println(str[i]);}
	}

}
