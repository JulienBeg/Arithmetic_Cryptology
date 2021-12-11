# Let G be a cyclic Group of order N and a be an element of G.
# RHO outputs the order of a in G with some probability and failure otherwise
#
# This algorithm is based on the Pollard Rho algorithm combined with
# Floyd algorithm. This is a probabilistic approach.


#This versions works for groups with integer elements
def RHO(G,N,a,r=10):

    if a == G(1):
        return 0

    Gamma = []
    for _ in range(r):
        gamma = randint(2,N-1)
        Gamma.append((a ** gamma,gamma))

    def Iterate(x,c): # x = a^c
        i = x.lift() % r
        x *= Gamma[i][0]
        c += Gamma[i][1]
        return x,c%N

    x,y,cx,cy = a,a,0,0

    Next = True
    while Next:
        x,cx = Iterate(x,cx)
        y,cy = Iterate(y,cy)
        y,cy = Iterate(y,cy)
        Next = (x != y)

    if cx != cy:
        return cy - cx % N

    return "Failure"
