package com.logins.store;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;

import javax.servlet.ServletOutputStream;



public class OnlyForImages {
	
public static void main(String args[]) 
{
	FruitItems fs=new FruitItems();
	String fruit_name = fs.getFruit_name();
	System.out.print(fruit_name);
}

}
