<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de jogos</title>
        <link rel="stylesheet" href="table.css">
    </head>
    <body>
        <%
            String sql;
            PreparedStatement st;
            ResultSet resultado;
            //Conectar com o banco de dados
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/jogos", " ", " "); // (Colocar o login do banco de dados e senha entre as áspas " " )
            // Buscar todos os cursos da tabela curso Banco de dados
            sql = "SELECT * FROM games";
            st = conexao.prepareStatement(sql);
            resultado = st.executeQuery(); // Executa o SELECT
        %>
        <table>
            <tr>
                <th> Código   </th>
                <th> Nome     </th>
                <th> Categoria  </th>
                <th> Exclusão </th>
                <th> Alteração </th>
            </tr>      
            <%
                //Exibindo os cursos um por um
                while (resultado.next()) {
            %>
            <tr>
                <td> <%= resultado.getString("codigo")%>   </td>
                <td> <%= resultado.getString("nome")%>     </td>
                <td> <%= resultado.getString("categoria")%>  </td>
                <td> <a href="excjog.jsp?codigo=<%= resultado.getString("codigo")%>"> Excluir </a> </td>
                <td> <a href="carregajogo.jsp?codigo=<%= resultado.getString("codigo")%>"> Alterar </a> </td>
            </tr>    

            <%
                }
            %>
        </table>
    </body>
</html>
