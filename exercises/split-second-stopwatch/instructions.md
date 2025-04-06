# Instructions

Your task is to build a stopwatch that can be used to keep track of lap times.
The stopwatch has the following functionality:

- Start: start/resume time tracking
- Stop: stop/pause time tracking
- Current lap: retrieve the time tracked for the current lap
- Previous laps: retrieve the previously recorded lap times
- Reset: stop time tracking, reset the current lap, and clear all previously recorded laps
- Lap: add the current lap time to the previous laps, then reset the current lap time and continue tracking time

You can think of a stopwatch as being in one of three states:

1. Ready
2. Running (tracking time)
3. Stopped (not tracking time)

This is a visualization of the states (between square brackets) and the commands (between angular brackets):

```text
                     <lap>
                    +-----+
                    |     |
         <start>    v     |   <stop>
[Ready] ---------> [Running] --------> [Stopped]
   ^            ^                        |   |
   |            |        <start>         |   |
   |            +------------------------+   |
   |                                         |
   |                <reset>                  |
   +-----------------------------------------+
```
