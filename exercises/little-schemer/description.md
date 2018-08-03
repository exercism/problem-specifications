Implement four operations: `null?`, `car`, `cdr` (pronounced could-der), and
`atom?` to be *used together* in defining a **recursive operation**
`lat?` (short for list of atoms).

Given a list of numbers, strings, and/or lists, `lat?` returns a
**boolean** indicating if the input list is a list of atoms.

```
l = [1, 'Two', 3, 4, []]
lat?(l)
false

m = ['Grapefruit', 'Tea', 'Yo']
lat?(m)
true
```
