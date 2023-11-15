package bbs; // 실제 패키지 경로에 맞게 수정

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LikeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bbsID = Integer.parseInt(request.getParameter("bbsID"));
        BbsDAO bbsDAO = new BbsDAO();
        int likeCount = bbsDAO.incrementLikeCount(bbsID);

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.print(likeCount);
        out.flush();
        out.close();
    }
}
