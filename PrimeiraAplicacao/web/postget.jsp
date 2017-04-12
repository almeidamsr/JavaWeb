<%-- 
    Document   : postget
    Created on : 22/03/2017, 20:23:55
    Author     : Matheus
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!doctype html>

<html>

    <head>

        <meta charset="utf-8">

        <title>Cadastro</title>

    </head>

    <body>

        O nome e a idade de entrada foram:

        <%

            String vnome;

            String vidade; //verificar porque não pode ser int , achar solução

            vnome = request.getParameter("nome");

            vidade = request.getParameter("idade");

            out.println("Nome: " + vnome + " ; Idade: " + vidade);

        %>

    </body>

</html>