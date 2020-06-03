package com.myweb.util.upload;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(
		location = "D:\\course\\Jsp\\upload", //임시로 업로드할 경로
		maxFileSize = -1,					  //최대파일허용크기
		maxRequestSize = -1,				  //요청에 대한 최대파일허용 크기
		fileSizeThreshold = 1024			  //임시저장하는 크기
		)

@WebServlet("/MultiUploadServlet")
public class MultiUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MultiUploadServlet() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String realFileName = "";
		ArrayList<String> list = new ArrayList<>(); //파일 이름을 추가할 리스트
		
		try {
			Collection<Part> parts = request.getParts();
			
			for(Part part : parts) {
//				System.out.println(part.getContentType());
//				System.out.println(part.getName());
				
				if(part.getHeader("Content-Dispostion").contains("filename=")) {
					if(part.getSize() > 0) {
						
						realFileName = part.getSubmittedFileName();
						part.write("D:\\course\\jsp\\upload\\" + realFileName);
						part.delete();
					}
					list.add(realFileName); //리스트에 추가
				}
			}
		} catch (Exception e) {
		}
		System.out.println(list.toString());
		
		/*
		 * Connection conn = null; PreparedStatement pstmt = null; try { conn =
		 * DriverManager.getConnection(url, user, password);
		 * 
		 * for(String fileName : list) { pstmt =
		 * conn.prepareStatement("insert into upload(id, filename) values(?,?)");
		 * pstmt.setString(1, "kkk123"); pstmt.setString(2, fileName);
		 * pstmt.executeUpdate(); }
		 * 
		 * }catch (Exception e) { // TODO: handle exception }
		 */
	}
}
