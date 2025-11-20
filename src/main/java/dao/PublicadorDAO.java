package dao;

import model.Publicador;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PublicadorDAO {
	private Connection connection;
 
	public PublicadorDAO(Connection connection) {
		this.connection = connection;
	}
 
	public void adicionarPublicador(Publicador publicador) throws SQLException {
		String sql = "INSERT INTO publicadores (nome, tipo_publicador, horas_mes, estudos_biblicos, participou, data_registro) VALUES (?, ?, ?, ?, ?, ?)";

		try (PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
			stmt.setString(1, publicador.getNome());
			stmt.setString(2, publicador.getTipoPublicador().name());
			stmt.setInt(3, publicador.getHorasMes());
			stmt.setInt(4, publicador.getEstudosBiblicos());
			stmt.setBoolean(5, publicador.isParticipou());
			stmt.setDate(6, new java.sql.Date(publicador.getDataRegistro().getTime()));
			stmt.executeUpdate();

			// Obter o ID gerado
			try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
				if (generatedKeys.next()) {
					publicador.setId(generatedKeys.getInt(1));
				}
			}
		}
	}

	public List<Publicador> listarTodos() throws SQLException {
		List<Publicador> publicadores = new ArrayList<>();
		String sql = "SELECT * FROM publicadores ORDER BY nome";

		try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

			while (rs.next()) {
				Publicador p = new Publicador();
				p.setId(rs.getInt("id"));
				p.setNome(rs.getString("nome"));
				p.setTipoPublicador(Publicador.TipoPublicador.valueOf(rs.getString("tipo_publicador")));
				p.setHorasMes(rs.getInt("horas_mes"));
				p.setEstudosBiblicos(rs.getInt("estudos_biblicos"));
				p.setParticipou(rs.getBoolean("participou"));
				p.setDataRegistro(rs.getDate("data_registro"));
				publicadores.add(p);
			}
		}
		return publicadores;
	}

	public void atualizarPublicador(Publicador publicador) throws SQLException {
		String sql = "UPDATE publicadores SET nome=?, tipo_publicador=?, horas_mes=?, estudos_biblicos=?, participou=? WHERE id=?";

		try (PreparedStatement stmt = connection.prepareStatement(sql)) {
			stmt.setString(1, publicador.getNome());
			stmt.setString(2, publicador.getTipoPublicador().name());
			stmt.setInt(3, publicador.getHorasMes());
			stmt.setInt(4, publicador.getEstudosBiblicos());
			stmt.setBoolean(5, publicador.isParticipou());
			stmt.setInt(6, publicador.getId());
			stmt.executeUpdate();
		}
	}

	public void excluirPublicador(int id) throws SQLException {
		String sql = "DELETE FROM publicadores WHERE id=?";

		try (PreparedStatement stmt = connection.prepareStatement(sql)) {
			stmt.setInt(1, id);
			stmt.executeUpdate();
		}
	}

	public Publicador buscarPorId(int id) throws SQLException {
		String sql = "SELECT * FROM publicadores WHERE id=?";

		try (PreparedStatement stmt = connection.prepareStatement(sql)) {
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				Publicador p = new Publicador();
				p.setId(rs.getInt("id"));
				p.setNome(rs.getString("nome"));
				p.setTipoPublicador(Publicador.TipoPublicador.valueOf(rs.getString("tipo_publicador")));
				p.setHorasMes(rs.getInt("horas_mes"));
				p.setEstudosBiblicos(rs.getInt("estudos_biblicos"));
				p.setParticipou(rs.getBoolean("participou"));
				p.setDataRegistro(rs.getDate("data_registro"));
				return p;
			}
		}
		return null;
	}

	// Métodos para relatórios
	public int getTotalPublicadores() throws SQLException {
		String sql = "SELECT COUNT(*) FROM publicadores";
		try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
			if (rs.next()) {
				return rs.getInt(1);
			}
		}
		return 0;
	}

	public int getTotalPorTipo(Publicador.TipoPublicador tipo) throws SQLException {
		String sql = "SELECT COUNT(*) FROM publicadores WHERE tipo_publicador = ?";
		try (PreparedStatement stmt = connection.prepareStatement(sql)) {
			stmt.setString(1, tipo.name());
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		}
		return 0;
	}

	public int getTotalHorasPorTipo(Publicador.TipoPublicador tipo) throws SQLException {
		String sql = "SELECT COALESCE(SUM(horas_mes), 0) FROM publicadores WHERE tipo_publicador = ?";
		try (PreparedStatement stmt = connection.prepareStatement(sql)) {
			stmt.setString(1, tipo.name());
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		}
		return 0;
	}

	public int getTotalEstudosPorTipo(Publicador.TipoPublicador tipo) throws SQLException {
		String sql = "SELECT COALESCE(SUM(estudos_biblicos), 0) FROM publicadores WHERE tipo_publicador = ?";
		try (PreparedStatement stmt = connection.prepareStatement(sql)) {
			stmt.setString(1, tipo.name());
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		}
		return 0;
	}
}