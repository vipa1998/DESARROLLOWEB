package controlador;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class sube extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
      // String arch="C:\\utp_2020\\web_integrado\\semana13\\PROYECTOTIENDA\\web\\files";
        String arch=getServletContext().getRealPath("/files");
        
        arch=arch.replaceAll("\\\\", "/");
        arch=arch.replaceAll("/build/", "/");
       
     //   out.print(arch);
        DiskFileItemFactory factory=new DiskFileItemFactory();
        factory.setSizeThreshold(1024);
        factory.setRepository(new File(arch));
        ServletFileUpload upload=new ServletFileUpload(factory);
        try{
            List<FileItem> partes=upload.parseRequest(request);
          for(FileItem item:partes){
              File file=new File(arch,item.getName());
              item.write(file);
          }
           request.setAttribute("dato1", "Archivo subido ok!!!");
        }catch(Exception ex){
            request.setAttribute("dato1", ex.getMessage());
        }
        String pag="gArticulos/editArt.jsp";
     request.getRequestDispatcher(pag).forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
