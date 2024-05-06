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
import com.entity.Expanse;
import com.entity.User;

@WebServlet("/updateExpanse")
public class UpdateExpanseServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			int id = Integer.parseInt(req.getParameter("id"));
			String title = req.getParameter("title");
			String date = req.getParameter("date");
			String time = req.getParameter("time");
			String description = req.getParameter("description");
			String price = req.getParameter("price");
			
			HttpSession session = req.getSession();
			User user = (User)session.getAttribute("loginUser");
			
			Expanse ex = new Expanse(title, date, time, description, price, user);
			ex.setId(id);
			
			ExpanseDao dao = new ExpanseDao(HibernateUtil.getSessionFactory());
			
			boolean f=dao.updateExpanse(ex);
			
			if(f) {
				session.setAttribute("succMsg", "Expanse Updated Successfully");
				resp.sendRedirect("user/view_expense.jsp");
			}else {
				session.setAttribute("errorMsg", "Something Wrong on server");
				resp.sendRedirect("user/view_expense.jsp");
			
			}
		
	}
}
