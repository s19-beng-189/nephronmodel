%% Parameters 

%note: values are estimated and possibly not super realistic

Fna = 8.9100e-06; %sodium flux in mmol/(L*cm)
C0 = 300; %c(0) in mmOsm (mmol/L)
Q1_0 = 1.6500e-07; %Q1(0) in L/min
L = 5; %nephron length in cm
C_star = 100; %desired urine concentration for feedback mechanism

alpha = Fna*L/(Q1_0*C0);
alpha_check=(alpha<=1) %returns true if alpha is less than or equal to 1
if alpha_check==0
    disp(['STOP! Alpha is greater than 1; try again.']);
end
