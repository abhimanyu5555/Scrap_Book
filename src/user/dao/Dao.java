package user.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import user.Utils.Util;
import user.model.Friend;

public class Dao {
	private Connection conn;
	
	public Dao(){
		conn = Util.getConnection();
	}
	
	public void addFriend(Friend user){
		String query = "INSERT INTO friends(name, dob, status, actor, actress, cuisine, destination, ideal, profession, address, crush, bike, email)" +
				" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setDate(2, new Date(user.getDOB().getTime()));
			ps.setString(3, user.getStatus());
			ps.setString(4, user.getActor());
			ps.setString(5, user.getActress());
			ps.setString(6, user.getCuisine());
			ps.setString(7, user.getDestination());
			ps.setString(8, user.getIdeal());
			ps.setString(9, user.getProfession());
			ps.setString(10, user.getAddress());
			ps.setString(11, user.getCrush());
			ps.setString(12, user.getBike());
			ps.setString(13, user.getEmail());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	public void deleteFriend(int userId){
		try {
			PreparedStatement ps = conn.prepareStatement("DELETE FROM friends WHERE id = ?");
			ps.setInt(1, userId);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateFriend(Friend friend){
		String name = friend.getName();
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE friends SET name=?, dob=?, status=?, actor=?, actress=?, " +
					"cuisine=?, destination=?, ideal=?, profession=?, address=?, crush=?, bike=?, email=? WHERE id=?");
			ps.setString(1, friend.getName());
			ps.setDate(2, new Date(friend.getDOB().getTime()));
			ps.setString(3, friend.getStatus());
			ps.setString(4, friend.getActor());
			ps.setString(5, friend.getActress());
			ps.setString(6, friend.getCuisine());
			ps.setString(7, friend.getDestination());
			ps.setString(8, friend.getIdeal());
			ps.setString(9, friend.getProfession());
			ps.setString(10, friend.getAddress());
			ps.setString(11, friend.getCrush());
			ps.setString(12, friend.getBike());
			ps.setString(13, friend.getEmail());
			ps.setInt(14, friend.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Friend getFriend(int id){
		Friend friend = new Friend();
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM friends WHERE id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				friend.setId(rs.getInt("id"));
				friend.setName(rs.getString("name"));
				friend.setDOB(rs.getDate("dob"));
				friend.setStatus(rs.getString("status"));
				friend.setActor(rs.getString("actor"));
				friend.setActress(rs.getString("actress"));
				friend.setCuisine(rs.getString("cuisine"));
				friend.setDestination(rs.getString("destination"));
				friend.setIdeal(rs.getString("ideal"));
				friend.setProfession(rs.getString("profession"));
				friend.setAddress(rs.getString("address"));
				friend.setCrush(rs.getString("crush"));
				friend.setBike(rs.getString("bike"));
				friend.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return friend;
	}
 
	public List<Friend> getList(){
		List<Friend> userList = new ArrayList<Friend>();
		try {
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery("SELECT * FROM friends");
			while(rs.next()){
				Friend user = new Friend();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setDOB(rs.getDate("dob"));
				user.setStatus(rs.getString("status"));
				user.setActor(rs.getString("actor"));
				user.setActress(rs.getString("actress"));
				user.setCuisine(rs.getString("cuisine"));
				user.setDestination(rs.getString("destination"));
				user.setIdeal(rs.getString("ideal"));
				user.setProfession(rs.getString("profession"));
				user.setAddress(rs.getString("address"));
				user.setCrush(rs.getString("crush"));
				user.setBike(rs.getString("bike"));
				user.setEmail(rs.getString("email"));
				userList.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList;
	}

}
