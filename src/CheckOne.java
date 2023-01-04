
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author User
 */
public class CheckOne {
    
 public String connectDB(){
     
  String s="";
  
try {
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection connection = DriverManager
.getConnection(
"jdbc:sqlserver://localhost:1433;databaseName=Checkpoint_One;selectMethod=cursor", "sa", "123456");
System.out.println("DATABASE NAME IS:"
+ connection.getMetaData().getDatabaseProductName());
Statement statement = connection.createStatement();
ResultSet resultSet = statement
.executeQuery("SELECT * FROM batch");

while (resultSet.next()) {
s+=resultSet.getString("batch_id")+"\t"+ resultSet.getString("quantity")+"\t\t"+ resultSet.getString("vac_type")+"\n";
}
return s;
} catch (Exception e) {
e.printStackTrace();
}

 
return s; }   
    
    
}
