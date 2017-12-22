<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import="ajaxOnJava.*" %> 
<%
	HelloWorld h = new HelloWorld();
%>
<html>
<body>
	message = <%=h.hello() %>
	
	<h1>
			 Learnging Ajax On Java 
	</h1>
	<ul>
		<li><a href="./WebContent/AjaxOnJava/jsp/chapter3.jsp">chapter3. 간단한 Ajax 서블릿</a></li>
		<li><a href="./WebContent/AjaxOnJava/jsp/chapter4.jsp">chapter4. Ajax를 위한 XML과 JSON</a></li>
		<li><a href="./WebContent/AjaxOnJava/jsp/chapter5.jsp">chapter5. 데이터 저장 및 불러오기</a></li>
		<li><a href="./WebContent/AjaxOnJava/jsp/chapter6.jsp">chapter6. Ajax라이브러리와 툴킷</a></li>
		<li><a href="./WebContent/AjaxOnJava/jsp/chapter7.jsp">chapter7. Ajax를 위한 JSP 태그 라이브러리</a></li>
	</ul>

	
	mysql start : service mysql start<br>
	mysql stop  : service mysql stop<br/>
	mysql conn  : mysql -u root -p<br/>
	ls
	
	java -cp .:../lib/mysql-connector-java.jar ajaxOnJava.DbConn<br/>
	mysqlimport -d -u root -p AJAX .ZIPCODES.sql
    리눅스에서 이전 폴더로 이동하기 - cd -<br/>
	mysqld --verbose --help | grep -A 1 'Default options'<br/>
	
	파일 import시 에러 발생시<br/>
	mysql -u root -p --local-infile=1 database <br/>
	LOAD DATA LOCAL INFILE '/var/lib/mysql-files/ZIPCODES.sql' INTO TABLE ZIPCODES;	
	<br/>
	npm 설치 : http://programmingsummaries.tistory.com/374<br/>
	bower 설치 : https://blog.weirdx.io/post/9016<br/>

</body>	
</html>
