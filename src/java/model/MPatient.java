/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import config.koneksi;
import java.rmi.server.UnicastRemoteObject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import object.InPatient;
/**
 *
 * @author user
 */
public class MPatient extends UnicastRemoteObject implements InPatient{
    private String PatientID, PatientName, PatientGender, PatientDOB, PatientAddress;
    private koneksi obj_koneksi = new koneksi();
    
    public MPatient()throws Exception
    {
        super();
    }

    public String getPatientID() {
        return PatientID;
    }

    public void setPatientID(String PatientID) {
        this.PatientID = PatientID;
    }

    public String getPatientName() {
        return PatientName;
    }

    public void setPatientName(String PatientName) {
        this.PatientName = PatientName;
    }

    public String getPatientGender() {
        return PatientGender;
    }

    public void setPatientGender(String PatientGender) {
        this.PatientGender = PatientGender;
    }

    public String getPatientDOB() {
        return PatientDOB;
    }

    public void setPatientDOB(String PatientDOB) {
        this.PatientDOB = PatientDOB;
    }

    public String getPatientAddress() {
        return PatientAddress;
    }

    public void setPatientAddress(String PatientAddress) {
        this.PatientAddress = PatientAddress;
    }
    
    
    
    public koneksi getObj_koneksi() {
        return obj_koneksi;
    }

    public void setObj_koneksi(koneksi obj_koneksi) {
        this.obj_koneksi = obj_koneksi;
    }
    
    public int doInsert()
    {
        int i = 0 ;
        try
        {
            obj_koneksi.openConnection();
            String str = "exec pcdPatient ?,?,?,?";
            PreparedStatement pr = obj_koneksi.con.prepareStatement(str);
            pr.setString(1, PatientName);
            pr.setString(2, PatientDOB);
            pr.setString(3, PatientAddress);
            pr.setString(4, PatientGender);
            i = pr.executeUpdate();
        }
        catch(SQLException ex)
        {
            System.out.println(ex.getMessage());
        }
        return i;
    }
    
    public int doUpdate()
    {
        int i = 0;
        try
        {
            obj_koneksi.openConnection();
            String str = "exec pcduptPatient ?, ?, ?, ?, ?";
            PreparedStatement pr = obj_koneksi.con.prepareStatement(str);
            pr.setString(1, PatientID);
            pr.setString(2, PatientName);
            pr.setString(3, PatientDOB);
            pr.setString(4, PatientAddress);
            pr.setString(5, PatientGender);
            i = pr.executeUpdate();
        }
        catch(SQLException ex)
        {
            System.out.println(ex.getMessage());
        }
        return i;
    }
    
    public int doDelete()
    {
        int i = 0 ;
        try
        {
         obj_koneksi.openConnection();
         String str = "delete Patient.Patient where Id_Patient= ?";
         PreparedStatement pr = obj_koneksi.con.prepareStatement(str);
         pr.setString(1, PatientID);
         i = pr.executeUpdate();
        }
        catch(SQLException ex)
        {
            System.out.println(ex.getMessage());
        }
        return i;
    }
    
    public ArrayList tablePatient(){
        ArrayList data = new ArrayList();
        String sql = "select * from Patient.Patient";
        try {
            Statement statement = obj_koneksi.con.createStatement();
            ResultSet rs = statement.executeQuery(sql);
             while(rs.next())
             {
                 this.setPatientID(rs.getString(1));
                 this.setPatientName(rs.getString(2));
                 this.setPatientDOB(rs.getString(3));
                 this.setPatientAddress(rs.getString(4));
                 this.setPatientGender(rs.getString(5));
                 data.add(this.getPatientID());
                 data.add(this.getPatientName());
                 data.add(this.getPatientDOB());
                 data.add(this.getPatientAddress());
                 data.add(this.getPatientGender());
             }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex);
        }
        return data;
    }
    
    public ArrayList getRecord(String search)
    {
        ArrayList data = new ArrayList();
        try
        {
            obj_koneksi.openConnection();
            String str = "select * from Patient.Patient where Id_Patient like ? or Patient_Name like ? or DateOfBirth like ? or Address like ? or GenderPatient like ?";
            PreparedStatement pr = obj_koneksi.con.prepareStatement(str);
            pr.setString(1, "%"+search+"%");
            pr.setString(2, "%"+search+"%");
            pr.setString(3, "%"+search+"%");
            pr.setString(4, "%"+search+"%");
            pr.setString(5, "%"+search+"%");
            ResultSet rs = pr.executeQuery();
            while(rs.next())
            {
                 this.setPatientID(rs.getString(1));
                 this.setPatientName(rs.getString(2));
                 this.setPatientDOB(rs.getString(3));
                 this.setPatientAddress(rs.getString(4));
                 this.setPatientGender(rs.getString(5));
                 data.add(this.getPatientID());
                 data.add(this.getPatientName());
                 data.add(this.getPatientDOB());
                 data.add(this.getPatientAddress());
                 data.add(this.getPatientGender());
            }
        }
        catch(SQLException ex)
        {
            System.out.println(ex.getMessage());
        }
        return data;
    }
    
    public String[] FDPatient()
    {
        try 
        {
            obj_koneksi.openConnection();
            String sq = "select Id_Patient from Patient.Patient where PatientName=? AND Address=?";
            PreparedStatement ps = obj_koneksi.con.prepareStatement(sq);
            ps.setString(1, PatientName);
            ps.setString(2, PatientAddress);
            
            ResultSet r = ps.executeQuery();
            String[] data = new String[1];
            if(r.next())
            {
                data[0]= r.getString("Id_Patient");
            }
            else
            {
               data[0]= "kosong";
            }
            return data;          
        } 
        catch (Exception e) 
        {
        }
        return null;
    }
    
    public String autoid(){
        String idPatient = "";
        try {
            obj_koneksi.openConnection();
            String sql1 = "Select Right(Id_Patient,5) as 'Id_Patient' from Patient.Patient Order by Id_Patient DESC";
            Statement stat = obj_koneksi.con.createStatement();
            ResultSet rs = stat.executeQuery(sql1);
            rs.next();
            int autocode = rs.getInt("Id_Patient");
            if(autocode < 9){
                idPatient = "P0000" + Integer.toString(autocode + 1);
            }else if(autocode < 99){
                idPatient = "P000" + Integer.toString(autocode + 1);
            }else if(autocode < 999){
                idPatient = "P00" + Integer.toString(autocode + 1);
            }else if(autocode < 9999){
                idPatient = "P00" + Integer.toString(autocode + 1);
            }else if(autocode < 99999){
                idPatient = "P0" + Integer.toString(autocode + 1);
            }else if(autocode < 99999){
                idPatient = "P" + Integer.toString(autocode + 1);
            }else{
                idPatient = "full";
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return idPatient;
    }
        
}
