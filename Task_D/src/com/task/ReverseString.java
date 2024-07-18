package com.task;

public class ReverseString {

	public static String reverseEachWord(String str) {
		String[] words = str.split(" ");
		StringBuilder sb1 = new StringBuilder();
		for (String word : words) {
			String sb2 = new StringBuilder(word).reverse().toString();
			sb1.append(sb2).append(" ");
		}
		return sb1.toString().trim();
	}

	public static void main(String[] args) {
		String input = "I would love to do coding";
		String output = reverseEachWord(input);
		System.out.println("Output: " + output);
	}
}