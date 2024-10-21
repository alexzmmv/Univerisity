package model;

public class Professor implements Atendee{
    Boolean presents;
    String name;
    Professor(String name,Boolean present){
        this.presents=present;
        this.name=name;
    }
    @Override
    public Boolean isPresenting() {
        return this.presents;
    }

    @Override
    public String toString(){
        return "Professor: " + this.name + " " + (this.presents ? "presentator" : "");
    }
}
