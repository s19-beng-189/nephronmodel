clear all;
Parameters
global C0 Fna Q1_0 alpha C_star L;

ADH=1; %indicate if ADH is present or not

%add a check for if c_star<<C0
C_check=(C_star<C0)

%useful info:
Q1_0=Fna*L/C0;
alpha=Fna*L/(Q1_0*C0);
CL=exp(1)*C0;
a=exp(alpha)*(1-alpha);

Q3=Fna*L*C_star/(exp(1)*C0)^2;
Q2=Fna*L/(exp(1)*C0);

x=0:0.1:L;
C1=conc1(x);
C2=(exp(1)*C0-C_star)/L*x+C_star;

p_remain=Q3/Q2; %remaining percentage of water in collecting duct per unit time if ADH is present

if ADH==1
    Qout=Q3; %Q3 leaving collecting duct
    Qalt=Q2; %alternative choice 
    C_urine=C_star/p_remain
else %(no ADH)
    Qout=Q2; %constant Q2 value, which leaves the collecting duct
    Qalt=Q3;
    C_urine=C_star
end

Q_urine=Qout*2*1e6 %assuming 1 million total nephrons/kidney

figure(3)
Cplot=[C1(1:end-1) flip(C2)];
plot(Cplot)
ylabel('[Na]','FontSize',16); xlabel('Position','FontSize',16); title('Concentration Through Loop of Henle','FontSize',16);
xticks([0 length(Cplot)/2 length(Cplot)]);
xticklabels({'0','L','0'});