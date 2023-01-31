<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>

<div class="container">
    <h1><c:out value="${book.title}"/></h1>

    <h3>Books from everyone shelves:</h3>
    <a href="/home">back to shelves</a>
    <div>

        <h2 class="text-danger"><c:out value="${book.user.username}"></c:out></h2>
        <h2>read</h2>
            <h2 class="text-success"> <c:out value="${book.title}"></c:out> </h2> <h2 class="text-primary"> by <c:out value="${book.author}"></c:out></h2>
    </div>
    <div class="container">
        <h4>Here are <c:out value="${book.user.username}"/>'s thoughts:</h4>
        <hr />

        <p><c:out value="${book.thoughts}"/></p>
        <hr />
    </div>
    <c:if test="${book.user.equals(user)}">
        <a href="/edit/${book.id}">Edit</a>
        <form:form action="/delete/${book.id}" method="delete">
            <button>Delete</button>
        </form:form>
    </c:if>

</div>

</body>
</html>