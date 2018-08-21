<%@ page language="java" import="java.util.*,microDAO.DB" pageEncoding="UTF-8"%>

<%
	String article_id = request.getParameter("id");
	Map<String, Object> atc = null;
	if(article_id!=null && !"".equals(article_id)){

		String sql = "select * from article where article_id = ?;";
		ArrayList<Object> par = new ArrayList<Object>();//参数集合
		par.add(article_id);
		//结果集合
		ArrayList<Map<String, Object>> atclst = DB.query(sql,par);
		if(atclst!=null && atclst.size()>0){
			atc = atclst.get(0);//取一行
		}else{
			//Todo
		}

	}
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><%=atc.get("article_title")%></title>
  </head>

  <body>
		<span class='atcarb'><%=atc.get("article_author")%></span>
		<hr>
		<div><%=atc.get("article_content")%></div>
  </body>
</html>
