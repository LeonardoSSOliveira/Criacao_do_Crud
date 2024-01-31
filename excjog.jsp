<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão de Jogos</title>
    </head>
    <body>
        <%
            // Declaração de variáveis
            String c, driver, caminhoBd, usuario, senha, sql;
            Connection conexao;
            PreparedStatement st;
            int resultado;

            //Receber o código digitado no form excur.html
            c = request.getParameter("codigo");
            try { //tentar
                //Conectar com o banco de dados
                driver = "com.mysql.cj.jdbc.Driver";
                Class.forName(driver);
                caminhoBd = "jdbc:mysql://localhost:3306/jogos"; // Caminho do banco de dados
                usuario = " "; // Falta colocar o login do banco de dados
                senha = " "; // Colocar a senha do banco de dados
                conexao = DriverManager.getConnection(caminhoBd, usuario, senha); // (nome do banco de dados, login e senha)
                //Excluir o jogos de código informado
                sql = "DELETE FROM games WHERE codigo = ?";
                st = conexao.prepareStatement(sql);
                st.setString(1, c); // completa o Delete no lugar do ?
                resultado = st.executeUpdate(); // executa o comando delete
                if (resultado == 1) {
                    //Mostra a mensagem de confirmação de exclusão
                    out.print("O jogo " + c + " foi apagado com sucesso!");
                } else {
                    out.print("O jogo de código" + c + " não está cadastrado!");
                }
            } catch (SQLException x) { // pegar
                out.print("Entre em contato com o suporte e informe o erro" + x.getErrorCode());
            }

        %>


    </body>
</html>
