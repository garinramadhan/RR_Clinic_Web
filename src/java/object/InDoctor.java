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
public interface InDoctor {
    public String getDoctorID();
    public void setDoctorID(String DoctorID);
    public String getDoctorSPC();
    public void setDoctorSPC(String DoctorSPC);
    public String getDoctorName();
    public void setDoctorName(String DoctorName);
    public String getDoctorGender();
    public void setDoctorGender(String DoctorGender);
    public String getDoctorDOB();
    public void setDoctorDOB(String DoctorDOB);
    public String getDoctorPhone();
    public void setDoctorPhone(String DoctorPhone);
    public int doInsert();
    public int doUpdate();
    public int doDelete();
    public ArrayList getRecord(String search);
    public ArrayList getRecordSpecialist(String search);
    public String[] FDDoctor();
    public String autoid();
    public ArrayList tableDoctor();
    public ArrayList tableSpecialist();
}
