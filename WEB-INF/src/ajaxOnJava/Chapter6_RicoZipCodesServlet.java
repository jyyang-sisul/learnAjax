/*
 * Takes a character, converts it to hex, decimal, binary, octal and html. Then
 * wraps each of the fields with XML and sends it back through the response.
 */
package ajaxOnJava;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ajaxOnJava.DbConn;
import ajaxOnJava.RicoUtil;

public class Chapter6_RicoZipCodesServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String responseString = null;
		String type = req.getParameter("type");
		if(type==null)
			type = "0";
		String zipCode = req.getParameter("zip");
		if (zipCode != null) {
			HashMap location = getCityState(zipCode);
			if (location==null || location.size()==0){
				location = new HashMap();
				location.put("cityDiv"," ");
				location.put("stateDiv"," ");
				type = "1";
			}
			if (type.equals("1")){
				String message = "Zip code: "+zipCode+" is not in the database. Please enter your City and State";
				responseString = RicoUtil.buildRicoXML(location,"<input>",message);
			}
			else
				responseString = RicoUtil.buildRicoXML(location,"");		
		}
		if (responseString != null) {
			System.out.println(responseString);
			res.setContentType("text/xml");
			res.setHeader("Cache-Control", "no-cache");
			res.getWriter().write(responseString);
		} else {
			// If key comes back as a null, return a question mark.
			res.setContentType("text/xml");
			res.setHeader("Cache-Control", "no-cache");
			res.getWriter().write("?");
		}
	}

	private HashMap getCityState(String zipCode) {
		Connection con = DbConn.getConnection();
		HashMap cityStateMap = new HashMap();
		String queryString = "";
		try {
			queryString = "SELECT CITY, STATE FROM ZIPCODES where ZIPCODE='"
					+ zipCode + "';";
			Statement select = con.createStatement();
			ResultSet result = select.executeQuery(queryString);

			while (result.next()) { // process results one row at a time
				String city;
				String state;

				city = result.getString("CITY");
				if (result.wasNull()) {
					city = "";
				}
				cityStateMap.put("cityDiv", city);
				state = result.getString("state");
				if (result.wasNull()) {
					state = "";
				}
				cityStateMap.put("stateDiv", state);
			}
		} catch (Exception e) {
			System.out.println("exception caught getting city/state:"
					+ queryString + " " + e.getMessage());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
			}
		}
		return cityStateMap;
	}
}
