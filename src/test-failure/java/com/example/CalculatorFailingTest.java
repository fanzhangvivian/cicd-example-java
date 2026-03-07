package com.example;

/**
 * Intentionally failing test used to verify failure handling in pipelines.
 */
public final class CalculatorFailingTest {

    private CalculatorFailingTest() {
    }

    public static void main(String[] args) {
        Calculator calculator = new Calculator();
        int actual = calculator.add(2, 3);
        int expected = 999;

        if (actual != expected) {
            throw new AssertionError(
                "Intentional failure for CI demo: expected=" + expected + ", actual=" + actual
            );
        }
    }
}
