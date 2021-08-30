module dummy;

@safe:
@nogc:

struct Dummy
{
    static const int MAX_VAR_INT = 3;

    int dummyVar1;
    string dummyVar2;

    this(int dummyVar1, string dummyVar2) nothrow
    in
    {
        assert(dummyVar1 > MAX_VAR_INT);
    }
    out
    {
        assert(this.dummyVar1 == dummyVar1);
    }
    do
    {
        this.dummyVar1 = dummyVar1;
        this.dummyVar2 = dummyVar2;
    }
}
