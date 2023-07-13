/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Profile;

/**
 *
 * @author dmngh
 */
public class ProfileDAO extends DBContext implements DAO<Profile>{

    public Profile getProfileByUsername(String username) {
        try {
            String sql = "SELECT * FROM profile WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Profile(rs.getString(1), rs.getString(2), rs.getInt(3));
            }
        } catch(SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }
    
    @Override
    public void insert(Profile o) {
        try {
            String sql = "INSERT INTO profile VALUES(?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, o.getUsername());
            ps.setString(2, o.getFullName());
            ps.setInt(3, o.getAge());
            ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    @Override
    public void update(Profile o) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Profile o) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
