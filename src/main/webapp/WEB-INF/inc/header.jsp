<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">	
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    <title>Accueil</title>
</head>
<body>
    <header>
        <h1>Gestion des utilisateurs</h1>
    </header>
    <nav>
        <ul>
            <li><a href="<c:url value='/index.html' />">Accueil</a></li>
            <li><a href="<c:url value='/list' />"></a></li>
            <li><a href="<c:url value='/add' />">Ajouter</a></li>
        </ul>
    </nav>