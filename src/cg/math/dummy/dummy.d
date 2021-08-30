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
    }
    do
    {
        this.memberInt = memberInt;
        this.memberStr = memberStr;
    }
}
