<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    Integer visitCount = new Integer(0);
    String visitCountKey = new String("visitCount");
    
    if(session.isNew()) {
        session.setAttribute(visitCountKey, visitCount);
    } else {
        visitCount = (Integer)session.getAttribute(visitCountKey);
        visitCount += 1;
    }
    
    out.println(visitCount);
    session.setAttribute(visitCountKey, visitCount);
    
    out.println("이 사이트에 사용자가 방문한 횟수는 " + visitCount + "번 입니다.\n");
%>
<html><body>
<h3>JSP Cooky, Session, File Test</h3>
<form action="Test.jsp">
    <input type = text name = "name" value = "Enter Anything">
    <input type = submit>
</form>
</body></html> // 안 됨 세션

//////////////////////////////////////////////////////////////////////////

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세션 카운터</title>
</head>
<body>
<%
    Integer countVisit = (Integer)session.getAttribute("countVisit");
    
    if(countVisit == null) {
        countVisit = new Integer(1);
    } else {
        int number = countVisit.intValue();
        number += 1;
        countVisit = new Integer(number);
    }
    
    session.setAttribute("countVisit", countVisit);
%>
<h3>이 사이트에 방문한 횟수는 <%=countVisit.intValue()%>번 입니다.</h3>
<br>
</body></html> // 세션

//////////////////////////////////////////////////////////////////////////

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> 
    <%@ page import="java.net.*"%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http- equiv=" Content- Type" content="text/html; charset=EUC-KR">

</head>

<body>

<%
request.setCharacterEncoding("utf-8"); 
           response.setCharacterEncoding("utf-8");

Cookie[] cookieArray =request.getCookies();

Cookie cookie = null;

int countNum =0;

String countStr="";

 

if(cookieArray!=null){

for(int i=0; i<cookieArray.length; i++){

if(cookieArray[i].getName().equals("counter")){

cookie=cookieArray[i];
cookie.setMaxAge(60*60*24) ;
break;

}

}

}

if(cookie!=null){

countNum = Integer.parseInt(cookie.getValue())+1;

countStr=Integer.toString(countNum);

cookie.setValue(countStr);

}

else{

cookie=new Cookie("counter","1");
cookie.setMaxAge(60*60*24) ;
}

 

response.addCookie(cookie);

%>

<h2>당신은 <%=cookie.getValue()%>

번째 방문하셨습니다.</h2>

</body>

</html> // 쿠키