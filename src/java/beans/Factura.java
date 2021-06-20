package beans;

public class Factura extends Articulo{
 private String num;
 private String cli;
 private String fecha;
 private int can;
 private double subt;
 private double tot;

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getCli() {
        return cli;
    }

    public void setCli(String cli) {
        this.cli = cli;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getCan() {
        return can;
    }

    public void setCan(int can) {
        this.can = can;
    }

    public double getSubt() {
        return subt;
    }

    public void setSubt(double subt) {
        this.subt = subt;
    }

    public double getTot() {
        return tot;
    }

    public void setTot(double tot) {
        this.tot = tot;
    }
 
 
}
