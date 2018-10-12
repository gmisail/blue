package blue;

class Frame
{
    private var variables : Map<Int, Float>;

    public function new()
    {
        variables = new Map();
    }

    public function getVariable(x : Int)
    {
        return variables.get(x);
    }

    public function setVariable(x : Int, val : Float)
    {
        variables.set(x, val);
    }
}