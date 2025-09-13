# Pi Estimation in MATLAB

This project estimates the value of pi using three different methods in MATLAB.

---

## Task 1: Monte Carlo (Fixed Sample Sizes)

- Uses sample sizes of 10, 100, 1000, 10,000, and 100,000.
- Generates random points in the square [0,1] × [0,1].
- Counts how many points fall inside the quarter circle (x² + y² ≤ 1).
- Estimates pi using:

  pi ≈ 4 × (points inside / total points)

- Calculates error and execution time for each sample size.
- Plots:
  - Estimated pi vs sample size
  - Error vs sample size
  - Execution time vs sample size

---

## Task 2: Leibniz Series Method

- Approximates pi using the Leibniz series:

  pi = 4 × (1 − 1/3 + 1/5 − 1/7 + 1/9 − ...)

- Loops through different precision levels (2, 3, 4, 5).
- Keeps adding terms until they are smaller than the tolerance.
- Shows the estimate and number of iterations needed.

---

## Task 3: Monte Carlo (Tolerance-Based)

- Generates random points in the square [-1,1] × [-1,1].
- Counts how many points fall inside the full circle (x² + y² ≤ 1).
- Estimates pi using:

  pi ≈ 4 × (points inside / total points)

- Stops when the estimate stabilizes within a set tolerance.
- Shows the final estimate, number of iterations, and a plot with:
  - Blue points (inside the circle)
  - Red points (outside the circle)

---

## Notes

Some code and explanations were developed with help from ChatGPT (OpenAI, 2025).
