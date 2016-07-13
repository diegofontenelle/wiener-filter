function r=corrcruzada(x,d,lg)

N=length(x);
for m=1:lg
    for n=1:N+1-m
        xs(m,n)=x(n-1+m);
    end;
end;
r1=xs*d';
r=r1'./N;