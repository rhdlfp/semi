package chacamList;

import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;


@WebServlet(urlPatterns = "/chacamList")
@MultipartConfig(maxFileSize=1024*1024*2, location="c:/Temp/img")
public class ChacamListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ChacamListDAO dao;
	private ServletContext ctx;
	
	private final String START_PAGE = "chacamList.jsp";
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new ChacamListDAO();
		ctx = getServletContext();
	}
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		dao = new ChacamListDAO();
		Method m;
		String view = null;
		
		if (action == null) {
			action = "ListChacam";
		}
		
		try {
			m = this.getClass().getMethod(action, HttpServletRequest.class);
			
			view = (String)m.invoke(this, request);
		} catch(NoSuchMethodException e) {
			e.printStackTrace();
			ctx.log("요청 action 없음!!");
			request.setAttribute("error", "action 파라미터가 잘못되었습니다!!");
			view = START_PAGE;
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		if(view.startsWith("redirect:/")) {
			String rview = view.substring("redirect:/".length());
			response.sendRedirect(rview);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
		
	}
	
	
	public String addChacamList(HttpServletRequest request) {
		
	    // 세션에서 로그인 정보 가져오기
	    HttpSession session = request.getSession();
	    String userID = (String) session.getAttribute("userID");
	    
	    // 로그인되지 않은 상태라면 로그인 화면으로 이동
	    if (userID == null) {
	        return "redirect:/login.jsp";
	    }
		
	    ChacamList n = new ChacamList();
	    List<String> fileNames = new ArrayList<>();

	    try {
	        Collection<Part> parts = request.getParts();
	        for (Part part : parts) {
	            String fileName = getFilename(part);
	            if (fileName != null && !fileName.isEmpty()) {
	                part.write(fileName);
	                fileNames.add("/img/" + fileName);
	            }
	        }

	        n.setUserID(userID);
	        BeanUtils.populate(n, request.getParameterMap());

	        for (int i = 0; i < Math.min(fileNames.size(), 5); i++) {
	            String fieldName = "img" + (i + 1);
	            BeanUtils.setProperty(n, fieldName, fileNames.get(i));
	        }

	        dao.addChacam(n);
	    } catch (Exception e) {
	        e.printStackTrace();
	        ctx.log("추가 과정에서 문제 발생!!");
	        request.setAttribute("error", "정상적으로 등록되지 않았습니다!!");
	        return ListChacam(request);
	    }

	    return "redirect:/chacamList?action=ListChacam";
	}
	
	
	  public String ListChacam(HttpServletRequest request) {
		  ArrayList<ChacamList> list;
		  try {
			  list = dao.getAll();
			  request.setAttribute("chacamlist", list);
		  } catch (Exception e) {
			  e.printStackTrace();
			  ctx.log("목록 생성 과정에서 문제 발생!!");
			  request.setAttribute("error", "목록이 정상적으로 처리되지 않았습니다!!");
		  }
		  return "chacamList.jsp";
	  }
	  
	  
 
	  
	  public String getChacam(HttpServletRequest request) {
		  int infoid = Integer.parseInt(request.getParameter("infoid"));
		  try {
			  ChacamList n = dao.getChacam(infoid);
			  
			  request.setAttribute("chacamlist", n);
		  } catch (SQLException e) {
			  e.printStackTrace();
			  ctx.log("뷰를 가져오는 과정에서 문제 발생!!");
			  request.setAttribute("error", "정상적으로 가져오지 못했습니다!!");
		  }
		  return "chacamView.jsp";
	  }
	  
	  
	  public String deleteChacam(HttpServletRequest request) {
		  int infoid = Integer.parseInt(request.getParameter("infoid"));
		  try {
			  dao.delChacam(infoid);
		  } catch (Exception e) {
			  e.printStackTrace();
			  ctx.log("삭제 과정에서 문제 발생!!");
			  request.setAttribute("error", "정상적으로 삭제되지 않았습니다!!");
			  return ListChacam(request);
		  }
		  return "redirect:/chacamList?action=ListChacam";
	  }
	  

	  public String generateRandomString() {
		    String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		    StringBuilder randomString = new StringBuilder();
		    Random random = new Random();

		    for (int i = 0; i < 10; i++) {
		        randomString.append(characters.charAt(random.nextInt(characters.length())));
		    }

		    return randomString.toString();
		}

		public String getFilename(Part part) {
		    String fileName = null;

		    String header = part.getHeader("content-disposition");
		    System.out.println("Header => " + header);

		    int start = header.indexOf("filename=");
		    String originalFileName = "";
		    
		    if (start >= 0) {
		        originalFileName = header.substring(start + 10, header.length() - 1);
		        
		        String extension = "";
		        int dotIndex = originalFileName.lastIndexOf('.');
		        if (dotIndex >= 0) {
		            extension = originalFileName.substring(dotIndex);
		        }

		        if (!originalFileName.isEmpty()) { // 파일 이름이 있는 경우에만 랜덤 이름 생성
		            String randomName = generateRandomString();
		            fileName = randomName + extension;
		            ctx.log("파일명:" + fileName);
		        } else {
		            // 파일 이름이 없는 경우, 빈값으로 파일 생성하지 않음
		            ctx.log("파일명: 파일 없음");
		            fileName = ""; // 빈값으로 설정
		        }
		    }

		    return fileName;
		}


}
