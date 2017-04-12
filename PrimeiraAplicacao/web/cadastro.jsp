<%-- 
    Document   : cadastro
    Created on : 29/03/2017, 21:21:31
    Author     : Matheus
--%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!doctype html>

<html>

    <head>

        <meta charset="utf-8">

        <title>Logins</title>

    </head>

    <body>

        <p><img src="imagens/logo.jpg">

            <br>

            <strong><u>Manutenção da base de logins</u></strong></p>

        <p>Link 1: Novo Registro</p>

        <p>Link 2: Crescente </p>

        <p>Link 3: Decrescente</p>

        <table width="641" height="58" border="1">

            <tbody>

                <tr>

                    <td>Código</td>

                    <td>Nome</td>

                    <td>Senha</td>

                    <td>Nível</td>

                    <td>&nbsp;</td>

                    <td>&nbsp;</td>




                </tr>

                <%

                    try {

                        Class.forName("com.mysql.jdbc.Driver");
                        //out.println("Consegui carregar driver");

                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco_de_dados_faesp",
                                "root", "matheus");
                        //out.println("Consegui conectar com sucesso");

                        Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                        ResultSet rs = st.executeQuery("SELECT * FROM LOGIN");

                        while (rs.next()) {

                %>

                <tr>

                    <td><%=rs.getString("log_codigo")%></td>

                    <td><%=rs.getString("log_usuario")%></td>

                    <td><%out.println(rs.getString("log_senha")); %></td>

                    <td><%out.println(rs.getString("log_nivel"));%></td>

                    <td>Link 4: Editar</td>

                    <td><a href="cadastro.jsp?acao=excluir&codigo=<%=rs.getString("log_codigo")%>">APAGAR</a></td>

                </tr>

                <% }
                        if (request.getParameter("acao") != null) //
                        {
                            if (request.getParameter("acao").contains("excluir")) {
                                out.println("apagando " + request.getParameter("codigo"));
                                st.executeUpdate("DELETE FROM login where log_codigo = " + request.getParameter("codigo"));
                            }
                        }

                    } catch (ClassNotFoundException erroClass) {

                        out.println("Nao achei a Classe do Driver JDBC, erro: " + erroClass);

                    } catch (SQLException erroSQL) {

                        out.println("Erro de conexao com o banco: " + erroSQL);

                    }

                %>

            </tbody>

        </table>

    </body>

</html>