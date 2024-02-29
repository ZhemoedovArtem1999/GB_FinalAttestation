package org.example.services;

public class Counter implements AutoCloseable {
    private static int count = 0;
    private boolean resourceOpen = false;

    public void add() {
        if (!resourceOpen) {
            throw new IllegalStateException("Ресурс не открыт");
        }
        System.out.println("Предыдущее значение - " + count);

        count++;
        System.out.println("Следующее значение - " + count);
    }

    @Override
    public void close() throws Exception {
        if (resourceOpen) {
            throw new IllegalStateException("Ресурс не был закрыт корректно");
        }
    }

    public void openResource() {
        resourceOpen = true;
    }

    public void closeResource() {
        resourceOpen = false;
    }
}

