package org.example.models;

import java.util.ArrayList;
import java.util.List;

public abstract class Animal {
    private String name;
    private List<String> commands;

    public Animal(String name) {
        this.name = name;
        commands = new ArrayList<>();
    }

    public String getName() {
        return name;
    }

    public List<String> getCommands() {
        return commands;
    }

    public void addCommand(String command){
        commands.add(command);
    }
}
