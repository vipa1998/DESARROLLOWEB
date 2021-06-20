package controlador;
import beans.Articulo;
import beans.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;
import java.io.OutputStream;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
//grafico de barras
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
//grafico de torta
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.xy.XYDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;

public class grafico3 extends HttpServlet {
 Negocio   obj=new Negocio();
   JFreeChart circulo(int an){
      DefaultPieDataset ds=new DefaultPieDataset();
      for(Compra x:obj.grafArt(an)){
          ds.setValue(""+x.getDes(), x.getCantidad());
      }
   
   
  //graficar en memoria
  JFreeChart fg=ChartFactory.createPieChart3D("Ventas del "+an, ds, true, true, true);
  return fg;  
}
//grafico de barras
JFreeChart barra(int an){
   DefaultCategoryDataset ds=new DefaultCategoryDataset(); //llenar la data a graficar
   int con=1;
   for(Compra  x:obj.grafArt(an)){
       ds.setValue(x.getCantidad(), "ventas",x.getCoda());
   }
  //graficar en memoria
  JFreeChart fg=ChartFactory.createBarChart3D("Ventas del "+an, "Articulo","Cantidad vendida", ds,
          PlotOrientation.VERTICAL,true, true,true);
  return fg;
   
} 
JFreeChart  Lineal(int an){
  XYSeries  ds=new XYSeries("serie1");
//llenar la data a graficar
int cuenta=1;
   for(Compra  x:obj.grafArt(an)){
       ds.add(cuenta, x.getCantidad());
    cuenta++;
       if(cuenta>an)break;
   }
   XYDataset  data=new XYSeriesCollection(ds);
  //graficar en memoria
  JFreeChart fg=ChartFactory.createXYLineChart("Ventas del "+an, "Articulo","Cantidad vendida", data,
          PlotOrientation.VERTICAL,true, true,true);
       
  return fg;
   
}  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("image/jpeg");
         OutputStream flujo=response.getOutputStream();
         int an=Integer.parseInt(request.getParameter("an"));
         int opc=Integer.parseInt(request.getParameter("opc"));
         switch(opc){
             case 1: ChartUtilities.writeChartAsJPEG(flujo, circulo(an), 650, 500);break;
             case 2: ChartUtilities.writeChartAsJPEG(flujo, barra(an),  650, 500);break;
             case 3: ChartUtilities.writeChartAsJPEG(flujo, Lineal(an),  650, 500);break;
             
         }
         flujo.close();
         
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
