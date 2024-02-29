package org.example;

import org.example.conrollers.PetRegistryController;
import org.example.services.PetRegistryService;
import org.example.views.IInputOutput;
import org.example.views.InputOutputConsole;

public class App {

    public static void Run()
    {
        IInputOutput inputOutput = new InputOutputConsole();
        PetRegistryController petRegistryController = new PetRegistryController(inputOutput, new PetRegistryService());

        while (true)
        {
            String command = inputOutput.Input("Выберите действие:\n" +
                    "1 - Завеси новое животное\n" +
                    "2 - Получить список команд, которые исполняет животное\n" +
                    "3 - Обучить животное новым командам\n" +
                    "4 - Выйти\n"
                    );
            String name;
            switch (command){
                case "1":
                    name = inputOutput.Input("Введите имя животного");
                    while (true) {
                        String species = inputOutput.Input("Выберите вид животного:\n" +
                                "1 - Собака\n" +
                                "2 - Кот\n" +
                                "3 - Хомяк\n");

                        if (species.equals("1") || species.equals("2") || species.equals("3")) {
                            petRegistryController.CreateAnimal(name,species);

                            break;
                        } else {
                            inputOutput.Output("Выберите из предложенных!");
                        }
                    }

                    break;
                case "2":
                    name = inputOutput.Input("Введите имя животного");
                    petRegistryController.CommandAnimalList(name);
                    break;
                case "3":
                    name = inputOutput.Input("Введите имя животного");
                    String newCommand = inputOutput.Input("Введите команду которой обучаем");
                    petRegistryController.LearnNewCommand(name, newCommand);
                    break;
                case "4":

                    return;
                default:
                    inputOutput.Output("Действия не существует!");
            }

        }
    }

}
