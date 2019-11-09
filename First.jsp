<%@ page import = " java.sql.* "%>

	<% String a= request.getParameter("t1");
	String b =  request.getParameter("t2");
	String c =  request.getParameter("t3");
	String d =  request.getParameter("t4");
	String e =  request.getParameter("t5");
	String button = request.getParameter("b1");%>

	<%  out.println("Name is " +a);
		out.println("<br>");
		out.println("Password is " +b);
		out.println("<br>");
		out.println("Address is " +c);
		out.println("<br>");
		out.println("Email is " +d);
		out.println("<br>");
		out.println("Phone no is " +e); %>
	<%	
	
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123456789");
			
			if(button.equals("Insert")){
				PreparedStatement st = con.prepareStatement("insert into employee values(?,?,?,?,?)");
				st.setString(1, a);
				st.setString(2, b);
				st.setString(3, c);
				st.setString(4, d);
				st.setString(5, e);
				st.execute();
				out.println("row inserted");
			}
			
			if(button.equals("Update")){
				PreparedStatement st = con.prepareStatement("update employee set name=?, password=?,address=?,email=?,phone_no=?");
				st.setString(1, a);
				st.setString(2, b);
				st.setString(3, c);
				st.setString(4, d);
				st.setString(5, e);
				st.execute();
				out.println("row updated");
			}
			
			if(button.equals("Delete")){
				PreparedStatement st = con.prepareStatement("delete from employee where name=?");
				st.setString(1, a);
				st.execute();
				out.println("row deleted");
			}
			
			if(button.equals("Select")){
				PreparedStatement st = con.prepareStatement("select * from employee where name=?");
				st.setString(1, a);
				ResultSet rs = st.executeQuery();
				while(rs.next()){
					System.out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4) + " " + rs.getString(5) + " ");
				}
				out.println("row selected");
			}

			
		}
		
		catch(Exception ae){
			ae.printStackTrace();
		}
	
	
	%>
