package controlador;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.*;
import beans.*;
import com.google.gson.Gson;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
public class control extends HttpServlet {

          Negocio obj=new Negocio();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int opc=Integer.parseInt(request.getParameter("op"));
        if(opc==1)lisCat(request,response);
        if(opc==2)lisArt(request,response);
        if(opc==3)detalle(request,response);
        if(opc==4)lisCat2(request,response);
        if(opc==5)eliminarCategoria(request,response);
        if(opc==6)ModificarCategoria(request,response);
        if(opc==7)editarCategoria(request,response); 
        if(opc==8)adicionCategoria(request,response);
        if(opc==9)lisArt2(request,response);
        if(opc==10)adicionArt(request,response);
        if(opc==11)eliminarArt(request,response);
        if(opc==12)ModificarArt(request,response);
        if(opc==13)editarArt(request,response);
        if(opc==14)carrito(request,response);
        if(opc==15)borraItem(request,response);
        if(opc==16)listarTienda(request,response);
        if(opc==17)agregarTienda(request,response);
        if(opc==18)eliminarTienda(request,response);
        if(opc==19)editarTienda(request,response);
        if(opc==20)ModificarTienda(request,response);
        if(opc==21)Login(request,response);
        if(opc==22)Login2(request,response);
       // if(opc==23)Login3(request,response);
        if(opc==24)adicionCli(request,response);
        if(opc==25)subeimagen(request,response);
        if(opc==26)filtrar(request,response);
        if(opc==27)lisCatc(request,response);
        if(opc==28)lisArtc(request,response);
        if(opc==29)lisFac(request,response);
        
    }
    
      protected void lisFac(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      PrintWriter out=response.getWriter();
      Gson gs=new Gson();
      String id=request.getParameter("id");
      out.println(gs.toJson(obj.lisFactura(id)));  
      
    }
    protected void lisArtc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      PrintWriter out=response.getWriter();
      Gson gs=new Gson();
      String id=request.getParameter("id");//codigo de categoria
      out.println(gs.toJson(obj.listArt(id)));
    }
    
  protected void lisCatc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     request.setAttribute("dato",obj.lisCategoria());
     String pag="gArticulos/ComboArticulo.jsp";
     request.getRequestDispatcher(pag).forward(request, response);    
    }
  protected void filtrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     PrintWriter out=response.getWriter();
     String cad=request.getParameter("consulta");
      Gson gs=new Gson();
      out.print(gs.toJson(obj.filtraArt(cad)));      
    }
    
        protected void Login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses=request.getSession();
        String user=request.getParameter("user").trim();
        String clave=request.getParameter("clave").trim();
        Administrador ad=obj.BusAdmin(user);
        int sw=0;
        if(ad==null){
            request.setAttribute("dato", "Usuario no existe");
        }else{
            if(ad.getContrasena().equals(clave)){
                ses.setAttribute("administrador", ad);
                String pag="/gestion.jsp";
                request.getRequestDispatcher(pag).forward(request, response);
                sw=1;
            }else{
                request.setAttribute("dato", "Clave incorrecta");
            }
        }if(sw==0){
            String pag="/Login.jsp";
            request.getRequestDispatcher(pag).forward(request, response);}
          }
    
   protected void Login2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     HttpSession ses=request.getSession();
      String user=request.getParameter("user").trim();
      String clave=request.getParameter("clave").trim();
      Cliente cli=obj.BusCliente2(user);
      int sw=0;
      if(cli==null){
          request.setAttribute("dato", "Usuario no existe");
      }else{
          if(cli.getClave().equals(clave)){
              ses.setAttribute("cliente", cli);
              grabaFactura(request,response);
              sw=1;
          }else{
            request.setAttribute("dato", "Clave incorrecta");  
          }
          
      }
      if(sw==0){
      String pag="/Login2.jsp";
      request.getRequestDispatcher(pag).forward(request, response);
      }
     }

     protected void grabaFactura(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       HttpSession ses=request.getSession();
       Cliente cli=(Cliente) ses.getAttribute("cliente");
       List<Compra> lista=(ArrayList)ses.getAttribute("canasta");
       String fac=obj.grabaFac(cli.getCodc(), lista);
       double tot=0;
       for(Compra x:lista)tot+=x.total();
       request.setAttribute("factura", fac);
       request.setAttribute("cli",cli.getNom());
       request.setAttribute("total", tot);
       ses.setAttribute("cliente", null);
       ses.setAttribute("canasta", null);
       String pag="Compra/Resumen.jsp";
       request.getRequestDispatcher(pag).forward(request, response);
    }
        
    protected void ModificarTienda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String t=request.getParameter("id"); //recibe el codigo de especialidad
        request.setAttribute("dato", obj.BusTienda(t));
        String pag="gTienda/editTienda.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
          }
    protected void editarTienda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Tienda t=new Tienda();
        t.setId_tienda(request.getParameter("codigo"));
        t.setNom_tienda(request.getParameter("nombre"));
        t.setDir_tienda(request.getParameter("direccion"));
        t.setImagen(request.getParameter("imagen"));
        t.setTel(request.getParameter("tel"));
        obj.Modi_Tienda(t);
        listarTienda(request, response);
    }
         
         protected void eliminarTienda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod=request.getParameter("id"); //recibe el codigo de especialidad
        obj.eliminar_tienda(cod);
        listarTienda(request, response);
          }
      protected void agregarTienda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Tienda tienda=new Tienda();
        tienda.setNom_tienda(request.getParameter("nom"));
        tienda.setDir_tienda(request.getParameter("direccion"));
        tienda.setImagen(request.getParameter("foto"));
        tienda.setTel(request.getParameter("tel"));
        String cod=obj.Adi_Tienda(tienda);
        listarTienda(request, response);
          } 
 protected void lisCat(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     request.setAttribute("dato",obj.lisCategoria());
     String pag="Compra/pagCategoria.jsp";
     request.getRequestDispatcher(pag).forward(request, response);
       
    }
  protected void listarTienda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     request.setAttribute("dato",obj.lisTiendita());
     String pag="gTienda/pagListaTienda.jsp";
     request.getRequestDispatcher(pag).forward(request, response);
       
    }
  protected void lisArt(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String id=request.getParameter("id");
      request.setAttribute("dato",obj.listArt(id));
     String pag="Compra/pagArticulo.jsp";
     request.getRequestDispatcher(pag).forward(request, response); 
    }
   protected void detalle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String id=request.getParameter("id");
      request.setAttribute("dato",obj.busArt(id));
     String pag="Compra/pagDetalle.jsp";
     request.getRequestDispatcher(pag).forward(request, response);
       
    }
   protected void lisCat2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     request.setAttribute("dato",obj.lisCategoria());
     String pag="gCategoria/pagCategoria_1.jsp";
     request.getRequestDispatcher(pag).forward(request, response);
       
    }
  protected void eliminarCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod=request.getParameter("id"); //recibe el codigo de especialidad
        obj.eliminar_categoria(cod);
        lisCat2(request, response);
          }
  protected void ModificarCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cat=request.getParameter("id"); //recibe el codigo de especialidad
        request.setAttribute("dato", obj.BusCat(cat));
        String pag="gCategoria/editCategoria.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
          }
  protected void editarCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Categoria cat=new Categoria();
        cat.setCodc(request.getParameter("codc"));
        cat.setNomc(request.getParameter("nomc"));
        cat.setImagen(request.getParameter("imagen"));
        obj.Modi_Categoria(cat);
        lisCat2(request, response);
       /*
        request.setAttribute("dato", obj.LisAluGen());
       String pag="/pagLista.jsp";
       request.getRequestDispatcher(pag).forward(request, response);
       */
          } 
  protected void adicionCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Categoria cat=new Categoria();
        cat.setNomc(request.getParameter("nombre"));
        cat.setImagen(request.getParameter("imagen"));
        String cod=obj.Adi_cat(cat);
        lisCat2(request, response);
          }
  protected void lisArt2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod=request.getParameter("id");
        request.setAttribute("dato", obj.listArt(cod));
        HttpSession ses=request.getSession();
        ses.setAttribute("datoc", obj.BusCat(cod));
        String pag="gArticulos/PagArticulo3.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    protected void adicionArt(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Articulo a=new Articulo();
        HttpSession ses=request.getSession();
        Categoria c=(Categoria)ses.getAttribute("datoc");
        a.setCat(c.getCodc());
        a.setDes(request.getParameter("des"));
        a.setPrecio(Double.parseDouble(request.getParameter("pre")));
        a.setMarca(request.getParameter("mar"));
        a.setStk(Integer.parseInt(request.getParameter("stk")));
        a.setImagen(request.getParameter("imagen"));
          obj.Adi_art(a);
          request.setAttribute("dato",obj.listArt(c.getCodc()));
          String pag="gArticulos/PagArticulo3.jsp";
          request.getRequestDispatcher(pag).forward(request,response);
          }
     protected void eliminarArt(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String cod=request.getParameter("id"); 
        request.setAttribute("dato", obj.busArt(cod));
           obj.elim_Art(cod);
          HttpSession ses=request.getSession();
        Categoria c=(Categoria)ses.getAttribute("datoc");
          request.setAttribute("dato",obj.listArt(c.getCodc()));
          String pag="gArticulos/PagArticulo3.jsp";
          request.getRequestDispatcher(pag).forward(request,response);
        
          }
    protected void ModificarArt(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String art=request.getParameter("id"); 
        request.setAttribute("dato", obj.busArt(art));
        String pag="gArticulos/editArt.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
          }
  protected void editarArt(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         Articulo a=new Articulo();
         String art=request.getParameter("id");  
        a.setCoda(request.getParameter("coda"));
        a.setCat(request.getParameter("cat"));
        a.setDes(request.getParameter("des"));
        a.setPrecio(Double.parseDouble(request.getParameter("pre")));
        a.setMarca(request.getParameter("mar"));
        a.setStk(Integer.parseInt(request.getParameter("stk")));
        a.setImagen(request.getParameter("imagen"));
        obj.Modi_Art(a);
        HttpSession ses=request.getSession();
        Categoria c=(Categoria)ses.getAttribute("datoc");
          request.setAttribute("dato",obj.listArt(c.getCodc()));
          subeimagen(request,response);
          String pag="gArticulos/PagArticulo3.jsp";
          request.getRequestDispatcher(pag).forward(request,response);
          } 
     protected void carrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String coda=request.getParameter("coda");
       int can=Integer.parseInt(request.getParameter("cantidad"));
      Articulo ar=obj.busArt(coda);
      //el articulo buscado pasa al objeto compra
      Compra cp=new Compra();
      cp.setCantidad(can);
      cp.setCoda(coda);
      cp.setImagen(ar.getImagen());
      cp.setDes(ar.getDes());
      cp.setPrecio(ar.getPrecio());
      List<Compra> lista;
      HttpSession ses=request.getSession();
      if(ses.getAttribute("canasta")==null)
          lista=new ArrayList();
      else//recuperar lo que esta en la sesion
          lista=(ArrayList)ses.getAttribute("canasta");
     //agregar la compra
     lista.add(cp);
     //actualizar la sesion
     ses.setAttribute("canasta", lista);
      String pag="Compra/pagCompra.jsp";
      request.getRequestDispatcher(pag).forward(request, response);
    }
     protected void borraItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      HttpSession ses=request.getSession();
      int indice=Integer.parseInt(request.getParameter("id"));
      List <Compra> lista=(ArrayList)ses.getAttribute("canasta");
      lista.remove(indice);
      ses.setAttribute("canasta", lista);
     String pag="Compra/pagCompra.jsp";
     request.getRequestDispatcher(pag).forward(request, response);
       
    }
      protected void adicionCli(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cliente a=new Cliente();
        a.setNom(request.getParameter("nom"));
        a.setDir(request.getParameter("direccion"));
        a.setUsu(request.getParameter("correo"));
        a.setClave(request.getParameter("clave"));
          obj.Adi_cli(a);
      if(a==null){
      request.setAttribute("dato", "Usuario no creado");  
      }else{
        request.setAttribute("dato", "Usuario creado con usuario: "+a.getUsu());   
      }
          String pag="Login3.jsp";
          request.getRequestDispatcher(pag).forward(request,response);
          }
      protected void subeimagen(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //String arch="D:\\DESARROLLO WEB INTEGRADO\\lib\\AVANCE2.3\\build\\web\\files";
        String arch=getServletContext().getRealPath("/files");
        
        arch=arch.replaceAll("\\\\", "/");
        arch=arch.replaceAll("/build/", "/");
       
        out.print(arch);
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
     //request.getRequestDispatcher(pag).forward(request, response);
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
