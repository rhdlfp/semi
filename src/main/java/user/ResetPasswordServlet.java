package user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String userEmail = request.getParameter("userEmail");

        UserDAO userDAO = new UserDAO();
        String userPassword = userDAO.resetUserPassword(userID, userEmail);

        if (userPassword != null) {
            request.setAttribute("userID", userID);
            request.setAttribute("userEmail", userEmail);
            request.setAttribute("userPassword", userPassword);
        } else {
            request.setAttribute("error", "일치하는 정보가 없습니다.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("passwordReset.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect GET requests to the passwordReset.jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("passwordReset.jsp");
        dispatcher.forward(request, response);
    }
}
