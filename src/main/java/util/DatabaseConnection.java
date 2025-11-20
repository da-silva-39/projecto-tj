package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static final String URL = "jdbc:postgresql://localhost:5432/publicadores_db";
	private static final String USER = "postgres";
	private static final String PASSWORD = "jose200739";

	public static Connection getConnection() throws SQLException {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			throw new SQLException("Driver PostgreSQL não encontrado", e);
		}
		return DriverManager.getConnection(URL, USER, PASSWORD);
	}

	// Método para testar a conexão
	public static boolean testConnection() {
		try (Connection conn = getConnection()) {
			return conn != null && !conn.isClosed();
		} catch (SQLException e) {
			System.err.println("Erro ao testar conexão: " + e.getMessage());
			return false;
		}
	}
}