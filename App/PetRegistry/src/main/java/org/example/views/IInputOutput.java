package org.example.views;

public interface IInputOutput {
    String Input(String message);
    void Output(String message);

    void OutputException(Exception ex);
}
