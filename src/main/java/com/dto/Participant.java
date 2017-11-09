package com.dto;

import java.math.BigInteger;

public class Participant {

	private String pname;
	private String sex;
	private String email;
	private String password;
	private Long mobile;
	private String country;
	private String city;

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String isSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Long getMobile() {
		return mobile;
	}

	public void setMobile(Long mobile) {
		this.mobile = mobile;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "Participant [pname=" + pname + ", sex=" + sex + ", email=" + email + ", password=" + password
				+ ", mobile=" + mobile + ", country=" + country + ", city=" + city + "]";
	}

}
