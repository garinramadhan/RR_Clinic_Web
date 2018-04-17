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
public interface InPatient{
    public String getPatientID();
    public void setPatientID(String PatientID);
    public String getPatientName();
    public void setPatientName(String PatientName);
    public String getPatientGender();
    public void setPatientGender(String PatientGender);
    public String getPatientDOB();
    public void setPatientDOB(String PatientDOB);
    public String getPatientAddress();
    public void setPatientAddress(String PatientAddress);
    public int doInsert();
    public int doUpdate();
    public int doDelete();
    public ArrayList tablePatient();
    public ArrayList getRecord(String search);
    public String[] FDPatient();
    public String autoid();
}
