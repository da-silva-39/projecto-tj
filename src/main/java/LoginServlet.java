import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pass = request.getParameter("password");

        if ("anibaljw".equals(pass)) {

            // guarda o nome só para exibir depois
            HttpSession session = request.getSession();
            session.setAttribute("user", "Joao Anibal");

            response.sendRedirect("index.jsp");

        } else {
            request.setAttribute("error", "Password incorreta");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
