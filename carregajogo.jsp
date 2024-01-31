<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Dados do Jogo</title>
    </head>
    <body>
        <%
            //Declaação de variaveis
            String c, sql;
            Connection conexao;
            PreparedStatement st;
            ResultSet resultado;
             
            c = request.getParameter("codigo");
            try {
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/jogos", " ", " "); // Colocar o nome do banco de dados e senha entre as áspas " " 
               
                sql = "SELECT * FROM games WHERE codigo= ?";
                st = conexao.prepareStatement(sql);
                st.setString(1, c); 
                resultado = st.executeQuery(); 
                if (resultado.next()) { 
        %>
        <form method="post" action="altjog.jsp">
            <p>
                <label for="cod">Código:* </label>
                <input id="cod" readonly type="text" name="codigo" size="5" maxlength="5" required value="<%= resultado.getString("codigo")%>">
            </p>
            <p>
                <label for="nom">Nome:* </label>
                <input id="nom" type="text" name="nome" size="50" maxlength="50" required value="<%= resultado.getString("nome")%>">
            </p>
            <p>
                <label for="cat">Categoria </label>
                <input id="cat" type="text" name="categoria" size="15" maxlength="15" value="<%= resultado.getString("categoria")%>">
            </p>
            <p>
                <input type="submit" value="Salvar Alterações">
            </p>

        </form>             


        <%
                } else {
                    out.print("Este jogo de código " + c + " não está cadastrado");
                }
            } catch (SQLException erro) {
                out.print("Entre em contato com o suporte e informe o código de erro: " + erro.getErrorCode());
            }
        %>


    </body>
</html>
