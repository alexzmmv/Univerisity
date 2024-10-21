package model;

public class Expert implements Atendee {
    Boolean presents;
    String name;
    Expert(String name,Boolean present){
        this.presents=present;
        this.name=name;
    }
    @Override
    public Boolean isPresenting() {

        return this.presents;
    }

    @Override
    public String toString(){
        return "Expert: " + this.name + " " + (this.presents ? "presentator" : "");
    }

}
