package blue;

import blue.VM;
import blue.Opcode;

class Main
{
    public static function main()
    {
        var data = [
            0x00, 65,
            0x00, 82,
            0x00, 71,
            0x11, 3,
            0x06,
        ];

        var vm = new VM();
        vm.load(data);
        vm.run();

        trace(vm.cpu);

        trace(0x0A);
    }
}