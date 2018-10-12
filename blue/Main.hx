package blue;

import blue.VM;
import blue.Opcode;

class Main
{
    public static function main()
    {
        var data = [
            Opcode.PUSH, 65,
            Opcode.PUSH, 82,
            Opcode.PUSH, 71,
            Opcode.PRINT, 3,
            Opcode.HALT,
        ];

        var vm = new VM();
        vm.load(data);
        vm.run();

        trace(vm.cpu);
    }
}