package controller.processors;

import Servlet.Commands;
import exception.DataBaseException;
import model.OracleDataAccess;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 * Class that handling command ViewListBooks.
 *
 * @author Sasha Kostyan
 * @version %I%, %G%
 */
public class ViewListBooks implements GeneralProcess {
    public final static String ID_RUBRIC           = "idRubric";
    public final static String ID_RUBRIC_ALL       = "all";
    public final static String ATTRIBUTE_VIEW_LIST = "attribute_list_books";

    public void process(HttpServletRequest request, HttpServletResponse response) throws DataBaseException {

        String requestIdRubric = request.getParameter(ID_RUBRIC);
        Integer idRubric;

        if (requestIdRubric != null) {
            if (requestIdRubric.equals(ID_RUBRIC_ALL)) {
                request.getSession().setAttribute(ATTRIBUTE_VIEW_LIST, ID_RUBRIC_ALL);
                idRubric = null;
            } else {
                try {
                    idRubric = Integer.valueOf(requestIdRubric);
                    request.getSession().setAttribute(ATTRIBUTE_VIEW_LIST, idRubric.toString());
                } catch (Exception e) {
                    idRubric = null;
                }
            }
        } else {
            String listBooks = (String) request.getSession().getAttribute(ATTRIBUTE_VIEW_LIST);
            if (!listBooks.equals("all")) {
                idRubric = Integer.valueOf(listBooks);
            } else {
                idRubric = null;
            }
        }

        Commands.AMOUNT_OF_BOOKS_ON_LIST += Commands.PLUS_BOOKS_TO_LIST;

        ArrayList books;
        if (idRubric != null) {
            books = (ArrayList) OracleDataAccess.getInstance().getAllBooksByRubric(idRubric);
        } else {
            books = (ArrayList) OracleDataAccess.getInstance().getAmountOfBooks(Commands.AMOUNT_OF_BOOKS_ON_LIST);
        }

        request.getSession().setAttribute("listOfAllBooks", books);
        Commands.forward("/index.jsp", request, response);
    }

}
