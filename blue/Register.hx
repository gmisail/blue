package blue;

class Register
{
    private static var registers : Array<Float>;

    public static var A : Int = 0;
    public static var B : Int = 1;
    public static var C : Int = 2;
    public static var D : Int = 3;
    public static var E : Int = 4;
    public static var F : Int = 5;

    public static var SP : Int = -1;
    public static var IP : Int = 0;

    public static function initialize()
    {
        registers = [];
        for(i in 0...8)
        {
            registers.push(0);
        }
    }

    public static function get(id : Int)
    {
        return registers[id];
    }

    public static function getStackPointer()
    {
        return SP;
    }

    public static function setStackPointer(x : Int)
    {
        SP = x;
        return SP;
    }
    
    public static function set(id : Int, val : Float)
    {
        registers[id] = val;

        return registers[id];
    }
}