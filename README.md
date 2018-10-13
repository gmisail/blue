# blue

Blue is a stack-based virtual machine designed for portability. It is not dependent on any external dependencies and 
can run wherever Javascript can run.

## Instructions

- `0x00` - push value to the stack
- `0x01` - pop value
- `0x02` - adds top 2 values and pushes the result
- `0x03` - subtracts top 2 values and pushes the result
- `0x04` - multiplies...
- `0x05` - divides...
- `0x06` - halt
- `0x07` - pushes true boolean to the stack if the top 2 values are true
- `0x08` - pushes true boolean to the stack if either of the top 2 values are true
- `0x09` - duplicates top value from stack (NYI)
- `0x0A` - pushes true if top 2 values are equal
- `0x0B` - pushes true if second value from the top is greater than the first
- `0x0C` - >=
- `0x0D` - jump to position in memory
- `0x0E` - jump to position if top value on the stack is true
- `0x0F` - load variable value
- `0x10` - assign variable to value
- `0x11` - prints specified number of characters on the stack