

# This file was *autogenerated* from the file fermat_test.sage
from sage.all_cmdline import *   # import sage library

_sage_const_1 = Integer(1); _sage_const_0 = Integer(0)# The simple Fermat compositeness test

def TestFermat(N):

    a = randint(_sage_const_1 ,N-_sage_const_1 )
    g = gcd(a,N)

    if g > _sage_const_1 :
        print("N is composite " + str(g) + " divides N.")
        return _sage_const_0 

    Ring = Integers(N)
    a = Ring(a)

    if a ** (N-_sage_const_1 ) -_sage_const_1  != _sage_const_0 :
        print("N is composite " + str(a) + " is Fermat witness.")
        return _sage_const_0 

    return _sage_const_1 
