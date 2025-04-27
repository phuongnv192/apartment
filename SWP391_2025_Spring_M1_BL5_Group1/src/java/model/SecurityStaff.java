/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import model.*;

public class SecurityStaff {

    private int seID;
    private int userID;
    private boolean sShift;
    private boolean seStatus;
    private Department department;

    public SecurityStaff() {
    }

    public SecurityStaff(int seID, int userID, boolean sShift, boolean seStatus) {
        this.seID = seID;
        this.userID = userID;
        this.sShift = sShift;
        this.seStatus = seStatus;
    }

    public SecurityStaff(int seID, int userID, boolean sShift, boolean seStatus, Department department) {
        this.seID = seID;
        this.userID = userID;
        this.sShift = sShift;
        this.seStatus = seStatus;
        this.department = department;
    }

    public int getSeID() {
        return seID;
    }

    public void setSeID(int seID) {
        this.seID = seID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public boolean issShift() {
        return sShift;
    }

    public void setsShift(boolean sShift) {
        this.sShift = sShift;
    }

    public boolean isSeStatus() {
        return seStatus;
    }

    public void setSeStatus(boolean seStatus) {
        this.seStatus = seStatus;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

}
