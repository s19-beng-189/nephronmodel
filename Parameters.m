%% Parameters 
global alpha L Fna Q1_0 C0
%notes! no idea if these values are realistic haha i just put something to
%test the scripts

Fna = 20; %sodium flux in ions/(min*mm)
C0 = 140; %c(0) in mol/L
Q1_0 = 2; %Q1(0) in L/min
L = 10; %nephron length in mm
C_star= 60; %desired urine concentration for feedback mechanism

alpha = Fna*L/(Q1_0*C0);
