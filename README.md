This project contains three tasks that estimate the value of π using different numerical methods.  
The code is written in MATLAB.

---

## Task 1

- Estimates π by randomly sampling points inside the unit square \([0,1] \times [0,1]\).
- Checks how many points fall inside the quarter circle of radius 1.
- For each sample size (10, 100, 1,000, 10,000, 100,000):
  - Calculates the estimate of π.
  - Computes the error as \(\hat{\pi} - \pi\).
  - Measures the execution time.
- Uses the ratio formula:

  \[
  \pi \approx 4 \times \frac{\text{points inside}}{\text{total points}}
  \]

- Generates three plots:
  - Estimated π vs Sample Size
  - Error vs Sample Size
  - Execution Time vs Sample Size

---

## Task 2

- Estimates π using the infinite Leibniz series:

  \[
  \pi = 4 \times \left(1 - \frac{1}{3} + \frac{1}{5} - \frac{1}{7} + \frac{1}{9} - \dots\right)
  \]

- Iteratively adds terms until the current term is smaller than the tolerance based on the chosen precision level (2, 3, 4, 5).
- For each precision level:
  - Calculates the estimated π value.
  - Records the number of iterations taken.
  - Prints the results in the Command Window.

---

## Task 3

- Estimates π by randomly sampling points in the square \([-1,1] \times [-1,1]\).
- Counts how many points fall inside the full circle of radius 1.
- Uses the same ratio formula:

  \[
  \pi \approx 4 \times \frac{\text{points inside}}{\text{total points}}
  \]

- Continues running until:
  - At least 200 points have been sampled, **and**
  - The change between consecutive estimates is smaller than the set tolerance.
- Plots each point as it is generated:
  - Blue if inside the circle
  - Red if outside the circle
- Displays:
  - The final estimated π value
  - The number of iterations used
  - The plot with the circle, square, and points

---

## Citation

Some code and explanations were developed with assistance from [ChatGPT](https://chat.openai.com/) (OpenAI, 2025).
