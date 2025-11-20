package controller;

import java.io.IOException;
import java.sql.Connection;

import dao.PublicadorDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Publicador;

@WebServlet(name = "PublicadorServlet", urlPatterns = { "/publicadores" })
public class PublicadorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PublicadorDAO publicadorDAO;

	@Override
	public void init() throws ServletException {
		Connection connection = (Connection) getServletContext().getAttribute("dbConnection");
		if (connection != null) {
			publicadorDAO = new PublicadorDAO(connection);
		} else {
			throw new ServletException("Conexão com banco de dados não disponível");
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		try {
			if (action == null) {
				listarPublicadores(request, response);
			} else {
				switch (action) {
				case "novo":
					mostrarFormulario(request, response);
					break;
				case "editar":
					mostrarFormularioEdicao(request, response);
					break;
				case "excluir":
					excluirPublicador(request, response);
					break;
				case "relatorios":
					mostrarRelatorios(request, response);
					break;
				default:
					listarPublicadores(request, response);
					break;
				}
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		try {
			if ("adicionar".equals(action)) {
				adicionarPublicador(request, response);
			} else if ("atualizar".equals(action)) {
				atualizarPublicador(request, response);
			} else {
				listarPublicadores(request, response);
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	private void listarPublicadores(HttpServletRequest request, HttpServletResponse response) throws Exception {
		var publicadores = publicadorDAO.listarTodos();
		request.setAttribute("publicadores", publicadores);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/lista-publicadores.jsp");
		dispatcher.forward(request, response);
	}

	private void mostrarFormulario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/form-publicador.jsp");
		dispatcher.forward(request, response);
	}

	private void mostrarFormularioEdicao(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		Publicador publicador = publicadorDAO.buscarPorId(id);
		if (publicador != null) {
			request.setAttribute("publicador", publicador);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/form-publicador.jsp");
			dispatcher.forward(request, response);
		} else {
			response.sendRedirect("publicadores");
		}
	}

	private void mostrarRelatorios(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// Calcular totais para o relatório
		int totalPublicadores = publicadorDAO.getTotalPublicadores();
		int totalNormal = publicadorDAO.getTotalPorTipo(Publicador.TipoPublicador.NORMAL);
		int totalAuxiliar = publicadorDAO.getTotalPorTipo(Publicador.TipoPublicador.AUXILIAR);
		int totalRegular = publicadorDAO.getTotalPorTipo(Publicador.TipoPublicador.REGULAR);
		int totalEspecial = publicadorDAO.getTotalPorTipo(Publicador.TipoPublicador.ESPECIAL);

		int horasAuxiliar = publicadorDAO.getTotalHorasPorTipo(Publicador.TipoPublicador.AUXILIAR);
		int horasRegular = publicadorDAO.getTotalHorasPorTipo(Publicador.TipoPublicador.REGULAR);
		int horasEspecial = publicadorDAO.getTotalHorasPorTipo(Publicador.TipoPublicador.ESPECIAL);

		int estudosAuxiliar = publicadorDAO.getTotalEstudosPorTipo(Publicador.TipoPublicador.AUXILIAR);
		int estudosRegular = publicadorDAO.getTotalEstudosPorTipo(Publicador.TipoPublicador.REGULAR);
		int estudosEspecial = publicadorDAO.getTotalEstudosPorTipo(Publicador.TipoPublicador.ESPECIAL);

		request.setAttribute("totalPublicadores", totalPublicadores);
		request.setAttribute("totalNormal", totalNormal);
		request.setAttribute("totalAuxiliar", totalAuxiliar);
		request.setAttribute("totalRegular", totalRegular);
		request.setAttribute("totalEspecial", totalEspecial);
		request.setAttribute("horasAuxiliar", horasAuxiliar);
		request.setAttribute("horasRegular", horasRegular);
		request.setAttribute("horasEspecial", horasEspecial);
		request.setAttribute("estudosAuxiliar", estudosAuxiliar);
		request.setAttribute("estudosRegular", estudosRegular);
		request.setAttribute("estudosEspecial", estudosEspecial);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/relatorios.jsp");
		dispatcher.forward(request, response);
	}

	private void adicionarPublicador(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nome = request.getParameter("nome");
		Publicador.TipoPublicador tipo = Publicador.TipoPublicador.valueOf(request.getParameter("tipo"));
		int horas = Integer.parseInt(request.getParameter("horas"));
		int estudos = Integer.parseInt(request.getParameter("estudos"));
		boolean participou = request.getParameter("participou") != null;

		Publicador publicador = new Publicador(nome, tipo, horas, estudos, participou);
		publicadorDAO.adicionarPublicador(publicador);
		response.sendRedirect("publicadores");
	}

	private void atualizarPublicador(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		String nome = request.getParameter("nome");
		Publicador.TipoPublicador tipo = Publicador.TipoPublicador.valueOf(request.getParameter("tipo"));
		int horas = Integer.parseInt(request.getParameter("horas"));
		int estudos = Integer.parseInt(request.getParameter("estudos"));
		boolean participou = request.getParameter("participou") != null;

		Publicador publicador = new Publicador(nome, tipo, horas, estudos, participou);
		publicador.setId(id);
		publicadorDAO.atualizarPublicador(publicador);
		response.sendRedirect("publicadores");
	}

	private void excluirPublicador(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		publicadorDAO.excluirPublicador(id);
		response.sendRedirect("publicadores");
	}
}