package pl.crtos;

import oracle.jdbc.pool.OracleDataSource;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

class DataHandler {

    private String username = null;
    private String password = null;
    private Connection conn;

    DataHandler(String username, String password){
        this.username = username;
        this.password = password;
        try {
            getDBConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    private void getDBConnection() throws SQLException {
        OracleDataSource ds;
        ds = new OracleDataSource();
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:ORCL";
        ds.setURL(jdbcUrl);
        conn=ds.getConnection(username,password);

    }

    ResultSet getAllEmployees() throws SQLException{
        getDBConnection();
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
        String query = "SELECT * FROM TestTable ORDER BY ID";
        System.out.println("\nExecuting query: " + query);
        return stmt.executeQuery(query);
    }


}
