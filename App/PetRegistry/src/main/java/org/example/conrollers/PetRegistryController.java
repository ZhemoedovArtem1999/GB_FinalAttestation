package org.example.conrollers;

import org.example.exception.ObjectAlreadyExistsException;
import org.example.services.Counter;
import org.example.services.PetRegistryService;
import org.example.views.IInputOutput;

import java.util.List;

public class PetRegistryController {
    IInputOutput _inputOutput;
    PetRegistryService _petRegistryService;


    public PetRegistryController(IInputOutput inputOutput, PetRegistryService petRegistryService) {
        this._inputOutput = inputOutput;
        this._petRegistryService = petRegistryService;
    }

    public void CreateAnimal(String name, String species){
        try (Counter counter = new Counter()) {
            _petRegistryService.AddAnimal(name,species);
            counter.openResource();
            counter.add();
            counter.closeResource();

        }
        catch (ObjectAlreadyExistsException ex)
        {
            _inputOutput.OutputException(ex);
        }
        catch (Exception ex) {
            _inputOutput.OutputException(ex);
        }

    }

    public void CommandAnimalList(String name){
        List<String> commands = _petRegistryService.GetCommands(name);
        if (commands != null)
        {
            _inputOutput.Output("Команды:");
            for (String command: commands) {
                _inputOutput.Output(command);
            }
        }
        else {
            _inputOutput.Output("Животное не найдено!");
        }


    }

    public void LearnNewCommand(String name, String newCommand){
        try {
            _petRegistryService.AddCommand(name,newCommand);
        }
        catch (NullPointerException ex){
            _inputOutput.OutputException(ex);
        }
    }

}
