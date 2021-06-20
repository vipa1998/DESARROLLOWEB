package beans;
public class Compra extends Articulo{
    private int cantidad;
private double total;
    public Compra() {
    }

   
    public double total(){
        return cantidad*super.getPrecio();
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
}
