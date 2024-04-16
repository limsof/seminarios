/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.emergentes.controlador;

import com.emergentes.modelo.estudiante;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author UnstopLim
 */
@WebServlet(name = "mainServlet", urlPatterns = {"/mainServlet"})
public class mainServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String op = request.getParameter("op");
        estudiante objetper = new estudiante();
        int id,pos;
        HttpSession ses = request.getSession();
        ArrayList<estudiante> lista =(ArrayList<estudiante>) ses.getAttribute("listaper");
      
        
        switch (op) {
            case "nuevo":
                  request.setAttribute("miobjper", objetper);
                  request.getRequestDispatcher("editar.jsp").forward(request, response);
                    
                break;
            case "editar":
                
                id = Integer.parseInt(request.getParameter("id"));
                //averiguar la posicion del elemento de la lista
                pos =buscarPorIndice(request,id);
                //obtener el objeto
                objetper = lista.get(pos);
                 request.setAttribute("miobjper", objetper);
                  request.getRequestDispatcher("editar.jsp").forward(request, response);

                break;
                
            case "eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                pos =buscarPorIndice(request,id);
                
                if(pos>0)
                {
                    lista.remove(pos);
                }
                //actualiza
                request.setAttribute("listaper",lista);
                   response.sendRedirect("index.jsp");
                break;
            default:
                throw new AssertionError();
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
         HttpSession ses = request.getSession();
        ArrayList<estudiante> lista = (ArrayList<estudiante>) ses.getAttribute("listaper");
        
        estudiante objper = new estudiante();
        objper.setId(id);
        objper.setFecha(request.getParameter("fecha"));
        objper.setNombre(request.getParameter("nombre"));
       objper.setApellidos(request.getParameter("apellidos"));
       
       objper.setTurno(request.getParameter("turno"));
       objper.setTipoSeminario(request.getParameter("tipoSeminario"));
       
       
       if(id == 0)
       {
           //nuevo registro
           int idNuevo = obtenerId(request);
           objper.setId(idNuevo);
           lista.add(objper);
           
       }
       else
       {
           //edicion
           int pos = buscarPorIndice(request, id);
           lista.set(pos,objper);
       }
       request.setAttribute("listaPer", lista);
       response.sendRedirect("index.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
        
    }
    
    
    
    
        public int buscarPorIndice(HttpServletRequest request,int id)
    {
        HttpSession ses = request.getSession();
        ArrayList<estudiante> lista = (ArrayList<estudiante>) ses.getAttribute("listaper");
        int pos =-1;
        
        if(lista != null)
        {
            for(estudiante ele: lista)
            {
                pos++;
                if(ele.getId()==id)
                {
                    break;
                }
            }
        }
        return pos; 
        
    }
    
    
    public int obtenerId(HttpServletRequest request)
    {
    
        HttpSession ses = request.getSession();
        ArrayList<estudiante> lista = (ArrayList<estudiante>) ses.getAttribute("listaper");
        //buscar el ultimo id
        int  idn = 0;
        for(estudiante ele: lista)
        {
            idn =ele.getId();
        }
        return idn +1;
        
    }

}
