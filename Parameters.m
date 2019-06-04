%% Parameters 

%note: values are NOT realistic and units are arbitrary

Fna = 25; %sodium flux in mol/(time*length)
C0 = 150; %c(0) in mol/volume
Q1_0 = 2; %Q1(0) in volume/time
L = 10; %nephron length
C_star = 50; %desired urine concentration for feedback mechanism

alpha = Fna*L/(Q1_0*C0);
alpha_check=(alpha<=1) %returns true if alpha is less than or equal to 1
