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
import com.service.liuService;

public class gonggao_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		req.getSession().setAttribute("type", "gonggao");
		if(type.endsWith("gonggaoAdd"))
		{
			gonggaoAdd(req, res);
		}
		if(type.endsWith("gonggaoMana"))
		{
			gonggaoMana(req, res);
		}
		if(type.endsWith("gonggaoDel"))
		{
			gonggaoDel(req, res);
		}
		if(type.endsWith("gonggaoDetail"))
		{
			gonggaoDetail(req, res);
		}
		
		if(type.endsWith("gonggaoDetailQian"))
		{
			gonggaoDetailQian(req, res);
		}
		if(type.endsWith("gonggaoUpdate"))
		{
			gonggaoUpdate(req, res);
		}
	}
	
	
	public void gonggaoAdd(HttpServletRequest req,HttpServletResponse res)
	{
		
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		String shijian=new Date().toLocaleString();
		String img=req.getParameter("fujian");
		String subtype=req.getParameter("subtype");
		
		
		String sql="insert into t_news (title,content,shijian,img,subtype) values(?,?,?,?,?)";
		Object[] params={title,content,shijian,img,subtype};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "gonggao?type=gonggaoMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
        
	}
	
	public void gonggaoUpdate(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		String shijian=new Date().toLocaleString();
		String img=req.getParameter("fujian");
		String subtype=req.getParameter("subtype");
		
		
		String sql="update t_news set title='"+title+"',content='"+content+"',shijian='"+shijian+"',img='"+img+"',subtype='"+subtype+"' where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "gonggao?type=gonggaoMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
        
	}
	
	
	public void gonggaoDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="delete from t_news where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "gonggao?type=gonggaoMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void gonggaoMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List gonggaoList=new ArrayList();
		String sql="select * from t_news";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgonggao gonggao=new Tgonggao();
				
				gonggao.setId(rs.getString("id"));
				gonggao.setTitle(rs.getString("title"));
				gonggao.setContent(rs.getString("content"));
				gonggao.setShijian(rs.getString("shijian"));
				gonggao.setImg(rs.getString("img"));
				String subtype=rs.getString("subtype");
				if(subtype.equals("news")){
					subtype="新闻动态";
				}
				
				gonggao.setType(subtype);
				
				gonggaoList.add(gonggao);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("gonggaoList", gonggaoList);
		req.getRequestDispatcher("admin/gonggao/gonggaoMana.jsp").forward(req, res);
	}
	
	
	public void gonggaoDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		Tgonggao gonggao=new Tgonggao();
		
		String sql="select * from t_news where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			gonggao.setId(rs.getString("id"));
			gonggao.setTitle(rs.getString("title"));
			gonggao.setContent(rs.getString("content"));
			gonggao.setShijian(rs.getString("shijian"));
			gonggao.setType(rs.getString("subtype"));
			gonggao.setImg(rs.getString("img"));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("news", gonggao);
		req.getRequestDispatcher("admin/companyinfo/newsUpdate.jsp").forward(req, res);
	}
	
	public void gonggaoDetailQian(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		Tgonggao gonggao=new Tgonggao();
		
		String sql="select * from t_news where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			gonggao.setId(rs.getString("id"));
			gonggao.setTitle(rs.getString("title"));
			gonggao.setContent(rs.getString("content"));
			gonggao.setShijian(rs.getString("shijian"));
			gonggao.setType(rs.getString("subtype"));
			gonggao.setImg(rs.getString("img"));
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		req.getSession().setAttribute("gonggaoList", liuService.newsList(8,15,"news"));
		req.getSession().setAttribute("linkList", liuService.linkList());
		req.setAttribute("gonggao", gonggao);
		req.getRequestDispatcher("/qiantai/newsdetail.jsp").forward(req, res);
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
