# Let G = <g> be a cyclic Group of order N and a be an element of G.
# DL_RHO outputs the log of a in base g with some probability and failure otherwise
#
# This algorithm is based on the Pollard Rho algorithm combined with
# Floyd algorithm. This is a probabilistic approach.


#This versions works for groups with integer elements
def DL_RHO(G,N,g,a,r=10):

    if a == g:
        return 1

    Gamma = []
    for _ in range(r):
        gamma = randint(2,N-1)
        delta = randint(2,N-1)
        Gamma.append(((a ** gamma) * (g ** delta),gamma,delta))

    def Iterate(x,ca,cg): # x = a^c
        i = x.lift() % r
        x *= Gamma[i][0]
        ca += Gamma[i][1]
        cg += Gamma[i][2]
        return x,ca%N,cg%N

    x,y,cxa,cya,cxg,cyg = G(1),G(1),0,0,0,0

    Next = True
    while Next:
        x,cxa,cxg = Iterate(x,cxa,cxg)
        y,cya,cyg = Iterate(y,cya,cyg)
        y,cya,cyg = Iterate(y,cya,cyg)
        Next = (x != y)

    if gcd(cxa - cya,N) == 1:
        return (Integers(N)(cyg - cxg) * Integers(N)(cxa - cya) ** (-1)).lift()

    return "Failure"
