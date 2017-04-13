<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Editar usuários</title>
    </head>
    <h1>Editar usuários</h1>
    <body>
        
        <form id="formInserirUsuario" name="frmCadastrar" method="post" action="cadUsuario.jsp?acao=editar">
            <label>Código:
                 <input name="tf_log_codigo" type="text" id="tf_log_codigo" size="20" maxlength="20" value="<%=request.getParameter("codigo")%>"/>                 
            </label>
            <p>

                <label>Login:
                    <input name="tf_log_usuario" type="text" id="tf_log_usuario" size="20" maxlength="20" value="<%=request.getParameter("usuario")%>"/>                 
                </label>
                <label>Senha:
                     <input name="tf_log_senha" type="password" id="tf_log_senha" size="20" maxlength="20" value="<%=request.getParameter("senha")%>"/>                 
                </label>
            </p>
            <p>
                <label>Nível:
                    <input name="tf_log_nivel" type="text" id="tf_log_nivel" size="5" maxlength="1" value="<%=request.getParameter("nivel")%>"/>
                </label>
            </p>
            <p>
                <label>
                    <input type="submit" name="Editar" id="editar" value="editar" />
                </label>
                <label></label>
                <input type="reset" name="Limpar" id="Limpar" value="Limpar" />
            </p>
        </form>

        <%try {
                Class.forName("com.mysql.jdbc.Driver");
                //out.println("Consegui carregar driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco_de_dados_faesp",
                        "root", "matheus");
                //out.println("Consegui conectar com sucesso");

                Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

                if (request.getParameter("acao") != null) {

                    if (request.getParameter("tf_log_usuario").length() == 0) { 

                        response.sendRedirect("cadUsuario.jsp");

                    } else {
                        if (request.getParameter("acao").contains("editar")) {
                            st.executeUpdate("INSERT INTO LOGIN VALUES (" + request.getParameter("tf_log_codigo")
                                    + ",'" + request.getParameter("tf_log_usuario") + "','" + request.getParameter("tf_log_senha")
                                    + "','" + request.getParameter("tf_log_nivel") + "')");
                        }
                    }
                }

            } catch (ClassNotFoundException erroClass) {

                out.println("Nao achei a Classe do Driver JDBC, erro: " + erroClass);

            } catch (SQLException erroSQL) {
                out.println("Erro de conexao com o banco: " + erroSQL);
            }


        %>

    </body>
</html>