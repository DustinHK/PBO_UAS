package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class database {
    // Deklarasi variabel Connection
    public static Connection con;

  
    public static void loadConnection() {
        String url = "jdbc:mysql://localhost:3306/topup"; // Ganti dengan URL database Anda
        String userName = "root"; // Ganti dengan username database Anda
        String password = ""; // Password dikosongkan

        try {
            // Inisialisasi koneksi ke database
            con = DriverManager.getConnection(url, userName, password);
            System.out.println("Koneksi berhasil!");
        } catch (SQLException e) {
            // Tangani kesalahan koneksi
            e.printStackTrace();
            System.out.println("Koneksi gagal!");
        }
    }

 
    public static Connection getConnection() {
        if (con == null) {
            loadConnection();
        }
        return con;
    }
}
