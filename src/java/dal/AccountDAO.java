/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.Account;

/**
 *
 * @author dmngh
 */
public class AccountDAO extends DBContext implements DAO<Account>{
    public Account checkLogin(String acc, String pass) {
        Account a = null;
        String sql = "SELECT * from Account\n"
                + "WHERE username = '" + acc + "' and password = '" + pass + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a = new Account(acc, pass);
                return a;
            }
        } catch (SQLException e) {
            
        }
        return a;
    }
    
    public boolean checkSignin(String acc) {
        Account a = null;
        String sql = "SELECT * from Account\n"
                + "WHERE username = '" + acc + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return false;
            }
        } catch (SQLException e) {
            
        }
        return true;
    }
    
    @Override
    public void insert(Account o) {
        String sql = "INSERT into Account\n"
                + "VALUES(?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, o.getUsername());
            ps.setString(2, o.getPassword());
            ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void update(Account o) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Account o) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
