# Instructions

Your task is to determine the degree of separation between two individuals in a family tree.

- You will be given an input, with all parent names and their children.
- Each name is unique, a child _can_ have one or more parents.
- The degree of separation is defined as the shortest number of connections from one person to another.
- If two individuals are not connected, return a value that represents "no relation."
  Please see the test cases for the actual implementation.

## Example

Given the following family tree:

```text
      ┌──────────┐            ┌──────────┐ ┌──────────┐
      │  Helena  │            │  Helena  │ │   Umar   │
      └───┬───┬──┘            └─────┬────┘ └─────┬────┘
      ┌───┘   └───────┐             └──────┬─────┘
      ▼               ▼                    ▼
┌──────────┐     ┌────────┐          ┌──────────┐
│   Isla   │     │  Tariq │          │   Kaito  │
└────┬─────┘     └────┬───┘          └──────────┘
     ▼                ▼
┌─────────┐       ┌───────┐
│   Uma   │       │ Aditi │
└─────────┘       └───────┘
```

The degree of separation between Tariq and Uma is 3 (Tariq → Helena → Isla → Uma).
The degree of separation between Isla and Kaito is not defined, as there is no visible relationship in the given data.
The degree of separation between Uma and Isla is 1.
