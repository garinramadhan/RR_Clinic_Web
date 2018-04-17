/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package object;
import java.util.ArrayList;
/**
 *
 * @author user
 */
public interface InSpecialist{
    public String getSpcID();
    public void setSpcID(String SpcID);
    public String getSpcName();
    public void setSpcName(String SpcName);
    public double getSpcFare();
    public void setSpcFare(double SpcFare);
    public int doInsert();
    public int doUpdate();
    public int doDelete();
    public ArrayList tableSpecialist();
    public ArrayList getRecord(String search);
    public String[] FDSpc();
    public String autoid();
    public int specialistAvailable();
}
