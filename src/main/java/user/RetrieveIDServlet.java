package user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/retrieveIDServlet")
public class RetrieveIDServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 request.setCharacterEncoding("UTF-8");
         response.setCharacterEncoding("UTF-8");
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");

        UserDAO userDAO = new UserDAO();
        String userID = userDAO.findByUserId(userName, userEmail);

        if (userID != null) {
            request.setAttribute("userName", userName);
            request.setAttribute("userEmail", userEmail);
            request.setAttribute("userID", userID); // Set userID attribute if information matches
        } else {
            request.setAttribute("error", "일치하는 정보가 없습니다.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("retrieveID.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect GET requests to the retrieveID.jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("retrieveID.jsp");
        dispatcher.forward(request, response);
    }
}
