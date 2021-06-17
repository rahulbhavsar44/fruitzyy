package com.logins.store;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;

public class FruitItems {
	
	
	ServletOutputStream sos = null;
	public String fruit_name;
	public String fruit_price;
	public String fruit_specific;
	public Blob fruit_image;
	
	
	
	
	
	public String getFruit_name() {
		return fruit_name;
	}
	public void setFruit_name(String fruit_name) {
		this.fruit_name = fruit_name;
	}
	public String getFruit_price() {
		return fruit_price;
	}
	public void setFruit_price(String fruit_price) {
		this.fruit_price = fruit_price;
	}
	public String getFruit_specific() {
		return fruit_specific;
	}
	public void setFruit_specific(String fruit_specific) {
		this.fruit_specific = fruit_specific;
	}
	public Blob getFruit_image() {
		return fruit_image;
	}
	public void setFruit_image(Blob blob) {
		this.fruit_image = blob;
	}
	
	
//	@Override
//	public String toString() {
//		return "FruitItems [fruit_name=" + fruit_name + ", fruit_price=" + fruit_price + ", fruit_specific="
//				+ fruit_specific + ", fruit_image=" + Arrays.toString(fruit_image) + "]";
//	
//	
//	}
	

	public String fruitName() {
		return  fruit_name;
	
	
	}
	
	public String fruitPrice() {
		return fruit_price;
	
	}
	public String fruitSpecific() {
		return fruit_specific;
	
	}
	

	public Blob fruitImage() {
		byte[] f_image = null;
//		try {
//			f_image = fruit_image.getBytes(1,(int)fruit_image.length());
//		} catch (SQLException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		ByteArrayInputStream bis = new ByteArrayInputStream(f_image);
		BufferedImage bImage2 = null;
		try {
			bImage2 = ImageIO.read(bis);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			ImageIO.write(bImage2, "jpg", new File("fruit.jpg"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fruit_image;






		
		

	}
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	

}
