package com.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.DBConnection;
import com.dto.Participant;

public class Controller {

	public int saveRecord(Participant part) throws SQLException {
		DBConnection db = new DBConnection();
		Connection con = db.Connect();
		PreparedStatement ps = con.prepareStatement("insert into participant_table value(?,?,?,?,?,?,?)");
		ps.setString(1, part.getPname());
		ps.setString(2, part.isSex());
		ps.setString(3, part.getEmail());
		ps.setString(4, part.getPassword());
		ps.setLong(5, part.getMobile());
		ps.setString(6, part.getCountry());
		ps.setString(7, part.getCity());

		int i = ps.executeUpdate();
		con.close();
		return i;

	}

	public List<Participant> getAllRecords() throws SQLException {
		DBConnection db = new DBConnection();
		Connection con = db.Connect();
		PreparedStatement ps = con.prepareStatement("select * from participant_table");
		ResultSet rs = ps.executeQuery();
		List<Participant> listpart = new ArrayList<Participant>();
		while (rs.next()) {
			Participant part = new Participant();

			part.setPname(rs.getString("pname"));
			part.setSex(rs.getString("sex"));
			part.setEmail(rs.getString("email"));
			part.setPassword(rs.getString("password"));
			part.setMobile(rs.getLong("mobile"));
			part.setCountry(rs.getString("country"));
			part.setCity(rs.getString("city"));

			listpart.add(part);
		}
		con.close();
		return listpart;
	}

	public int deleteRecord(Participant part) throws SQLException {
		DBConnection db = new DBConnection();
		Connection con = db.Connect();
		PreparedStatement ps = con.prepareStatement("delete from participant_table where email=?");
		// Participant part = new Participant();
		String email = part.getEmail();
		ps.setString(1, email);
		int i = ps.executeUpdate();
		con.close();
		return i;
	}

	public Participant getParticularRecord(Participant part) throws SQLException {
		DBConnection db = new DBConnection();
		Connection con = db.Connect();
		PreparedStatement ps = con.prepareStatement("select * from participant_table where email=?");
		String email = part.getEmail();
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		rs.next();
		Participant p = new Participant();

		p.setPname(rs.getString("pname"));
		p.setSex(rs.getString("sex"));
		p.setEmail(rs.getString("email"));
		p.setPassword(rs.getString("password"));
		p.setMobile(rs.getLong("mobile"));
		p.setCountry(rs.getString("country"));
		p.setCity(rs.getString("city"));

		return p;
	}

	public int updateRecord(Participant part) throws SQLException {
		DBConnection db = new DBConnection();
		Connection con = db.Connect();
		PreparedStatement ps = con.prepareStatement(
				"update  participant_table set pname=?,sex=?,password=?,mobile=?,country=?,city=? where email=? ");
		ps.setString(1, part.getPname());
		ps.setString(2, part.isSex());
		ps.setString(3, part.getPassword());
		ps.setLong(4, part.getMobile());
		ps.setString(5, part.getCountry());
		ps.setString(6, part.getCity());
		ps.setString(7, part.getEmail());

		int i = ps.executeUpdate();
		return i;
	}

}
