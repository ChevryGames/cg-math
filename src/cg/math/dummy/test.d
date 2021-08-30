module test;

@safe:
@nogc:
private:

version (unittest)
{
    import dummy;

    /// Test [cg.math.dummy.dummy.Dummy.doStuff()]
    unittest
    {
        Dummy instance = Dummy(4, "A dummy string");
        assert(instance.doStuff() > Dummy.MAX_MEMBER_INT);
    }
}
