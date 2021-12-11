def testRM(N,verbose=False):

    a = randint(2,N-1)
    m = N - 1

    v = m.valuation(2)
    m /= (2 ** v)
    g = gcd(a,N)

    if g > 1:
        if verbose:
            print("We found the Rabin Miller witness g : " + str(g))
        return False

    Ring = Integers(N)
    a = Ring(a)

    b = (a^m)

    if b == 1:
        return True

    for i in range(1,v):
        if (b^2 - 1) == 0:
            g = gcd(b+1,N)
            if g == 1 or g == N:
                if verbose:
                    print("We found the Rabin Miller witness g : " + str(g))
                return False
            else:
                return True
        b = b^2

    return False
