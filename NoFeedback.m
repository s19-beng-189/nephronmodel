clear all;
Parameters
global C0 Fna Q1_0 alpha C_star L;

x=0:0.1:L;

C1=conc1(x);
C2=Conc2(x);

figure(1)
plot([C1 flip(C2)])
ylabel('[Na]','FontSize',16); title('Concentration Through Loop of Henle','FontSize',16);
xticks([0 101 202]);
xticklabels({'0','L','0'});

fH20=Fna./C1;
figure(4)
plot(x,C1);
xlabel('x (mm)','FontSize',16); ylabel('Flux (L/(min*mm))','FontSize',16); title('Descending Loop of Henle Water Flux','FontSize',16)
