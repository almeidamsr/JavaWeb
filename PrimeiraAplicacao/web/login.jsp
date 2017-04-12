<%-- 
    Document   : login
    Created on : 22/03/2017, 20:38:15
    Author     : Matheus
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!doctype html>

<html>

    <head>

        <meta charset="utf-8">

        <title>Login FAESP</title>

    </head>

    <body>

        <img src="logo.jpg">
        &nbsp
        &nbsp

        <form method="POST" action="">

            Nome <input type="text" name="nome" size="40" value="andre">

            <br>

            Senha <input type="text" name="senha" size="40" value="faesp">

            <br>

            <input type="submit" value="Acessar">

            <%

                try {
                    // carregar o driver jdbc (java/jre/lib/ext)
                    Class.forName("com.mysql.jdbc.Driver");
                    //out.println("Consegui carregar driver");

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco_de_dados_faesp",
                            "root", "matheus");
                    //out.println("Consegui conectar com sucesso");

                    Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                    //out.println("statement ok");

                    ResultSet rs = st.executeQuery("SELECT * FROM LOGIN WHERE LOG_USUARIO = '"
                            + request.getParameter("nome") + "' AND LOG_SENHA = '" + request.getParameter("senha") + "'");
                    // caso o SELECT retorne somente 1 row

                    //ResultSet rs = st.executeQuery("SELECT * FROM LOGIN");
                    //out.println("resultset ok");
//                    rs.first();
//
//                    out.println("usuario = " + rs.getString("log_usuario"));
//
//                    rs.next();
//
//                    out.println("usuario = " + rs.getString("log_usuario"));
//
//                    rs.next();
//
//                    out.println("usuario = " + rs.getString("log_usuario"));
//
//                    rs.next();
//
//                    out.println("usuario = " + rs.getString("log_usuario"));
                    if (rs.next()) {

                        response.sendRedirect("index.jsp");

                    } else {

                        out.println("Nome ou senha incorretos!");

                    }

                } catch (ClassNotFoundException erro) {
                    out.println("Nao achei a Classe do Driver JDBC, erro: " + erro);
                } catch (SQLException erroSQL) {
                    out.println("Erro de conexao com o banco: " + erroSQL);
                }


            %>

        </form>

    </body>

</html>
