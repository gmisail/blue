package blue;

/*

*/

class Opcode
{
    public static inline var PUSH = 0;
    public static inline var POP = 1;
    
    public static inline var ADD = 2;
    public static inline var SUB = 3;
    public static inline var MUL = 4;
    public static inline var DIV = 5;
    
    public static inline var HALT = 6;
    
    public static inline var AND = 7;
    public static inline var OR = 8;

    public static inline var DUP = 9;

    public static inline var ISEQ = 10;
    public static inline var ISGT = 11;
    public static inline var ISGE = 12;
    
    public static inline var JUMP = 13;
    public static inline var JUMPIF = 14;

    public static inline var LOAD = 15;
    public static inline var STORE = 16;

    public static inline var PRINT = 17;
}