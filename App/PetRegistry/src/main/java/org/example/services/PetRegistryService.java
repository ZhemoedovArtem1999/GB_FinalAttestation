package org.example.services;

import org.example.exception.ObjectAlreadyExistsException;
import org.example.models.Animal;
import org.example.models.Cat;
import org.example.models.Dog;
import org.example.models.Hamster;

import java.util.ArrayList;
import java.util.List;

public class PetRegistryService {
    List<Animal> animals;

    public PetRegistryService() {
        this.animals = new ArrayList<>();
    }


    public void AddAnimal(String name, String species) throws ObjectAlreadyExistsException {
        for (Animal animal:animals) {
            if (animal.getName().equals(name))
                throw new ObjectAlreadyExistsException("Домашнеее животное с таким именем уже существует!");
        }
        switch (species){
            case "1":
                animals.add(new Dog(name));
                break;
            case "2":
                animals.add(new Cat(name));
                break;
            case "3":
                animals.add(new Hamster(name));
                break;
        }
    }

    public List<String> GetCommands(String name){
        for (Animal animal:animals) {
            if (animal.getName().equals(name))
                return animal.getCommands();
        }

        return null;
    }

    public void AddCommand(String name, String command) throws NullPointerException{
        for (Animal animal:animals) {
            if (animal.getName().equals(name))
            {
                animal.addCommand(command);
                return;
            }
        }
        throw new NullPointerException("Домашнее животное с таким именем не найдено!");
    }
}
