module dummy;

@safe:
@nogc:

struct Dummy
{
    int dummyVar1;
    string dummyVar2;

    this(int dummyVar1, string dummyVar2) nothrow
    in
    {
        assert(dummyVar1 > 3);
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
