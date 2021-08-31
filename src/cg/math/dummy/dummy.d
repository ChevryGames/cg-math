module dummy;

@safe @nogc public struct Dummy
{
    static const int MAX_MEMBER_INT = 3;

    int memberInt;
    string memberStr;

    /*
    * Newest version layout:
    * in (memberInt > MAX_MEMBER_INT)
    * out (; this.memberInt == memberInt)
    * out (; this.memberStr == memberStr)
    * {
    *     this.memberInt = memberInt;
    *     this.memberStr = memberStr;
    * }
    */
    this(int memberInt, string memberStr) nothrow @safe @nogc
    in
    {
        assert(memberInt > MAX_MEMBER_INT);
    }
    out
    {
        assert(this.memberInt == memberInt);
        assert(this.memberStr == memberStr);
    }
    do
    {
        this.memberInt = memberInt;
        this.memberStr = memberStr;
    }

    int doStuff() pure nothrow @safe @nogc
    {
        auto result = this.memberInt - 1;

        if (result <= MAX_MEMBER_INT)
            result = 1 + MAX_MEMBER_INT;

        return result;
    }
}
