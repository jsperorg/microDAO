
### 描述
`microDAO` 是一个极简的java数据库访问类，适用于小型应用。`microDAO`利用了java中`List`、`map`的特性，通过对查询、更新的封装，使在jsp页面能更加简便的操作数据库。`microDAO`使用预编译上下文对象确保SQL安全，拒绝SQL注入。使用`microDAO`无需创建实体类，`microDAO`更新数据库直接使用sql语句，查询数据返回`List<<Map<key,value>>`的对象。

本类共有7个静态方法，三个受保护的方法：

> * public 不带参数的更新
> * public 带参数的更新
> * public 不带参数的查询
> * public 带参数的查询
> * protected 获得数据库连接
> * protected 关闭执行查询操作连接
> * protected 关闭执行更新操作连接

### 用法举例
jsp页面引入此类：
```
<%@ page language="java" import="java.util.*,microDAO.DB" pageEncoding="UTF-8"%>
```
jsp页面查询数据：
```
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
```
jsp页面展示数据：
```
<div><%=atc.get("article_content")%></div>
```
数据更新：
```
String sql="update table set field1 = ?,field2=? where id=?";
List<Object> par = new ArrayList<Object>();
par.add("field1 value");
par.add("field2 value");
par.add(1);
DB.update(sql,par);
```
