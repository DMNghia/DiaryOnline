/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dal;

/**
 *
 * @author dmngh
 */
public interface DAO<T> {
    void insert(T o);
    void update(T o);
    void delete(T o);
}
