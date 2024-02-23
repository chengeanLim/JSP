<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String driverName = "com.mysql.jdbc.Driver";
	String dbURL = "jdbc:mysql://localhost:8080/";
	String dbID = "able8080";
	String dbPW = "1111";
%>