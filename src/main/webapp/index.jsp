<%@ page contentType="text/html; charset=utf-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"
%><!DOCTYPE html>
<html>
  <head>
    <title><jsp:include page="title.jsp.oo"></jsp:include></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href='<c:url value="/bootstrap/css/bootstrap.min.css"/>' rel="stylesheet" media="screen">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src='<c:url value="/bootstrap/js/html5shiv.js"/>'></script>
      <script src='<c:url value="/bootstrap/js/respond.min.js"/>'></script>
    <![endif]-->
    
    <style type="text/css">
        <jsp:include page="page-style.jsp.oo"></jsp:include>
    </style>
  </head>
  <body>
    <div class="container">
            <jsp:include page="header.jsp.oo"></jsp:include>
            <jsp:include page="content.jsp.oo"></jsp:include>
    </div>

    <script src='<c:url value="/scripts/jquery.js"/>'></script>
    <script src='<c:url value="/scripts/json2.js"/>'></script>
    <script src='<c:url value="/bootstrap/js/bootstrap.min.js"/>'></script>
    <script type="text/javascript">
    	<jsp:include page="page-script.jsp.oo"></jsp:include>
    </script>
  </body>
</html>
