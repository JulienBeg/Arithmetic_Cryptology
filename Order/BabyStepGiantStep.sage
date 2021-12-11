# Let G be a cyclic Group of order N and a be an element of G.
# BSGS outputs the order of a in G
#
# We use the Baby Step Giant Step paradigm as introduced by Shanks in 1974.
# This yelds in a complexity of O(|G|^(1/2)).
#
# Nb: To benefit from this approach it is very important to use a HashTable

def BSGS(G,N,a):

    u = ceil(sqrt(N))

    if a == G(1):
        return 0

    # Baby Steps
    HashTable = {G(1):0,a:1}
    H = a
    for i in range(1,u-1):
        H =  H * a
        if H == G(1):
            return i+1
        HashTable[H] = i+1

    # Giant Steps
    H = H * a # H = a^-u at this point
    print(H)
    print("\n")
    f = H ** -1
    H = f
    for c in range(1,N//u+1):
        # H = f ** c at this point
        d = HashTable.get(H)
        if d != None:
            return c * u + d
        H = H * f
