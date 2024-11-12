# Description

A **complex number** is expressed in the form `z = a + b * i`, where:

- `a` is the **real part** (a real number),

- `b` is the **imaginary part** (also a real number), and

- `i` is the **imaginary unit** satisfying `i^2 = -1`.

## Key Properties

### Conjugate

The conjugate of the complex number `z = a + b * i` is given by:

```math
z̅ = a - b * i
```

### Absolute Value

The absolute value (or modulus) of `z` is defined as:

```math
|z| = sqrt(a^2 + b^2)
```

The square of the absolute value, `|z|²`, can be computed as the product of `z` and its conjugate:

```math
|z|² = z * z̅ = a² + b²
```

## Operations on Complex Numbers

### Addition

The sum of two complex numbers `z₁ = a + b * i` and `z₂ = c + d * i` is computed by adding their real and imaginary parts separately:

```math
z₁ + z₂ = (a + c) + (b + d) * i
```

### Subtraction

The difference of two complex numbers is obtained by subtracting their respective parts:

```math
z₁ - z₂ = (a - c) + (b - d) * i
```

### Multiplication

The product of two complex numbers is defined as:

```math
z₁ * z₂ = (a + b * i) * (c + d * i) = (a * c - b * d) + (b * c + a * d) * i
```

### Division

The division of one complex number by another is given by:

```math
z₁ / z₂ = (a + b * i) / (c + d * i) = (a * c + b * d) / (c² + d²) + (b * c - a * d) / (c² + d²) * i
```

### Reciprocal

The reciprocal of a non-zero complex number is given by:

```math
1 / z = 1 / (a + b * i) = a / (a² + b²) - b / (a² + b²) * i
```

### Exponentiation

Raising _e_ (the base of the natural logarithm) to a complex exponent can be expressed using Euler's formula:

```math
e^(a + b * i) = e^a * e^(b * i) = e^a * (cos(b) + i * sin(b))
```

## Implementation Requirements

Given that you should not use built-in support for complex numbers, implement the following operations:

- **addition** of two complex numbers
- **subtraction** of two complex numbers
- **multiplication** of two complex numbers
- **division** of two complex numbers
- **conjugate** of a complex number
- **absolute value** of a complex number
- **exponent** of a complex number
