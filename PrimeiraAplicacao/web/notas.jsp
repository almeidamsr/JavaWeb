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

        <title>Notas</title>

    </head>

    <body>

        <p><img src="logo.jpg">

            <br>
            <%

                out.println("NOTAS DA TURMA DE SI");

                String nome = "Andre";

                String sobrenome = "Katayama";

                out.println("<h1>" + nome + sobrenome + "</h1>");

                double nota1 = 3.0, nota2 = 7.4, media;

                media = (nota1 + nota2) / 2;

                if (media >= 6) {
                    out.println("<h1> APROVADO </h1>");
                } else {
                    out.println("<h1> REPROVADO </h1>");
                }

                out.println("<br>");

                String[] nomes = {"Andre", "Katayama", "Santos", "Faculdade", "Anchieta"};

                for (int i = 0; i < 5; i++) {

                    out.println("<h2>Nome: " + nomes[i] + "</h2>");

                }

                out.println("<br>");

                for (String valor : nomes) {
                    out.println("<h2>Nome: " + valor + "</h2>");
                }

            %>

        </tbody>

    </table>

</body>

</html>