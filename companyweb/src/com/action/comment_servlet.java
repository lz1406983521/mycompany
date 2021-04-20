package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.TAdmin;
import com.orm.Tgonggao;
import com.orm.Treply;
import com.service.liuService;

public class comment_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		

		if(type.endsWith("commentMana"))
		{
			commentMana(req, res);
		}
		if(type.endsWith("commentDel"))
		{
			commentDel(req, res);
		}
		if(type.endsWith("commentDetail"))
		{
			commentDetail(req, res);
		}
		
		if(type.endsWith("commentUpdate"))
		{
			commentUpdate(req, res);
		}
	}
	
	
	
	public void commentUpdate(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String reply=req.getParameter("reply");
		String replyDate=new Date().toLocaleString();
		
		
		String sql="update t_reply set reply='"+reply+"',replyDate='"+replyDate+"' where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "comment?type=commentMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
        
	}
	
	
	public void commentDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="delete from t_reply where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "comment?type=commentMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void commentMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List replyList=new ArrayList();
		String sql="select * from t_reply";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Treply reply=new Treply();
				reply.setId(rs.getInt("id"));
				reply.setUser(rs.getString("user"));
				reply.setTitle(rs.getString("title"));
				reply.setContent(rs.getString("content"));
				reply.setReply(rs.getString("reply"));
				reply.setAddDate(rs.getString("addDate"));
				reply.setReplyDate(rs.getString("replyDate"));
				reply.setEmail(rs.getString("email"));
				
				replyList.add(reply);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("commentList", replyList);
		req.getRequestDispatcher("admin/comment/commentMana.jsp").forward(req, res);
	}
	
	
	public void commentDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		Treply reply=new Treply();
		
		String sql="select * from t_reply where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			reply.setId(rs.getInt("id"));
			reply.setUser(rs.getString("user"));
			reply.setTitle(rs.getString("title"));
			reply.setContent(rs.getString("content"));
			reply.setReply(rs.getString("reply"));
			reply.setAddDate(rs.getString("addDate"));
			reply.setReplyDate(rs.getString("replyDate"));
			reply.setEmail(rs.getString("email"));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("comment", reply);
		req.getRequestDispatcher("admin/comment/commentUpdate.jsp").forward(req, res);
	}
	

	
	
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (ServletException e) 
		{
                    e.printStackTrace();
		} 
		catch (IOException e) 
		{
			
		    e.printStackTrace();
		}
	}
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
	}
	
	public void destroy() 
	{
		
	}
}
