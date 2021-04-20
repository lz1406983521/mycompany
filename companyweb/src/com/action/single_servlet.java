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
import com.orm.Tsingle;
import com.service.liuService;

public class single_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		 String type=req.getParameter("type");

			req.getSession().setAttribute("gonggaoList", liuService.newsList(8,15,"news"));
	
		 if(type.equals("intro")){
		   req.getSession().setAttribute("img", "images/title_introduce.gif");
		   req.getSession().setAttribute("intro", liuService.singleList("intro",0));
		   req.getRequestDispatcher("qiantai/single.jsp").forward(req, res);
		 }
		 if(type.equals("contact")){
			   req.getSession().setAttribute("img", "images/title_introduce.gif");
			   req.getSession().setAttribute("intro", liuService.singleList("contact",0));
			   req.getRequestDispatcher("qiantai/single.jsp").forward(req, res);
			 }
		 else if(type.equals("news")){
			 req.getSession().setAttribute("img", "images/title_news.gif");
			  req.getSession().setAttribute("newsAll", liuService.newsList(20,30,"news"));
			  req.getRequestDispatcher("qiantai/news.jsp").forward(req, res);
		 }
		 else if(type.equals("job")){
			 req.getSession().setAttribute("img", "images/title_job.gif");
			  req.getSession().setAttribute("newsAll", liuService.newsList(20,30,"job"));
			  req.getRequestDispatcher("qiantai/news.jsp").forward(req, res);
		 }
		 else if(type.equals("xc2")){
			 req.getSession().setAttribute("type", "xc");
			 req.getSession().setAttribute("img", "images/title_xc.gif");
			  req.getSession().setAttribute("newsAll", liuService.newsList(20,30,"xc2"));
			  req.getRequestDispatcher("qiantai/news.jsp").forward(req, res);
		 }
		 else if(type.equals("jt1")){
			 req.getSession().setAttribute("type", "jt");
			 req.getSession().setAttribute("img", "images/title_jt.gif");
			  req.getSession().setAttribute("newsAll", liuService.newsList(20,30,"jt1"));
			  req.getRequestDispatcher("qiantai/news.jsp").forward(req, res);
		 }
		 else if(type.equals("jt2")){
			 req.getSession().setAttribute("type", "jt");
			 req.getSession().setAttribute("img", "images/title_jt.gif");
			  req.getSession().setAttribute("newsAll", liuService.newsList(20,30,"jt2"));
			  req.getRequestDispatcher("qiantai/news.jsp").forward(req, res);
		 }
		 else if(type.equals("xc1")){
			 req.getSession().setAttribute("type", "xc");
			   req.getSession().setAttribute("img", "images/title_xc.gif");
			   req.getSession().setAttribute("intro", liuService.singleList("xc1",0));
			   req.getRequestDispatcher("qiantai/single.jsp").forward(req, res);
			 }
		 else if(type.equals("singleMana")){
			 singleMana(req,res);
		 }
		 else if(type.equals("singleUpdate")){
			 singleUpdate(req,res);
		 }
		 else if(type.equals("singleDetail")){
			 singleDetail(req,res);
		 }
		
		
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
	
	public void singleMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List singleList=new ArrayList();
		String sql="select * from t_single";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tsingle single=new Tsingle();
				
				single.setId(rs.getString("id"));
				single.setTitle(rs.getString("title"));
				single.setContent(rs.getString("content"));
				single.setImg(rs.getString("img"));
				single.setCreateTs(rs.getString("createTs"));
				String subtype=rs.getString("subtype");
				
				if(subtype.equals("intro")){
					subtype="企业简介";
				}
				if(subtype.equals("xc1")){
					subtype="景观导航";
				}
				single.setSubtype(rs.getString("subtype"));
				
				singleList.add(single);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("singleList", singleList);
		req.getRequestDispatcher("admin/single/singleMana.jsp").forward(req, res);
	}
	
	public void singleDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		Tsingle single=new Tsingle();
		String sql="select * from t_single where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			
			
			single.setId(rs.getString("id"));
			single.setTitle(rs.getString("title"));
			single.setContent(rs.getString("content"));
			single.setImg(rs.getString("img"));
			single.setSubtype(rs.getString("subtype"));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("single", single);
		req.getRequestDispatcher("admin/single/singleUpdate.jsp").forward(req, res);
	}
	
	public void singleUpdate(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		String shijian=new Date().toLocaleString();
		String img=req.getParameter("fujian");
		String subtype=req.getParameter("subtype");
		
		
		String sql="update t_single set title='"+title+"',content='"+content+"',img='"+img+"',subtype='"+subtype+"' where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "single?type=singleMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
        
	}
}
