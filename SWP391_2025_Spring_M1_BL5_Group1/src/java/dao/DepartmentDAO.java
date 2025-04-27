/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Department;

public class DepartmentDAO extends MyDAO {

    public List<Department> getAll() {
        List<Department> list = new ArrayList<>();
        String sql = "SELECT [deptID]\n"
                + "      ,[deptName]\n"
                + "      ,[deptAddress]\n"
                + "      ,[ownerID]\n"
                + "FROM [department]";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Department dept = new Department(
                        rs.getInt("deptID"),
                        rs.getString("deptName"),
                        rs.getString("deptAddress"),
                        rs.getInt("ownerID"));
                list.add(dept);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }

    public List<Department> getByOwnerID(int ownerID) {
        List<Department> list = new ArrayList<>();
        String sql = "SELECT [deptID]\n"
                + "      ,[deptName]\n"
                + "      ,[deptAddress]\n"
                + "      ,[ownerID]\n"
                + "FROM [department]\n"
                + "WHERE [ownerID] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, ownerID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Department dept = new Department(
                        rs.getInt("deptID"),
                        rs.getString("deptName"),
                        rs.getString("deptAddress"),
                        rs.getInt("ownerID"));
                list.add(dept);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }

    public Department findById(int deptID) {
        Department dept = null;
        String sql = "SELECT [deptID]\n"
                + "      ,[deptName]\n"
                + "      ,[deptAddress]\n"
                + "      ,[ownerID]\n"
                + "FROM [department]\n"
                + "WHERE [deptID] = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, deptID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Department(
                        rs.getInt("deptID"),
                        rs.getString("deptName"),
                        rs.getString("deptAddress"),
                        rs.getInt("ownerID"));
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return dept;
    }
}
