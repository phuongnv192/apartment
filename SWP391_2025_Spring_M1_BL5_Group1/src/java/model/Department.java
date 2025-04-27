/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Department {

    private int deptID;
    private String deptName;
    private String deptAddress;
    private User owner;

    public Department() {
    }

    public Department(int deptID, String deptName, String deptAddress, User owner) {
        this.deptID = deptID;
        this.deptName = deptName;
        this.deptAddress = deptAddress;
        this.owner = owner;
    }

    public Department(int deptID, String deptName, String deptAddress, int ownerID) {
        this.deptID = deptID;
        this.deptName = deptName;
        this.deptAddress = deptAddress;
        User u = new User();
        u.setUserID(ownerID);
        this.owner = u;
    }

    public int getDeptID() {
        return deptID;
    }

    public void setDeptID(int deptID) {
        this.deptID = deptID;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getDeptAddress() {
        return deptAddress;
    }

    public void setDeptAddress(String deptAddress) {
        this.deptAddress = deptAddress;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

}
