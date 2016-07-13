function snra = calculoSNR(x,y)

Px = x'*x;
Px = Px/length(x);

e = x-y;
Pe = e'*e;
Pe = Pe/length(e);

snra = 10*log10(Px/Pe);