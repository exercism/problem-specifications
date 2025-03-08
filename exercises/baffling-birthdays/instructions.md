# Instructions

Your task is to estimate the birthday paradox's probabilities.

To do this, you need to:

- Determine if two birthdates have the same month and day.
- Generate random birthdates.
- Check if a collection of randomly generated birthdates contains at least one matching pair.
- Calculate the probability of at least one match for different group sizes.

~~~~exercism/caution
The birthday paradox assumes that:
- Birthdays are uniformly distributed within a single year
- That year has 365 days (no leap years)

While the year should vary between different random birthdate generation calls, all birthdates within a single call _must_ share the same year.
~~~~
