package adminServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import java.io.*;

@SuppressWarnings("serial")
@WebServlet("/list-users")
public class UserListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        InputStream input = getServletContext().getResourceAsStream("/WEB-INF/users.xml");

        if (input == null) {
            response.setContentType("text/plain");
            response.getWriter().println("Could not find users.xml");
            return;
        }

        try {
            // Set up XML parser
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(input);
            doc.getDocumentElement().normalize();

            // Parse user elements
            NodeList userList = doc.getElementsByTagName("user");

            response.setContentType("text/plain");
            PrintWriter out = response.getWriter();

            for (int i = 0; i < userList.getLength(); i++) {
                Node userNode = userList.item(i);
                if (userNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element userElement = (Element) userNode;

                    String role = userElement.getElementsByTagName("role").item(0).getTextContent();
                    String description = userElement.getElementsByTagName("description").item(0).getTextContent();

                    out.println("Role: " + role);
                    out.println("Description: " + description);
                    out.println("-------------------------");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error parsing XML: " + e.getMessage());
        }
    }
}
