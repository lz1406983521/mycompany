package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
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
import com.orm.Tuser;
import com.service.liuService;

public class reply_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		
		  String type=req.getParameter("type");
		  String id=req.getParameter("id");
		  req.getSession().setAttribute("img", "images/title_reply.gif");
			if(type.endsWith("id")){
				req.getSession().setAttribute("gonggaoList", liuService.newsList(8,15,"news"));
				req.getSession().setAttribute("linkList", liuService.linkList());
				req.getSession().setAttribute("reply", liuService.replyListById(Integer.parseInt(id)));
				String targetURL = "/qiantai/replyDetail.jsp";
				dispatch(targetURL, req, res);
			}
			if(type.endsWith("list")){
				req.getSession().setAttribute("gonggaoList", liuService.newsList(8,15,"news"));
				req.getSession().setAttribute("replyList", liuService.replyList(20));
				req.getSession().setAttribute("linkList", liuService.linkList());
				String targetURL = "/qiantai/reply.jsp";
				dispatch(targetURL, req, res);
			}
			if(type.endsWith("comment")){
				req.getSession().setAttribute("gonggaoList", liuService.newsList(8,15,"news"));
				req.getSession().setAttribute("linkList", liuService.linkList());
				String targetURL = "/qiantai/comment.jsp";
				dispatch(targetURL, req, res);
			}
			if(type.endsWith("replyReg")){
				replyReg(req, res);
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
	
	public void replyReg(HttpServletRequest req,HttpServletResponse res)
	{
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		String email=req.getParameter("email");
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String addDate=formatter.format(new Date());
		String user="游客";
		if(req.getSession().getAttribute("user")!=null){
		   user=((Tuser)req.getSession().getAttribute("user")).getLoginname();
		}
		String sql="insert into t_reply (title,content,email,addDate,user) values(?,?,?,?,?)";
		Object[] params={title,content,email,addDate,user};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
        String targetURL = "/common/add_success.jsp";
		dispatch(targetURL, req, res);
	}
}
