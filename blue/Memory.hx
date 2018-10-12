package blue;

class Memory
{
    private var ip : Int;

    private var memory : Array<Int>;

    public function new()
    {
        clear();
    }

    public function clear()
    {
        this.memory = [];
        this.ip = 0;
    }

    public function write(data : Array<Int>)
    {
        for(bit in data)
        {
            memory.push(bit);
        }
    }

    public function fetch()
    {
        return memory[ip];
    }

    public function getPointer()
    {
        return ip;
    }

    public function movePointer(x : Int)
    {
        setPointer(ip + x);
    }

    public function setPointer(x : Int)
    {
        ip = x;
    }
}