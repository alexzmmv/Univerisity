package model;

public class Student implements Atendee {
    Boolean presents;
    String name;
    Student(String name,Boolean present){
        this.presents=present;
        this.name=name;
    }
    @Override
    public Boolean isPresenting() {
        return this.presents;
    }

    @Override
    public String toString(){
        return "Student: " + this.name + " " + (this.presents ? "presentator" : "");
    }
}
