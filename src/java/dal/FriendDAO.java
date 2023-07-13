/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Friend;
import model.Profile;

/**
 *
 * @author dmngh
 */
public class FriendDAO extends DBContext implements DAO<Friend> {

    public List<Profile> getAll(String username) {
        List<Profile> list = new ArrayList<>();
        try {
            String sql = "SELECT p.* FROM [profile] p\n"
                    + "RIGHT JOIN friend f ON f.friend_username = p.username\n"
                    + "WHERE f.username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Profile(rs.getString(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (SQLException e) {
            System.out.println("Err: " + e.getMessage());
        }
        return list;
    }

    public boolean checkFriend(String username, String friend_username) {
        try {
            String sql = "SELECT * FROM friend WHERE username = ? and friend_username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, friend_username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("checkFriend: " + e.getMessage());
        }

        return true;
    }

    @Override
    public void insert(Friend o) {
        try {
            String sql = "INSERT INTO friend(username, friend_username) VALUES(?, ?), (?, ?);";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, o.getUsername());
            ps.setString(2, o.getFriendUsername());
            ps.setString(4, o.getUsername());
            ps.setString(3, o.getFriendUsername());
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }

    @Override
    public void update(Friend o) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Friend o) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
