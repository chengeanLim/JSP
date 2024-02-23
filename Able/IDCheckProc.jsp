<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ include file="config.jsp" %>

<%
    String id =request.getParameter("id");
    Connection con = null;
    StringBuffer sql = new StringBuffer(); 
    sql.append(" SELECT count(user_id) as cnt ");
    sql.append(" FROM author ");
    sql.append(" WHERE user_id = ? ");

    int cnt = 0;

    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, dbID, dbPW);

        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, id);
     
        ResultSet result = pstmt.executeQuery();
        if (result.next()) {
            cnt = result.getInt("cnt");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>ID Check Result</title>
</head>

<body class="ID_check_mssg_All_background">
    <div class="ID_check_mssg_layoutAut">
        <main>
            <div class="id_check_mssg_show_card">
                <div class="id_check_mssg_showcard_ header">아이디 중복 확인 결과</div>

                <div class="mssgcard_body">
                    <div class="mb_3">
                        입력 ID : <span class="you_are_id_mssg"><% out.println(id); %></span>
                    </div>

                    <%
                        if (cnt ===0) {
                            out println("사용 가능한 아이디입니다.");
                            out.println("
                                <span>
                                    <a href='javascript:apply(\"" + id + "\")'>
                                        <button class="can_used_id_massgcard" style="float: right;">적용</button>
                                    </a>
                                </span>
                            ");
                    %>

                    <%
                        } else {
                            out.println("<p style='color: red'>해당 아이디는 사용할 수 없습니다.</p>"");
                        }
                    %>
                </div>

                <div class="comback_button">
                    <button class="comback_to_closebtn" onclick="window.close()">창 닫기</button>

                    <span><button class="id_check_try_agien_btn" onclick="history.back()">다시 시도</button></span>
                </div>
            </div>
        </main>
    </div>

    <script>
    	function apply(id){
            opener.document.joinForm.userid.value = id;
            window.close();
        }
    </script>

    <%
        }
            result.close();
        }
            catch(Exception e) {
            out.println("[author] 테이블 조회에 문제가 있습니다. <hr>");
            out.println(e.toString());
            e.printStackTrace();
            }
            finally {
            if(pstmt != null) pstmt.close();
            if(con != null) con.close();
            }
    %>

</body>
</html>