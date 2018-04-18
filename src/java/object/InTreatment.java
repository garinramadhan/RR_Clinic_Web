/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package object;

import java.util.ArrayList;

/**
 *
 * @author GR
 */
public interface InTreatment {
    public String getTreatID();
    public void setTreatID(String TreatID);
    public String getPatientID();
    public void setPatientID(String PatientID);
    public String getDoctorID();
    public void setDoctorID(String DoctorID);
    public String getRecipeID();
    public void setRecipeID(String RecipeID);
    public String getDiagnose();
    public void setDiagnose(String Diagnose);
    public String getTreatDate();
    public void setTreatDate(String TreatDate);
    public int doInsert();
    public ArrayList getRecordDoctor(String search);
    public String[] FDTreatment();
    public String autoid();
    public String autoidRecipe();
    public ArrayList tablePatient();
    public ArrayList tableDoctor();
    public ArrayList tableTreatment();
}
