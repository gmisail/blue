package blue;

class CPU
{
    public var registers : Array<Float>;

    public var running : Bool = false;

    public var stack : Stack;
    public var memory : Memory;
    public var frame : Frame;

    public function new()
    {
        running = true;

        memory = new Memory();
        stack = new Stack();
        frame = new Frame();
    }

    private function jump()
    {
        memory.movePointer(1);
        memory.setPointer(memory.fetch() - 1);
    }

    public function eval(instr : Int)
    {
        switch(instr)
        {
            case Opcode.PUSH:
                stack.movePointer(1);
                memory.movePointer(1);

                stack.set(stack.getPointer(), memory.fetch());
                
            case Opcode.POP:
                stack.pop();

            case Opcode.DUP:
                var top = stack.peek();
                stack.movePointer(1);
                stack.set(stack.getPointer(), top);
            
            case Opcode.ADD:
                var a = stack.pop();
                var b = stack.pop();

                var result = b + a;

                trace('$b + $a = $result');

                stack.movePointer(1);
                stack.set(stack.getPointer(), result);
            
            case Opcode.SUB:
                var a = stack.pop();
                var b = stack.pop();

                var result = b - a;

                trace('$b - $a = $result');

                stack.movePointer(1);
                stack.set(stack.getPointer(), result);

            case Opcode.MUL:
                var a = stack.pop();
                var b = stack.pop();

                var result = b * a;

                trace('$b * $a = $result');

                stack.movePointer(1);
                stack.set(stack.getPointer(), result);   

            case Opcode.DIV:
                var a = stack.pop();
                var b = stack.pop();

                var result = b / a;

                trace('$b / $a = $result');

                stack.movePointer(1);
                stack.set(stack.getPointer(), result); 

            case Opcode.HALT:
                running = false;

            case Opcode.AND:
                var a = stack.pop();
                var b = stack.pop();

                stack.movePointer(1);
                stack.set(stack.getPointer(), Util.toInt(Util.toBool(a) && Util.toBool(b)));

            case Opcode.OR:
                var a = stack.pop();
                var b = stack.pop();

                stack.movePointer(1);
                stack.set(stack.getPointer(), Util.toInt(Util.toBool(a) || Util.toBool(b)));
            
            case Opcode.ISEQ:
                var a = stack.pop();
                var b = stack.pop();

                stack.movePointer(1);
                stack.set(stack.getPointer(), Util.toInt(b == a));

            case Opcode.ISGT:
                var a = stack.pop();
                var b = stack.pop();

                stack.movePointer(1);
                stack.set(stack.getPointer(), Util.toInt(b > a));
            
            case Opcode.ISGE:
                var a = stack.pop();
                var b = stack.pop();

                stack.movePointer(1);
                stack.set(stack.getPointer(), Util.toInt(b >= a));

            case Opcode.JUMP:
                jump();
            
            case Opcode.JUMPIF:
                var a = stack.pop();
                if(Util.toBool(a))
                    jump();
                else
                    memory.movePointer(1); 

            case Opcode.LOAD:
                memory.movePointer(1);
                var a = memory.fetch();

                stack.movePointer(1);
                stack.set(stack.getPointer(), frame.getVariable(a));

            case Opcode.STORE:
                memory.movePointer(1);
                var a = memory.fetch();
                var b = stack.pop();

                frame.setVariable(a, b);
            
            case Opcode.PRINT:
                memory.movePointer(1);
                var a = memory.fetch(); //the only argument is how many characters the string is
                
                var output = "";

                for(i in 0...a)
                {
                    output += ASCII.getCharacter(cast (stack.pop()));
                }

                trace(output);

            default:
                //trace("[ChronosVM] Unknown instruction " + instr);
        }
    }
}