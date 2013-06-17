package user.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;

import user.Utils.Util;
import user.dao.Dao;
import user.model.Friend;

public class Serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Dao dao;

	public Serv(){
		dao = new Dao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Friend friend = new Friend();
		/*getting and setting parameter values to pojo*/
		String name = request.getParameter("name");
		friend.setName(name);
		try {
			Date date = new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("dob"));
			friend.setDOB(date);
		} catch (ParseException e) {
			System.out.println("Date couldnt be parsed..");
			e.printStackTrace();
		}
		String status = request.getParameter("status");
		friend.setStatus(status);
		String actor= request.getParameter("actor");
		friend.setActor(actor);
		String actress= request.getParameter("actress");
		friend.setActress(actress);
		String cuisine= request.getParameter("cuisine");
		friend.setCuisine(cuisine);
		String destination= request.getParameter("destination");
		friend.setDestination(destination);
		String ideal = request.getParameter("ideal");
		friend.setIdeal(ideal);
		String profession= request.getParameter("profession");
		friend.setProfession(profession);
		String address = request.getParameter("address");
		friend.setAddress(address);
		String crush = request.getParameter("crush");
		friend.setCrush(crush);
		String bike = request.getParameter("bike");
		friend.setBike(bike);
		String email = request.getParameter("email");
		friend.setEmail(email);
		
		String id = request.getParameter("id");
		if(id==null||id.isEmpty()){
			dao.addFriend(friend);
			List<Friend> userList = dao.getList();
			request.setAttribute("link", "view");
			request.setAttribute("userList", userList);

		}else{
			friend.setId(Integer.parseInt(id));
			dao.updateFriend(friend);
			List<Friend> userList = dao.getList();
			request.setAttribute("link", "view");
			request.setAttribute("userList", userList);
		}
		
		RequestDispatcher view = request.getRequestDispatcher("ViewFriend.jsp");
		view.forward(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String forwardTo = "";
		
		String action = req.getParameter("action");
		outerif:
		if(action.equalsIgnoreCase("delete")){
			int id = Integer.parseInt(req.getParameter("id"));
			if(id != 0){
				dao.deleteFriend(id);
			}
			List<Friend> userList = dao.getList();
			req.setAttribute("link", "delete");
			forwardTo = "ViewFriend.jsp";
			req.setAttribute("userList", userList);
		}else if(action.equalsIgnoreCase("edit")){
			int id = Integer.parseInt(req.getParameter("id"));
			Friend friend;

			if(id != 0){
				friend = dao.getFriend(id);
				req.setAttribute("editThisFriend", friend);
				forwardTo = "AddFriends.jsp";
				break outerif;
			}
			forwardTo = "ViewFriend.jsp";
			List<Friend> userList = dao.getList();
			req.setAttribute("link", "edit");
			req.setAttribute("userList", userList);
		}else if(action.equalsIgnoreCase("view")){
			List<Friend> userList = dao.getList();
			req.setAttribute("link", "view");
			req.setAttribute("userList", userList);
			forwardTo = "ViewFriend.jsp";
		}else if(action.equalsIgnoreCase("post")){
			doPost(req, resp);
		}else if(action.equalsIgnoreCase("update")){
			
		}
		RequestDispatcher view = req.getRequestDispatcher(forwardTo);
		view.forward(req, resp);
	}
}



