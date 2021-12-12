# Let G = <g> be a cyclic Group of order N and a be an element of G.
# DL_BSGS outputs the log of a in base g.
#
# We use the Baby Step Giant Step paradigm as introduced by Shanks in 1974.
# This yelds in a complexity of O(|G|^(1/2)).
#
# Nb: To benefit from this approach it is very important to use a HashTable

def DL_BSGS(G,N,g,a):

    u = ceil(sqrt(N))

    if a == g:
        return 1
    
    a_inv = 1/a
 
    # Baby Steps
    HashTable = {a_inv * G(1):0,a_inv *g:1}
    H = a_inv * g
    for i in range(1,u-1):
        H =  H * g
        if H == G(1):
            return i+1
        HashTable[H] = i+1

    # Giant Steps
    H = H * g
    f = H ** -1 * a_inv 
    H = f
    for c in range(1,N//u+1):
        d = HashTable.get(H)
        if d != None:
            return c * u + d
        H = H * f
