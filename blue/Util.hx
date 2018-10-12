package blue;

class Util
{
    public static function toBool(val : Float) : Bool
    {
        return val == 1;
    }

    public static function toInt(val : Bool) : Int
    {
        return val ? 1 : 0;
    }
}