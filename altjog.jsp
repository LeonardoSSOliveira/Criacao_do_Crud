<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //Declaração e variaveis
            String c, n, g, sql;
            Connection conexao;
            PreparedStatement st;
            
            c = request.getParameter("codigo");
            n = request.getParameter("nome");
            g = request.getParameter("categoria");
            try {
                //Conectar ao banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/jogos", " ", " "); // Colocar nome do banco de dados e senha entre as áspas " " 
                
                sql = "UPDATE games SET nome = ?, categoria = ? WHERE codigo =?";
                st = conexao.prepareStatement(sql);
                
                st.setString(1, n);
                st.setString(2, g);
                st.setString(3, c);
                st.executeUpdate(); //Executa o comando UPDATE
                out.print("O jogo de código " + c + " foi alterado com sucesso");
                
            } catch (SQLException erro) {
                out.print("Entre em contato com o suporte e informe o erro" + erro.getErrorCode());
            }
        %>
    </body>
</html>
