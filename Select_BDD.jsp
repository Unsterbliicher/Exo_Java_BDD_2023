<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MariaDB via JSP</title>
</head>
<body>

<h2>Exercice 1 : Les films entre 2000 et 2015</h2>
<p>Extraire les films dont l'année est supérieur à l'année 2000 et inférieur à 2015.</p>
<% 
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "mysql";
    String password = "mysql";

        // Charger le pilote JDBC (pilote disponible dans WEB-INF/lib)
        Class.forName("org.mariadb.jdbc.Driver");

        // Établir la connexion
        Connection conn = DriverManager.getConnection(url, user, password);
        // Exemple de requête SQL
        String sql = "SELECT idFilm, titre, année FROM Film WHERE année >= 2000 AND année <= 2015";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        // Afficher les résultats (à adapter selon vos besoins)
        while (rs.next()) {
            String colonne1 = rs.getString("idFilm");
            String colonne2 = rs.getString("titre");
            String colonne3 = rs.getString("année");
            // Faites ce que vous voulez avec les données...
            //Exemple d'affichage de 2 colonnes
            out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "</br>");
        }

        // Fermer les ressources 
        rs.close();
        pstmt.close();
        conn.close();
    %>

<h2>Exercice 2 : Année de recherche</h2>
<p>Créer un champ de saisie permettant à l'utilisateur de choisir l'année de sa recherche.</p>

<form action="#" method="post">
    <p>Saisir une année : <input type="text" id="inputValeur" name="annee">
    <p><input type="submit" value="Afficher">
</form>


<%
    String annee = request.getParameter("annee");

    if (annee != null) { 
        conn = DriverManager.getConnection(url, user, password);
        String sqlRechercheAnnee = "SELECT idFilm, titre, année FROM Film WHERE année = " + annee;
        pstmt = conn.prepareStatement(sqlRechercheAnnee);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            String colonne1Annee = rs.getString("idFilm");
            String colonne2Annee = rs.getString("titre");
            String colonne3Annee = rs.getString("année");
            out.println("id : " + colonne1Annee + ", titre : " + colonne2Annee + ", année : " + colonne3Annee + "</br>");
        }
 
        rs.close();
        pstmt.close();
        conn.close();
    }

%>

<h2>Exercice 3 : Modification du titre du film</h2>
<p>Créer un fichier permettant de modifier le titre d'un film sur la base de son ID (ID choisi par l'utilisateur)</p>

    <form action="#" method="post">
        <label for="filmId">ID du film :</label>
        <input type="text" id="filmId" name="filmId">
        <label for="newTitle">Nouveau titre :</label>
        <input type="text" id="newTitle" name="newTitle">
        <input type="submit" value="Modifier">
    </form>

    <%
        String filmId = request.getParameter("filmId");
        String newTitle = request.getParameter("newTitle");

        if (filmId != null && newTitle != null) {
            conn = DriverManager.getConnection(url, user, password);
            int idToUpdate = Integer.parseInt(filmId);
            String updateSQL = "UPDATE Film SET titre = ? WHERE idFilm = ?";
            PreparedStatement updateStmt = conn.prepareStatement(updateSQL);
            updateStmt.setString(1, newTitle);
            updateStmt.setInt(2, idToUpdate);

            int rowsUpdated = updateStmt.executeUpdate();

            if (rowsUpdated > 0) {
                out.println("<p>Modification réussie pour le film avec l'ID " + idToUpdate + ". Son nouveau titre est : "+newTitle + ".</p>");
            } else {
                out.println("<p>Erreur aucune modification effectuée.</p>");
            }

            updateStmt.close();
        }
    %>

<h2>Exercice 4 : La valeur maximum</h2>
<p>Créer un formulaire pour saisir un nouveau film dans la base de données</p>

</body>
</html>
