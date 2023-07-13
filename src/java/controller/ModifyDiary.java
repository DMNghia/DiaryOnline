/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DiaryDAO;
import dal.FriendDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.Account;
import model.Diary;
import model.Profile;

/**
 *
 * @author dmngh
 */
public class ModifyDiary extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ModifyDiary</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModifyDiary at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        try {
            int id = Integer.parseInt(id_raw);
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("account");
            Diary d = (new DiaryDAO()).getDiaryById(id);
            List<Profile> list = (new FriendDAO()).getAll(a.getUsername());
            request.setAttribute("listFriends", list);
            request.setAttribute("diary", d);
            request.getRequestDispatcher("modifyDiary.jsp").forward(request, response);
        } catch (NumberFormatException nfe) {
            System.out.println("Error: " + nfe.getMessage());
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        LocalDate ld = LocalDate.now();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("YYYY-MM-dd");
        if (request.getParameter("save") != null) {
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("account");
            Diary d = new Diary(Integer.parseInt(id_raw), a.getUsername(), title, content, Date.valueOf(dtf.format(ld)));
            DiaryDAO dd = new DiaryDAO();
            dd.update(d);
            response.sendRedirect("diary");
        } else {
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("account");
            Diary d = new Diary(Integer.parseInt(id_raw), a.getUsername(), title, content, Date.valueOf(dtf.format(ld)));
            DiaryDAO dd = new DiaryDAO();
            dd.delete(d);
            response.sendRedirect("diary");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
