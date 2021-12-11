# The simple Fermat compositeness test

def TestFermat(N):

    a = randint(1,N-1)
    g = gcd(a,N)

    if g > 1:
        print("N is composite " + str(g) + " divides N.")
        return 0

    Ring = Integers(N)
    a = Ring(a)

    if a ** (N-1) -1 != 0:
        print("N is composite " + str(a) + " is Fermat witness.")
        return 0

    return 1
