function C2 = Conc2(x,L)
global alpha L Fna Q1_0 C0
C2 = C0*exp(alpha)+(x-L)*Fna*exp(alpha)/Q1_0; %concentration at x on ascending LH
end