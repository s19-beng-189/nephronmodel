function C1=conc1(x)
global C0 Fna Q1_0;
C1=C0*exp(Fna*x/Q1_0/C0); %concentration at x on descending LH
end