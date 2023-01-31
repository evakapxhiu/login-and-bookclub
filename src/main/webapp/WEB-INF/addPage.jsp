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
    <title>Book Club</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
<div class="container">

    <h1 class="d-flex flex-column justify-content-center align-items-center gap-2">Add to Your Book Shelf</h1>

    <a href="/home">back to shelves</a>

    <div class="container">
        <%--@elvariable id="book" type="java"--%>
        <form:form action="/books" modelAttribute="book" class="form" method="post">

            <div class="form-row">
                <form:errors path="title" class="error"/>
                <form:label for="title" path="title">Title:</form:label>
                <form:input type="text" path="title" class="form-control"/>
            </div>

            <div class="form-row">
                <form:errors path="author" class="error"/>
                <form:label for="author" path="author">Author:</form:label>
                <form:input type="text" path="author" class="form-control"/>
            </div>

            <div class="form-row">
                <form:errors path="thoughts" class="error"/>
                <form:label for="thoughts" path="thoughts">Thoughts:</form:label>
                <form:textarea path="thoughts" class="form-control"/>
            </div>

            <div class="form-row">
                <form:errors path="user" class="error"/>
                <form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
            </div>

            <div class="form-row">
                <input type="submit" value="Submit" class="btn-primary"/>
            </div>

        </form:form>
    </div>



</div>

</body>
</html>