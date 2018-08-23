package core;


import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/wordaa")
public class wordWrite extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		File f = new File("c:/iotest");
		if(f.exists()) 
			f.mkdirs();
		
		try(FileWriter writer = new FileWriter("c:/iotest/a.txt")) {
			writer.write(request.getParameter("word") + "    " + request.getParameter("word_mean"));
			writer.close();
		}
	}

}
