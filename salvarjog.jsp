<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //Receber os dados digitados no formulário
            String c, n, g;
           
            c = request.getParameter("codigo");
            n = request.getParameter("nome");
            g = request.getParameter("categoria");
            
            try {
                //Conectar com o Banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/jogos", "root", "root"); // (nome do banco de dados, login e senha)

                String sql = "INSERT INTO games VALUES(?,?,?)";
                PreparedStatement st = conexao.prepareStatement(sql);
                st.setString(1, c);
                st.setString(2, n);
                st.setString(3, g);
       
                st.executeUpdate(); // Executa o INSERT gerado acima
                out.print("Jogo cadastrado com sucesso");
            } catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                if (mensagemErro.contains("Duplicate entry")) {
                    out.print("Este Jogo já está cadastrado");
                } else {
                    out.print("Entre em contato com o suporte e informe o erro " + mensagemErro);
                }
            }

        %>
    </body>

</html>
