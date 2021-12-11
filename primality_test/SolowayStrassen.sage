def myJacobi(m,n):
    if m < 0:
        return (-1) ** ((n-1)/2)  * myJacobi(-m,n)
    elif m > 0 and m % 2 == 0:
        return (-1) ** ((n ** 2 - 1)/8) * myJacobi(m/2,n)
    elif m > 1 and m % 2 == 1:
        return (-1) ** ((m-1)*(n-1)/4) * myJacobi(n % m, m)
    elif m == 1:
        return 1
    return 0

def SolovayStrassen(n):
    if n % 2 == 0:
        return False

    a = randint(2,n-1)
    if gcd(a,n)>1:
        return False

    return myJacobi(a,n) == a^((n-1)/2) % n
