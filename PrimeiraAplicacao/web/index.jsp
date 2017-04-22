<%-- 
    Document   : cadastro
    Created on : 29/03/2017, 21:21:31
    Author     : Matheus
    ----------------------------------
--%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!doctype html>

<html>

    <head>

        <meta charset="utf-8">

        <title>Logins</title>

    </head>

    <body>

        <p><img src="logo.jpg">

            <br>

            <strong><u>Manutenção da base de logins</u></strong></p>

        <p><a href="notas.jsp">Notas</a></p>
        
        <p><a href="cadUsuario.jsp">Novo Registro</a></p>

        <p><a href="index.jsp?acao=crescente">Crescente</a></p>

        <p><a href="index.jsp?acao=decrescente">Decrescente</a></p>

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

                        if (request.getParameter("acao") != null) //
                        {
                            if (request.getParameter("acao").contains("excluir")) {
                                out.println("apagando " + request.getParameter("codigo"));
                                st.executeUpdate("DELETE FROM login where log_codigo = " + request.getParameter("codigo"));
                            }
                        }

                        ResultSet rs = st.executeQuery("SELECT * FROM LOGIN");

                        if (request.getParameter("acao") != null) {
                            if (request.getParameter("acao").contains("crescente")) {
                                rs = st.executeQuery("select * from login order by log_usuario");
                            }
                        }
                        if (request.getParameter("acao") != null) {
                            if (request.getParameter("acao").contains("decrescente")) {
                                rs = st.executeQuery("select * from login order by log_usuario desc");
                            }
                        }

                        while (rs.next()) {

                %>

                <tr>

                    <td><%=rs.getString("log_codigo")%></td>

                    <td><%=rs.getString("log_usuario")%></td>

                    <td><%out.println(rs.getString("log_senha")); %></td>

                    <td><%out.println(rs.getString("log_nivel"));%></td>

                    <td><a href="alteraUsuario.jsp?codigo=<%=rs.getString("log_codigo")%>&usuario=<%=rs.getString("log_usuario")%>&senha=<%=rs.getString("log_senha")%>&nivel=<%=rs.getString("log_nivel")%>"> Editar</td>

                    <td><a href="index.jsp?acao=excluir&codigo=<%=rs.getString("log_codigo")%>">APAGAR</a></td>

                </tr>

                <% }

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

<!--9.1 Mostra na tela TESTE TESTE TESTE.
9.1 Exibe a mesma mensagem.
10.1 Reprovado
10.1 sim
10.1 não mostra erro pois não tem o try e catch
11.1 o valor da nota
12.2 da erro porque era uma pagina html. inserir esse codigo acima < % @ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
16.2  st.executeQuery("SELECT * FROM LOGIN");
18.1 sim carregou
20.4 não permitir exibir a mensagem na primeira execução que sempre sera 0
24 são parametros especificos não interferem na execução da query
25 da erro sql e não cadastra
25 no tamanho dos inputs
25 não cadastra, o codigo é chave primaria
22.6 erro na execução da query
25.1 não permite entra no index sem login erro sql. no meu caso eu permiti.
22.6 Seria executeQuery ao inves de executeUpdate-->