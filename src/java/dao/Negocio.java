package dao;
import beans.*;
import java.util.*;
import java.sql.*;
import util.MySQLConexion;
public class Negocio{

   
    public List<Categoria> lisCategoria() {
     List<Categoria> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_cat,nom_cat,imagen from categorias";
            PreparedStatement st = conn.prepareStatement(sql);
            //st.setString(1, cad);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Categoria a = new Categoria();
                a.setCodc(rs.getString(1));
                a.setNomc(rs.getString(2));
                a.setImagen(rs.getString(3));
	        lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    
    public List<Articulo> listArt(String id) {
          List<Articulo> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = " select id_producto,descrip,pre_producto,stk,e.imagen,marca,c.id_cat,nom_cat \n" +
" from electrodomesticos e, categorias c where c.id_cat=e.id_cat and c.id_cat=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Articulo a = new Articulo();
                a.setCoda(rs.getString(1));
                a.setDes(rs.getString(2));
                a.setPrecio(rs.getDouble(3));
                a.setStk(rs.getInt(4));
                a.setImagen(rs.getString(5));
                a.setMarca(rs.getString(6));
                a.setCat(rs.getString(7));
                a.setNomc(rs.getString(8));
	        lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    
       
    }
public List<Articulo> listArt2() {
          List<Articulo> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_producto,id_cat,descrip,pre_producto,stk,imagen,"
                    + "marca from electrodomesticos";
            PreparedStatement st = conn.prepareStatement(sql);
            //st.setString(1, id);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Articulo a = new Articulo();
                a.setCoda(rs.getString(1));
                a.setCat(rs.getString(2));
                a.setDes(rs.getString(3));
                a.setPrecio(rs.getDouble(4));
                a.setStk(rs.getInt(5));
                a.setImagen(rs.getString(6));
                a.setMarca(rs.getString(7));
	        lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    
       
    }
    
    public Articulo busArt(String id) {
         Articulo a = null;
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_producto,id_cat,descrip,pre_producto,stk,imagen,marca from electrodomesticos where id_producto=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
           if (rs.next()) {
                a = new Articulo();
                a.setCoda(rs.getString(1));
                a.setCat(rs.getString(2));
                a.setDes(rs.getString(3));
                a.setPrecio(rs.getDouble(4));
                a.setStk(rs.getInt(5));
                a.setImagen(rs.getString(6));
                a.setMarca(rs.getString(7));
	          }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return a;
    
    
    }
public List<Categoria> lisCategoria2() {
     List<Categoria> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_cat,nom_cat,imagen from categorias";
            PreparedStatement st = conn.prepareStatement(sql);
            //st.setString(1, cad);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Categoria a = new Categoria();
                a.setCodc(rs.getString(1));
                a.setNomc(rs.getString(2));
                a.setImagen(rs.getString(3));
	        lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    
    
    }
public void eliminar_categoria(String id){
        String codigo="";
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            //invocando a un procedure
            String sql = "Delete from categorias where id_cat=?";
            //PreparedStatement st2=conn.prepareStatement("insert into alumno(?,?,?,?,?)");
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
}
public void Modi_Categoria(Categoria cat){
          Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            //invocando a un procedure
            String sql = "{call cambia(?,?,?)}";
            //PreparedStatement st2=conn.prepareStatement("insert into alumno(?,?,?,?,?)");
            CallableStatement st = conn.prepareCall(sql);
            st.setString(1, cat.getCodc());
            st.setString(2, cat.getNomc());
            st.setString(3, cat.getImagen());
            st.executeUpdate();
          } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }  
    }
public Categoria BusCat(String id) {
        Categoria cat=null;
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_cat,nom_cat,imagen from categorias where id_cat=?";
            PreparedStatement st = conn.prepareStatement(sql);
             st.setString(1, id);
             ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
           if (rs.next()) {
                cat = new Categoria();
                cat.setCodc(rs.getString(1));
                cat.setNomc(rs.getString(2));
                cat.setImagen(rs.getString(3));
	     }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
       return cat;
    }
public String Adi_cat(Categoria cat){
        String codigo="";
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            //invocando a un procedure
            String sql = "{call spadicion(?,?)}";
            //PreparedStatement st2=conn.prepareStatement("insert into alumno(?,?,?,?,?)");
            CallableStatement st = conn.prepareCall(sql);
            st.setString(1, cat.getNomc());
            st.setString(2, cat.getImagen());
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            if (rs.next())
               codigo=rs.getString(1);
           
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return codigo;  
        
        
    }
public String Adi_art(Articulo cat){
        String codigo="";
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            //invocando a un procedure
            String sql = "{call spadicionArt(?,?,?,?,?,?)}";
            //PreparedStatement st2=conn.prepareStatement("insert into alumno(?,?,?,?,?)");
            CallableStatement st = conn.prepareCall(sql);
            st.setString(1, cat.getCat());
            st.setString(2, cat.getDes());
            st.setDouble(3, cat.getPrecio());
            st.setString(4, cat.getMarca());
            st.setInt(5, cat.getStk());
            st.setString(6, cat.getImagen());
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            if (rs.next())
               codigo=rs.getString(1);
           
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return codigo;  
        
        
    }
public void elim_Art(String id) {
     Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "{call spanula(?)}";
            CallableStatement st = conn.prepareCall(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
         } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
    
    
    }

public void Modi_Art(Articulo cat){
          Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            //invocando a un procedure
            String sql = "{call cambiaArt(?,?,?,?,?,?,?)}";
            //PreparedStatement st2=conn.prepareStatement("insert into alumno(?,?,?,?,?)");
            CallableStatement st = conn.prepareCall(sql);
            st.setString(1, cat.getCoda());
            st.setString(2, cat.getCat());
            st.setString(3, cat.getDes());
            st.setDouble(4, cat.getPrecio());
            st.setString(5, cat.getMarca());
            st.setInt(6, cat.getStk());
            st.setString(7, cat.getImagen());
            st.executeUpdate();
          } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }  
    }
public List<Tienda> lisTiendita() {
     List<Tienda> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = " select id_tienda,nom_tienda,dir_tienda,imagen,telf from tienda ";
            PreparedStatement st = conn.prepareStatement(sql);
            //st.setString(1, cad);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Tienda t = new Tienda();
                t.setId_tienda(rs.getString(1));
                t.setNom_tienda(rs.getString(2));
                t.setDir_tienda(rs.getString(3));
                t.setImagen(rs.getString(4));
                t.setTel(rs.getString(5));
	        lis.add(t);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }

public String Adi_Tienda(Tienda t){
        String codigo="";
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            //invocando a un procedure
            String sql = "{call spAdicionTienda(?,?,?,?)}";
            //PreparedStatement st2=conn.prepareStatement("insert into alumno(?,?,?,?,?)");
            CallableStatement st = conn.prepareCall(sql);
            st.setString(1, t.getNom_tienda());
            st.setString(2, t.getDir_tienda());
            st.setString(3, t.getImagen());
            st.setString(4, t.getTel());
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            if (rs.next())
               codigo=rs.getString(1);
           
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return codigo;  
        
        
    }
public void eliminar_tienda(String id){
        String codigo="";
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            //invocando a un procedure
            String sql = "Delete from tienda where id_tienda=?";
            //PreparedStatement st2=conn.prepareStatement("insert into alumno(?,?,?,?,?)");
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
   }
}
public void Modi_Tienda(Tienda t){
          Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            //invocando a un procedure
            String sql = " {call cambiat(?,?,?,?,?)} ";
            //PreparedStatement st2=conn.prepareStatement("insert into alumno(?,?,?,?,?)");
            CallableStatement st = conn.prepareCall(sql);
            st.setString(1, t.getId_tienda());
            st.setString(2, t.getNom_tienda());
            st.setString(3, t.getDir_tienda());
            st.setString(4, t.getImagen());
            st.setString(5, t.getTel());
            st.executeUpdate();
          } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }  
    }
public Tienda BusTienda(String id) {
        Tienda t=null;
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_tienda,nom_tienda,dir_tienda,imagen,telf from tienda where id_tienda=?";
            PreparedStatement st = conn.prepareStatement(sql);
             st.setString(1, id);
             ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
           if (rs.next()) {
                t = new Tienda();
                t.setId_tienda(rs.getString(1));
                t.setNom_tienda(rs.getString(2));
                t.setDir_tienda(rs.getString(3));
                t.setImagen(rs.getString(4));
                t.setTel(rs.getString(5));
	     }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
       return t;
    }
    public String grabaFac(String id, List<Compra> lista) {
      String fac="";
      double sm=0;
      for(Compra x:lista) sm=sm+x.total();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "{call spfactura(?,?)}";
            CallableStatement st = conn.prepareCall(sql);
            st.setString(1,id);
            st.setDouble(2, sm);
            ResultSet rs = st.executeQuery();
            //llenar el array list con la clase entidad
            rs.next();//leer el valor devuleto
            fac=rs.getString(1);
            //grabar detalle
            String sql2="{call spdetalle(?,?,?)}";
            CallableStatement st2 = conn.prepareCall(sql2);
            for(Compra x:lista){//recorrer lista de compras
                st2.setString(1, fac);
                st2.setString(2, x.getCoda());
                st2.setInt(3,x.getCantidad());
                st2.executeUpdate();
            }
         } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
   return fac;
    }
public Administrador BusAdmin(String id) {
        Administrador cat=null;
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "select nom_admi,contrasena from administrador where id_admi=?";
            PreparedStatement st = conn.prepareStatement(sql);
             st.setString(1, id);
             ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
           if (rs.next()) {
                cat = new Administrador();
                cat.setNom_admi(rs.getString(1));
                cat.setContrasena(rs.getString(2));
	     }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
       return cat;
    }
public Cliente BusCliente(String id) {
        Cliente cat=null;
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_cliente,nom_cliente,dir_cliente,clave from cliente where id_cliente=?";
            PreparedStatement st = conn.prepareStatement(sql);
             st.setString(1, id);
             ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
           if (rs.next()) {
                cat = new Cliente();
                cat.setCodc(rs.getString(1));
                cat.setNom(rs.getString(2));
                cat.setDir(rs.getString(3));
                cat.setClave(rs.getString(4));
	     }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
       return cat;
    }
public Cliente BusCliente2(String id) {
        Cliente cat=null;
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_cliente,nom_cliente,dir_cliente,clave,usuario from cliente where usuario=?";
            PreparedStatement st = conn.prepareStatement(sql);
             st.setString(1, id);
             ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
           if (rs.next()) {
                cat = new Cliente();
                cat.setCodc(rs.getString(1));
                cat.setNom(rs.getString(2));
                cat.setDir(rs.getString(3));
                cat.setClave(rs.getString(4));
                cat.setUsu(rs.getString(5));
                
	     }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
       return cat;
    }
   public List<Articulo> lisGenArt() {
 List<Articulo> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_producto,descrip,pre_producto,stk,imagen,id_cat,marca from "
                    + " electrodomesticos";
            PreparedStatement st = conn.prepareStatement(sql);
           
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Articulo a = new Articulo();
                a.setCoda(rs.getString(1));
                a.setDes(rs.getString(2));
                a.setPrecio(rs.getDouble(3));
                a.setStk(rs.getInt(4));
                a.setImagen(rs.getString(5));
                a.setCat(rs.getString(6));
                 a.setMarca(rs.getString(7));
	        lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
return lis;
    }
       public List<Resumen> lisMes(int an) {
   List<Resumen> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "{call spmes(?)} ";
            CallableStatement st = conn.prepareCall(sql);
             st.setInt(1, an);
            //los datos son llevados a la RAM
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Resumen a = new Resumen();
                a.setMes(rs.getInt(1));
                a.setCantidad(rs.getInt(2));
                a.setTotal(rs.getDouble(3));
                lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    
    
    }
       
   public List<Compra> grafArt(int an) {
   List<Compra> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "{call spart(?)} ";
            CallableStatement st = conn.prepareCall(sql);
             st.setInt(1, an);
            //los datos son llevados a la RAM
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Compra a = new Compra();
                a.setCoda(rs.getString(1));
                a.setDes(rs.getString(2));
                a.setCantidad(rs.getInt(3));
                a.setTotal(rs.getDouble(4));
                lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    public List<Resumen> listAño() {
          List<Resumen> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT year(fecha) as año from fac_cabe GROUP BY año";
            PreparedStatement st = conn.prepareStatement(sql);
            //st.setString(1, id);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Resumen a = new Resumen();
                a.setAño(rs.getInt(1));
	        lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    
       
    }
    public List<Cliente> grafCli(int an) {
   List<Cliente> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "{call gcli(?)} ";
            CallableStatement st = conn.prepareCall(sql);
             st.setInt(1, an);
            //los datos son llevados a la RAM
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                  Cliente a = new Cliente();
                a.setCodc(rs.getString(1));
                a.setTotal(rs.getDouble(2));
                a.setNom(rs.getString(3));
	        lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
   /* public List<Cliente> grafCli() {
          List<Cliente> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT f.id_cliente, SUM(f.total) TOTAL FROM FAC_CABE F, cliente c WHERE f.id_cliente=c.id_cliente GROUP BY c.id_cliente limit 5";
            PreparedStatement st = conn.prepareStatement(sql);
            //st.setString(1, id);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Cliente a = new Cliente();
                a.setCodc(rs.getString(1));
                a.setTotal(rs.getDouble(2));
	        lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
     */
    
      public List<Compra> grafArt2() {
          List<Compra> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = " select f.id_producto,e.descrip, sum(f.can_producto) as cantidad,sum(f.can_producto*e.pre_producto) as total \n" +
" from fac_deta f, fac_cabe c, electrodomesticos e  \n" +
" Where f.id_factura=c.id_factura AND f.id_producto=e.id_producto GROUP by id_producto order by total desc limit 5 ";
            PreparedStatement st = conn.prepareStatement(sql);
            //st.setString(1, id);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                 Compra a = new Compra();
                a.setCoda(rs.getString(1));
                a.setDes(rs.getString(2));
                a.setCantidad(rs.getInt(3));
                a.setTotal(rs.getDouble(4));
                lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
      
      public String Adi_cli(Cliente cat){
        String codigo="";
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            //invocando a un procedure
            String sql = "{call spcli(?,?,?,?)}";
            //PreparedStatement st2=conn.prepareStatement("insert into alumno(?,?,?,?,?)");
            CallableStatement st = conn.prepareCall(sql);
            st.setString(1, cat.getNom());
            st.setString(2, cat.getDir());
            st.setString(3, cat.getClave());
            st.setString(4, cat.getUsu());
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            if (rs.next())
               codigo=rs.getString(1);
           
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return codigo;  
        
        
    }
public List<Articulo> filtraArt(String id) {
List<Articulo> lis = new ArrayList<>();
   if(id==null)id="";
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_producto,descrip,pre_producto,stk,imagen from "
                    + " electrodomesticos where descrip like ?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1,"%"+ id+"%");
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Articulo a = new Articulo();
                a.setCoda(rs.getString(1));
                a.setDes(rs.getString(2));
                a.setPrecio(rs.getDouble(3));
                a.setStk(rs.getInt(4));
                a.setImagen(rs.getString(5));
	        lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
         } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
return lis;
    }

public List<Factura> lisFactura(String id) {
     List<Factura> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "select fecha, id_cliente, d.id_factura,d.id_producto,descrip,pre_producto, can_producto, "
                    + " (pre_producto*can_producto), c.total FROM fac_deta d, fac_cabe c, electrodomesticos e "
                    + " where d.id_factura=c.id_factura and d.id_producto=e.id_producto and d.id_factura=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Factura a = new Factura();
                a.setFecha(rs.getString(1));
                a.setCli(rs.getString(2));
                a.setNum(rs.getString(3));
                a.setCoda(rs.getString(4));
                a.setDes(rs.getString(5));
                a.setPrecio(rs.getDouble(6));
                a.setCan(rs.getInt(7));
                a.setSubt(rs.getDouble(8));
                a.setTot(rs.getDouble(9));
                
	        lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    
    
    }
}

