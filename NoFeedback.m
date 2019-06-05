clear all;
Parameters
global C0 Fna Q1_0 alpha C_star L;

x=0:0.1:L;
C1=conc1(x);
C2=Conc2(x);

figure(1)
Cplot=[C1(1:end-1) flip(C2)];
plot(Cplot)
ylabel('[Na] (mM)','FontSize',16); xlabel('X (cm)','FontSize',16); title('Concentration Through Loop of Henle','FontSize',16);
xticks([0 length(Cplot)/2 length(Cplot)]);
xticklabels({'0','L','0'});

fH20=Fna./C1;
figure(4)
plot(x,fH20);
xlabel('X (cm)','FontSize',16); ylabel('Flux (mmol/L/cm)','FontSize',16); title('Descending Loop of Henle Water Flux','FontSize',16)

urine_C=Conc2(0) %ending urine concentration
Q3=Q1_0*exp(alpha); %flow leaving collecting duct
Q_urine=Q3*1e6*2 %assuming 1 million total nephrons/kidney