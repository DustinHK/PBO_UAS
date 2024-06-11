/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package topup;

import DB.database;
import Login.LoginF;
/**
 *
 * @author lenovo
 */
public class Topup {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
          Login.LoginF obj = new Login.LoginF();
        obj.show();
        database.loadConnection();
    }
    
}
