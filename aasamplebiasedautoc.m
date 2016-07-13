function[R]=aasamplebiasedautoc(x,delay)

N=length(x);
for m=1:delay
    for n=1:N+1-m
        xs(m,n)=x(n-1+m);
    end;
end;
r1=xs*x';
r=r1'./N;
R=toeplitz(r);