module dummy;

@safe:
@nogc:

struct Dummy
{
    static const int MAX_MEMBER_INT = 3;

    int memberInt;
    string memberStr;

    this(int memberInt, string memberStr) nothrow
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

    int doStuff() pure nothrow
    {
        auto result = this.memberInt - 1;

        if (result <= MAX_MEMBER_INT)
            result = 1 + MAX_MEMBER_INT;

        return result;
    }
}
