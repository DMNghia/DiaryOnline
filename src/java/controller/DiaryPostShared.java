/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.DiarySharedDAO;
import dal.FriendDAO;
import dal.ProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Friend;

/**
 *
 * @author dmngh
 */
public class DiaryPostShared extends HttpServlet {

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
            out.println("<title>Servlet DiaryPostShared</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DiaryPostShared at " + request.getContextPath() + "</h1>");
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
        String user = request.getParameter("user");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");

        if (user != null && id_raw != null) {
            try {
                int id = Integer.parseInt(id_raw);
                int friendId = (new DiarySharedDAO()).findFriendID(a.getUsername(), user);
                boolean check = (new DiarySharedDAO()).checkDiarySharedExist(id, friendId);
                if (check) {
                    List<model.DiaryShared> list = (new DiarySharedDAO()).getDiaryPostShared(a.getUsername());
                    request.setAttribute("listDiaryShared", list);
                    request.getRequestDispatcher("diaryPostShared.jsp").forward(request, response);
                } else {
                    model.DiaryShared ds = new model.DiaryShared(id, friendId);
                    (new DiarySharedDAO()).insert(ds);
                    List<model.DiaryShared> list = (new DiarySharedDAO()).getDiaryPostShared(a.getUsername());
                    request.setAttribute("listDiaryShared", list);
                    request.getRequestDispatcher("diaryPostShared.jsp").forward(request, response);
                }
            } catch (NumberFormatException nfe) {

            }
        } else {
            List<model.DiaryShared> list = (new DiarySharedDAO()).getDiaryPostShared(a.getUsername());
            request.setAttribute("listDiaryShared", list);
            request.getRequestDispatcher("diaryPostShared.jsp").forward(request, response);
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
        String user = request.getParameter("username");
        String status = request.getParameter("status");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        boolean check = (new FriendDAO()).checkFriend(a.getUsername(), user);
        if (status.equals("ok")) {
            request.getRequestDispatcher("diary").forward(request, response);
        } else {
            if (check) {
                Friend f = new Friend(a.getUsername(), user);
                if ((new ProfileDAO()).getProfileByUsername(user) != null) {
                    (new FriendDAO()).insert(f);
                } else {
                    request.setAttribute("err", "Username not exist!");
                    request.getRequestDispatcher("addNewFriend.jsp").forward(request, response);
                }

            } else {
                request.setAttribute("username", user);
                request.setAttribute("err", "You already have this friend");
                request.getRequestDispatcher("addNewFriend.jsp").forward(request, response);
            }
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
