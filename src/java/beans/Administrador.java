
package beans;

public class Administrador {
    private String id_admin;
    private String nom_admi;
    private String id_tienda;
    private String usuario;
    private String contrasena;

    public String getId_admin() {
        return id_admin;
    }

    public void setId_admin(String id_admin) {
        this.id_admin = id_admin;
    }

    public String getNom_admi() {
        return nom_admi;
    }

    public void setNom_admi(String nom_admi) {
        this.nom_admi = nom_admi;
    }

    public String getId_tienda() {
        return id_tienda;
    }

    public void setId_tienda(String id_tienda) {
        this.id_tienda = id_tienda;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    
}
