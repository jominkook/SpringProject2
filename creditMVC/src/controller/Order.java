package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





/**
 * Servlet implementation class DoOrder
 */
@WebServlet("/DoOrder")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Order() {
        super();
        // TODO Auto-generated constructor stub
    }
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String item = request.getParameter("itemnumber");
		String desription = request.getParameter("desription");
		String price = request.getParameter("price");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String middlename = request.getParameter("middlename");
		String address = request.getParameter("address");
		String card = request.getParameter("card");
		String cardnum1 = request.getParameter("cardnumber1");
		String cardnum2 = request.getParameter("cardnumber2");
		
		
		
		request.setAttribute("itemnumber", item);
		request.setAttribute("desription", desription);
		request.setAttribute("price", price);
		request.setAttribute("firstname", firstname);
		request.setAttribute("middlename", middlename);
		request.setAttribute("lastname",lastname);
		request.setAttribute("address", address);
		request.setAttribute("card", card);
		request.setAttribute("cardnumber1", cardnum1);
		request.setAttribute("cardnumber2", cardnum2);
		
		
		
	
		
		
		
		

		String page;
		
		if(cardnum1.equals(cardnum2))
			page ="/view/order.jsp";
		else
			page="/view/errornum.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request,response);

		
		
		
	}
	

}
