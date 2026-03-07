package com.example;

/**
 * Passing tests for the demo repository.
 */
public final class CalculatorTest {

    private CalculatorTest() {
    }

    public static void main(String[] args) {
        Calculator calculator = new Calculator();

        assertEquals(5, calculator.add(2, 3), "add should sum two positive numbers");
        assertEquals(-1, calculator.subtract(2, 3), "subtract should handle negative results");
        assertEquals(6, calculator.multiply(2, 3), "multiply should multiply two positive numbers");

        System.out.println("All CalculatorTest checks passed.");
    }

    private static void assertEquals(int expected, int actual, String message) {
        if (expected != actual) {
            throw new AssertionError(message + ": expected=" + expected + ", actual=" + actual);
        }
    }
}
