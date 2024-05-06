package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpanseDao;
import com.db.HibernateUtil;

@WebServlet("/deleteExpanse")
public class DeleteExpanseServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("id"));
		
		ExpanseDao dao = new ExpanseDao(HibernateUtil.getSessionFactory());
		boolean f = dao.deleteExpanse(id);
		
		HttpSession session = req.getSession();
		
		if(f)
		{
			session.setAttribute("succMsg", "Delete Successfully");
			resp.sendRedirect("user/view_expense.jsp");
		}else {
			session.setAttribute("errorMsg", "Something Wrong on Server");
			resp.sendRedirect("user/view_expense.jsp");
		}
		
	}

	
}
