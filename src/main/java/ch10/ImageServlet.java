package ch10;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;

@WebServlet(name = "Image", urlPatterns = {"/image"})
public class ImageServlet extends HttpServlet {
       
	final private String IMG_DATA_DIR = "C:\\IMAGE_DATA\\";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		
		File f = new File(IMG_DATA_DIR + name);
		
		response.setContentType("image/*");
		
		try (InputStream is = new FileInputStream(f); OutputStream os = response.getOutputStream()) {
			IOUtils.copy(is, os);
		}
		
	}


}
