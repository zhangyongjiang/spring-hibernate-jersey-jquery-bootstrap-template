<%@ page contentType="text/html; charset=utf-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"
%>
      <div class="header">
        <ul class="nav nav-pills pull-right">
          <li class="active"><a href="#">Home</a></li>
          
          <c:if test="${empty me.id }">
          <li><a href='<c:url value="/user/signin/index.jsp.oo"/>'>Sign in</a></li>
          </c:if>
          
          <c:if test="${not empty me.id }">
          <li><a href='<c:url value="/user/signin/index.jsp.oo"/>'>Sign out</a></li>
          </c:if>
          
          <li><a href="#">About</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
        <h3 class="text-muted">Demo Project</h3>
      </div>
      
