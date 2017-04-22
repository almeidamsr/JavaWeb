<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Connection"%>

<%@page import="java.sql.Statement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>

    </head>

    <body>



        <%!
            Connection connection = null;

            Statement statement = null;

            ResultSet resultset = null;

            String acesso;

            String driver = "com.mysql.jdbc.Driver";

            String url = "jdbc:mysql://localhost:8080/faesp";

            String usuario = "root";

            String senha = "mysql";

            public void jspInit() {

                try {

                    Class.forName(driver);

                    connection = DriverManager.getConnection(url, usuario, senha);

                    statement = connection.createStatement();

                } catch (Exception erro) {

                    System.out.println("Erro!");

                }

            }

            public void jspDestroy() {

                try {

                    statement.close();

                    connection.close();

                } catch (Exception erro) {

                    System.out.println("Erro!");

                }

            }

        %>

        <%

            acesso = (String) session.getAttribute("login");

        %>

    </body>

</html>