package com.task;

public class PatternTask2 
{
    public static void main(String[] args) {

    	int rows = 5;
        for (int i=1 ; i<=rows ; i++) 
        {
            for (int j=1 ; j<=i; j++) 
            {
                System.out.print("*");
            }
            for (int k=1 ; k<=2*(rows-i) ; k++) 
            {
                System.out.print(" ");
            }
            for (int l=1 ; l<=i ; l++) 
            {
                System.out.print("*");
            }
            System.out.println();
        }
    }
}