package com.service;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.*;

public class liuService
{
	public static List catelogList()
	{
		List catelogList=new ArrayList();
		String sql="select * from t_catelog where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tcatelog catelog=new Tcatelog();
				catelog.setId(rs.getInt("id"));
				catelog.setName(rs.getString("name"));
				catelogList.add(catelog);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return catelogList;
	}
	
	public static String getUserName(String id)
	{
		String name="";
		
		String sql="select * from t_user where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			name=rs.getString("loginname");
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return name;
	}
	
	
	public static Tgoods getGoods(int id)
	{
		Tgoods goods=new Tgoods();
		
		String sql="select * from t_goods where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			goods.setId(rs.getInt("id"));
			goods.setCatelog_id(rs.getInt("catelog_id"));
			goods.setNannvkuan(rs.getString("nannvkuan"));
			goods.setBianhao(rs.getString("bianhao"));
			
			goods.setMingcheng(rs.getString("mingcheng"));
			goods.setJieshao(rs.getString("jieshao"));
			goods.setPinpai(rs.getString("pinpai"));
			goods.setFujian(rs.getString("fujian"));
			
			goods.setShichangjia(rs.getInt("shichangjia"));
			goods.setTejia(rs.getInt("tejia"));
			goods.setShifoutejia(rs.getString("shifoutejia"));
			goods.setKucun(rs.getInt("kucun"));
			goods.setDel(rs.getString("del"));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return goods;
	}
	
	
	public static List goodsNew(int num)
	{
		List goodsList=new ArrayList();
		String sql="select * from t_goods where del='no' and shifoutejia='fou' order by id desc limit 0,"+num;
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getInt("id"));
				goods.setCatelog_id(rs.getInt("catelog_id"));
				goods.setNannvkuan(rs.getString("nannvkuan"));
				goods.setBianhao(rs.getString("bianhao"));
				
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				goods.setPinpai(rs.getString("pinpai"));
				goods.setFujian(rs.getString("fujian"));
				
				goods.setShichangjia(rs.getInt("shichangjia"));
				goods.setTejia(rs.getInt("tejia"));
				goods.setShifoutejia(rs.getString("shifoutejia"));
				goods.setKucun(rs.getInt("kucun"));
				goods.setDel(rs.getString("del"));
				
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		if(goodsList.size()>12)
		{
			goodsList=goodsList.subList(0, 12);
		}
		return goodsList;
	}
	
	
	
	
	public static List goodsByCatelog(int catelog_id)
	{
		List goodsList=new ArrayList();
		String sql="select * from t_goods where del='no' and catelog_id="+catelog_id+" order by id desc";
		if(catelog_id==0){
			 sql="select * from t_goods where del='no' order by id desc";
		}
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getInt("id"));
				goods.setCatelog_id(rs.getInt("catelog_id"));
				goods.setNannvkuan(rs.getString("nannvkuan"));
				goods.setBianhao(rs.getString("bianhao"));
				
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				goods.setPinpai(rs.getString("pinpai"));
				goods.setFujian(rs.getString("fujian"));
				
				goods.setShichangjia(rs.getInt("shichangjia"));
				goods.setTejia(rs.getInt("tejia"));
				goods.setShifoutejia(rs.getString("shifoutejia"));
				goods.setKucun(rs.getInt("kucun"));
				goods.setDel(rs.getString("del"));
				
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return goodsList;
	}
	
	
	
	
	
	
	public static void saveOrderItem(String id,String order_id,int goods_id,int goods_quantity)
	{
		String sql="insert into t_orderitem(id,order_id,goods_id,goods_quantity) values(?,?,?,?)";
		Object[] params={id,order_id,goods_id,goods_quantity};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	
	public static void updateGoodsKucun(int goods_id,int goods_quantity)
	{
		String sql="update t_goods set kucun=kucun-? where id=?";
		Object[] params={goods_quantity,goods_id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	
	

	
	
	
	
	
	public static List newsList(int n,int jj,String type){
		List gonggaoList=new ArrayList();
		String sql="select * from t_news where subtype='"+type+"' order by id desc";
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
				if(rs.getString("title").length()>jj){
				    gonggao.setTitle(rs.getString("title").substring(0,jj)+"..");
				}else{
					gonggao.setTitle(rs.getString("title"));
				}
				gonggao.setContent(rs.getString("content"));
				gonggao.setShijian(rs.getString("shijian"));
				gonggao.setImg(rs.getString("img"));
				
				gonggaoList.add(gonggao);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		if(gonggaoList.size()>n)
		{
			gonggaoList=gonggaoList.subList(0, n);
		}
		return gonggaoList;
	}
	
	
	public static List linkList(){
		List linkList=new ArrayList();
		String sql="select * from t_link order by createTs desc";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tlink link=new Tlink();
				
				link.setId(rs.getString("id"));
				link.setName(rs.getString("name"));
				link.setUrl(rs.getString("url"));
				link.setSubtype(rs.getString("subtype"));
				link.setCreateTs(rs.getString("createTs"));
				
				linkList.add(link);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		if(linkList.size()>3)
		{
			linkList=linkList.subList(0, 3);
		}
		return linkList;
	}
	
	
	
	public static List singleList(String type,int n){
		List singleList=new ArrayList();
		String sql="select * from t_single where subtype='"+type+"' order by createTs desc";
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
				if(n!=0){
					single.setContent(rs.getString("content").substring(0,n));
				}else{
				single.setContent(rs.getString("content"));
				}
				single.setImg(rs.getString("img"));
				single.setSubtype(rs.getString("subtype"));
				single.setCreateTs(rs.getString("createTs"));
				singleList.add(single);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return singleList;
	}
	
	public static List replyList(int n){
		List replyList=new ArrayList();
		String sql="select * from t_reply order by id desc";
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
				reply.setCreateTs(rs.getString("createTs"));
				
				replyList.add(reply);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		if(replyList.size()>n)
		{
			replyList=replyList.subList(0, n);
		}
		return replyList;
	}
	
	public static Treply replyListById(int id){
		List replyList=new ArrayList();
		String sql="select * from t_reply where id="+id+" order by id desc";
		Object[] params={};
		DB mydb=new DB();
		Treply reply=new Treply();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				
				reply.setId(rs.getInt("id"));
				reply.setUser(rs.getString("user"));
				reply.setTitle(rs.getString("title"));
				reply.setContent(rs.getString("content"));
				reply.setReply(rs.getString("reply"));
				reply.setAddDate(rs.getString("addDate"));
				reply.setReplyDate(rs.getString("replyDate"));
				reply.setEmail(rs.getString("email"));
				reply.setCreateTs(rs.getString("createTs"));
				
				replyList.add(reply);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return reply;
	}
	
	
	
	
	
	public static void saveOrder(Torder order)
	{
		String sql="insert into t_order(id,bianhao,shijian,zhuangtai,songhuodizhi,fukuanfangshi,jine,user_id) values(?,?,?,?,?,?,?,?)";
		Object[] params={order.getId(),order.getBianhao(),order.getShijian(),order.getZhuangtai(),order.getSonghuodizhi(),order.getFukuanfangshi(),order.getJine(),order.getUser_id()};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	
	
	
	
	public static List orderItemList(String order_id)
	{
		List orderitemList=new ArrayList();
		String sql="select * from t_orderitem where order_id=?";
		Object[] params={order_id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TorderItem orderItem=new TorderItem();
				
				orderItem.setId(rs.getString("id"));
				orderItem.setGoods(getGoods(rs.getInt("goods_id")));
				orderItem.setGoods_quantity(rs.getInt("goods_quantity"));
				
				orderitemList.add(orderItem);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return orderitemList;
	}
	
	public static List orderList(String user_id)
	{
		List orderList=new ArrayList();
		String sql="select * from t_order where user_id=?";
		Object[] params={user_id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Torder order=new Torder();
				
				order.setId(rs.getString("id"));
				order.setBianhao(rs.getString("bianhao"));
				order.setShijian(rs.getString("shijian"));
				order.setZhuangtai(rs.getString("zhuangtai"));
				order.setSonghuodizhi(rs.getString("songhuodizhi"));
				order.setFukuanfangshi(rs.getString("fukuanfangshi"));
				order.setJine(rs.getInt("jine"));
				order.setUser_id(rs.getString("user_id"));
				
				orderList.add(order);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return orderList;
	}
	
}
