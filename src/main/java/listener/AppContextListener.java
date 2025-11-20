package listener;

import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import util.DatabaseConnection;

@WebListener
public class AppContextListener implements ServletContextListener {
  
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("Inicializando contexto da aplicação...");

		try {
			// Testar conexão com o banco
			if (DatabaseConnection.testConnection()) {
				Connection connection = DatabaseConnection.getConnection();
				sce.getServletContext().setAttribute("dbConnection", connection);
				System.out.println("Conexão com o banco de dados inicializada com sucesso.");
			} else {
				System.err.println("Falha ao conectar com o banco de dados.");
			}
		} catch (SQLException e) {
			System.err.println("Erro ao inicializar conexão com banco de dados: " + e.getMessage());
			e.printStackTrace();
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("Destruindo contexto da aplicação...");

		Connection connection = (Connection) sce.getServletContext().getAttribute("dbConnection");
		if (connection != null) {
			try {
				connection.close();
				System.out.println("Conexão com o banco de dados fechada com sucesso.");
			} catch (SQLException e) {
				System.err.println("Erro ao fechar conexão com banco de dados: " + e.getMessage());
			}
		}
	}
}