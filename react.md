Reactive programming is a programming paradigm that focusses on how values
are computed in terms of eachother to allow a change to one value to
automatically propagate to other values, like in a spreadsheet.

Implement a basic reactive system with cells with settable values ("input"
cells) and cells who's value are computed in terms of other cells ("compute"
cells). Compute cells should allow for registering callbacks which get called
when the value of a cell changes.
