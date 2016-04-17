package model;

/**
 * Class that describes the author's.
 *
 * @author Veleri Rechembei
 * @version %I%, %G%
 */

public class Author {
    private int    id;
    private String surname;
    private String name;

    public Author(int id, String surname, String name) {

        this.id = id;
        this.surname = surname;
        this.name = name;
    }

    public Author(String surname, String name) {

        this.surname = surname;
        this.name = name;
    }

    public Author() {
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return getSurname() + " " + getName();
    }
}
