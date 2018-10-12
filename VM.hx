package blue;

class VM
{
    public var cpu : CPU;

    public function new()
    {
        Register.initialize();

        cpu = new CPU();
    }

    public function load(bytecode : Array<Int>)
    {
        cpu.memory.write(bytecode);
    }

    public function run()
    {
        while(cpu.running)
        {
            cpu.eval(cpu.memory.fetch());
            cpu.memory.movePointer(1);

        }
    }
}