const Opcodes = {
    PUSH: 0,
    POP: 1,
    ADD: 2,
    SUB: 3,
    MUL: 4,
    DIV: 5,
    HALT: 6
}

const Registers = {
    A: 0,
    B: 1,
    C: 2,
    D: 3,
    E: 4,
    F: 5
}

var VM = {
    memory: [],
    stack: [],
    registers: [],
    ip: 0,
    sp: -1,
    active: false,

    operations: {
        pop: function()
        {
            return VM.stack[VM.sp--];
        }
    },

    assembly: {
        compile: function(asm)
        {

        }
    },

    clearMemory: function()
    {
        this.memory = [];
        this.ip = 0;
    },

    clearStack: function()
    {
        this.stack = [];
        this.sp = -1;
    },

    writeMemory: function(data)
    {
        for(var i = 0; i < data.length; i++)
        {
            this.memory.push(data[i]);
        }
    },

    fetch: function()
    {
        return this.memory[this.ip];
    },

    exec: function(instr)
    {
        switch(instr)
        {
            case Opcodes.PUSH:
                this.sp++;
                this.ip++
                this.stack[this.sp] = this.fetch();
                
                break;

            case Opcodes.POP:
                this.operations.pop();
                break;

            case Opcodes.ADD:
                var a = this.operations.pop();
                var b = this.operations.pop();

                var val = b + a;
                this.sp++;
                this.stack[this.sp] = val;

                break;
            
            case Opcodes.SUB:
                var a = this.operations.pop();
                var b = this.operations.pop(); 

                var val = b - a;
                this.sp++;
                this.stack[this.sp] = val;

                break;
            
            case Opcodes.MUL:
                var a = this.operations.pop();
                var b = this.operations.pop(); 

                var val = b * a;
                this.sp++;
                this.stack[this.sp] = val;

                break;

            case Opcodes.DIV:
                var a = this.operations.pop();
                var b = this.operations.pop(); 

                var val = b / a;
                this.sp++;
                this.stack[this.sp] = val;

                break;
            
            case Opcodes.HALT:
                this.active = false;

                break;
            default:
                console.log("Unknown opcode :" + instr);
                this.active = false;
        }
    },

    run: function(instr)
    {
        this.active = true;
        this.writeMemory(instr);

        while(this.active)
        {
            this.exec(this.fetch());
            this.ip++;
        }
    }
}

var bytecode = VM.assembly.compile();

VM.run([
    0, 10,
    0, 10,
    5, 
    6
]);

console.log(VM.stack);
