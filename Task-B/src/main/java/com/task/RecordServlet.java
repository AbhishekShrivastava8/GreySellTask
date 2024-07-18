package com.task;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Records;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RecordServlet extends HttpServlet {
    private List<Records> records = new ArrayList<>();

//  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//      String action = request.getParameter("action");
//      if ("view".equals(action)) {
//          String email = request.getParameter("email");
//          Record record = records.stream().filter(r -> r.getEmail().equals(email)).findFirst().orElse(null);
//          request.setAttribute("record", record);
//          RequestDispatcher dispatcher = request.getRequestDispatcher("records.jsp");
//          dispatcher.forward(request, response);
//      } else {
//          request.setAttribute("records", records);
//          RequestDispatcher dispatcher = request.getRequestDispatcher("records.jsp");
//          dispatcher.forward(request, response);
//      }
//  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String name = request.getParameter("name");
      String email = request.getParameter("email");
      String phone = request.getParameter("phone");
      int age = Integer.parseInt(request.getParameter("age"));

      // Simple validation
      if (age < 18 || age > 25 || records.stream().anyMatch(r -> r.getEmail().equals(email)) || records.stream().anyMatch(r -> r.getPhone().equals(phone))) {
          response.sendRedirect("index.jsp?error=true");
          return;
      }

      Records record = new Records(name, email, phone, age);
      records.add(record);
      request.setAttribute("records", records);
    RequestDispatcher dispatcher = request.getRequestDispatcher("records.jsp");
    dispatcher.forward(request, response);
//      response.sendRedirect("records.jsp");
  }
}