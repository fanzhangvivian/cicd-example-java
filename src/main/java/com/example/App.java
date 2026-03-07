package com.example;

/**
 * Entrypoint for the demo application.
 */
public final class App {

    private App() {
    }

    public static void main(String[] args) {
        Calculator calculator = new Calculator();
        int result = calculator.add(2, 3);
        System.out.println("2 + 3 = " + result);
    }
}
