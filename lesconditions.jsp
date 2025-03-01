<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur" name="valeur1">
    <p>Saisir la valeur 2 : <input type="text" id="inputValeur" name="valeur2">
    <p>Saisir la valeur 3 : <input type="text" id="inputValeur" name="valeur3">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String valeur1 = request.getParameter("valeur1"); %>
    <% String valeur2 = request.getParameter("valeur2"); %>
    <% String valeur3 = request.getParameter("valeur3"); %>

    <%-- Vérification de la condition entre les deux valeurs --%>
    <% if (valeur1 != null && valeur2 != null && valeur3 != null) { %>
        <%-- Conversion des valeurs en entiers pour la comparaison --%>
        <% int intValeur1 = Integer.parseInt(valeur1); %>
        <% int intValeur2 = Integer.parseInt(valeur2); %>
        <% int intValeur3 = Integer.parseInt(valeur3); %>
        
        <%-- Condition if pour comparer les valeurs --%>
        <% if (intValeur1 > intValeur2) { %>
            <p>Valeur 1 est supérieure à Valeur 2.</p>
        <% } else if (intValeur1 < intValeur2) { %>
            <p>Valeur 1 est inférieure à Valeur 2.</p>
        <% } else { %>
            <p>Valeur 1 est égale à Valeur 2.</p>
        <% } %>
   
    
<h2>Exercice 1 : Comparaison 1</h2>
<p>Ecrire un programme qui demande à l'utilisateur de saisir 3 valeurs (des chiffres),</br>
A, B et C et dites nous si la valeur de C est comprise entre A et B.</br>

    <p>A = <%= intValeur1 %></p>
    <p>B = <%= intValeur2 %></p>
    <p>C = <%= intValeur3 %></p>

<% if (intValeur1 < intValeur3 && intValeur3 < intValeur2) { %>

    <p> Oui C est compris entre A et B</p>
<% } else { %>
    <p> Non C n'est pas compris entre A et B</p>
<% } %>

<h2>Exercice 2 : Pair ou Impair ?</h2>
<p>Écrivez un programme pour vérifier si un nombre est pair ou impair en utilisant une structure if</p>
<% int modulo1 = intValeur1 % 2; %>
<% int modulo2 = intValeur2 % 2; %>
<% int modulo3 = intValeur3 % 2; %>

<p>A = <%= intValeur1 %></p>
<p>B = <%= intValeur2 %></p>
<p>C = <%= intValeur3 %></p>

<% if (modulo1 == 0) { %>
    <p>A est pair</p>
<% } else { %>
    <p>A est impair</p>
<% } %>

<% if (modulo2 == 0) { %>
    <p>B est pair</p>
<% } else { %>
    <p>B est impair</p>
<% } %>

<% if (modulo3 == 0) { %>
    <p>C est pair</p>
<% } else { %>
    <p>C est impair</p>
<% } %>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
