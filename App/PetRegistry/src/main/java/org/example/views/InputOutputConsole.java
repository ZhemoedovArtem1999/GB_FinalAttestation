package org.example.views;

import java.util.Scanner;

public class InputOutputConsole implements IInputOutput{
    @Override
    public String Input(String message) {
        Scanner input = new Scanner(System.in);
        System.out.print(message + " - ");
        return  input.nextLine();
    }

    @Override
    public void Output(String message) {
        System.out.println(message);
    }

    @Override
    public void OutputException(Exception ex) {
        System.out.println(ex.getMessage());

    }
}
