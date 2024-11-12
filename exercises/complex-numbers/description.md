# Description

A **complex number** is expressed in the form:

```math
z = a + b * i
```

where:

- `a` is the **real part** (a real number),

- `b` is the **imaginary part** (also a real number), and

- `i` is the imaginary unit satisfying `i^2 = -1`.

## Key Properties

1. **Conjugate**: The conjugate of the complex number `z = a + b * i` is given by:

```math
z̅ = a - b * i
```

1. **Absolute Value**: The absolute value (or modulus) of `z` is defined as:

```math
|z| = sqrt(a^2 + b^2)
```

The square of the absolute value, `|z|²`, can be computed as the product of `z` and its conjugate:

```math
|z|² = z * z̅ = a² + b²
```

## Operations on Complex Numbers

1. **Addition**: The sum of two complex numbers `z₁ = a + b * i` and `z₂ = c + d * i` is computed by adding their real and imaginary parts separately:

```math
z₁ + z₂ = (a + c) + (b + d) * i
```

1. **Subtraction**: The difference of two complex numbers is obtained by subtracting their respective parts:

```math
z₁ - z₂ = (a - c) + (b - d) * i
```

1. **Multiplication**: The product of two complex numbers is defined as:

```math
z₁ * z₂ = (a + b * i) * (c + d * i) = (a * c - b * d) + (b * c + a * d) * i
```

1. **Division**: The division of one complex number by another is given by:

```math
z₁ / z₂ = (a + b * i) / (c + d * i) = (a * c + b * d) / (c² + d²) + (b * c - a * d) / (c² + d²) * i
```

1. **Reciprocal**: The reciprocal of a non-zero complex number is given by:

```math
1 / z = 1 / (a + b * i) = a / (a² + b²) - b / (a² + b²) * i
```

1. **Exponentiation**: Raising _e_ (the base of the natural logarithm) to a complex exponent can be expressed using Euler's formula:

```math
e^(a + b * i) = e^a * e^(b * i) = e^a * (cos(b) + i * sin(b))
```

## Implementation Requirements

Given that you should not use built-in support for complex numbers, implement the following operations:

- **Addition** of two complex numbers.
- **Subtraction** of two complex numbers.
- **Multiplication** of two complex numbers.
- **Division** of two complex numbers.
- Calculation of the **conjugate** of a complex number.
- Calculation of the **absolute value** of a complex number.
- Calculation of the **exponent** of a given complex number.
