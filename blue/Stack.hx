package blue;

class Stack
{
    public var stack : Array<Float>;
    public var size : Int = 8;

    public function new()
    {
        clear();
    }

    public function getPointer() : Int
    {
        return Register.getStackPointer();
    }

    public function setPointer(x : Int)
    {
        return Register.setStackPointer(x);
    }

    public function movePointer(x : Int) : Float
    {
        var val = Register.getStackPointer() + x;
        return setPointer(val);
    }

    public function pop()
    {
        var val = stack[Register.getStackPointer()]; 
        Register.setStackPointer(Register.getStackPointer() - 1);
        return val;
    }

    public function clear()
    {
        setPointer(-1);
        
        stack = [];
        for(i in 0...size)
        {
            stack.push(0);
        }
    }

    public function peek()
    {
        return stack[Register.getStackPointer()];
    }

    public function set(x : Int, val : Float)
    {
        stack[x] = val;
    }
}