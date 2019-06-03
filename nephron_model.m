clear all;
Parameters
global C0 Fna Q1_0 alpha C_star L;
%% Without Feedback
x=0:0.1:L;

C1=conc1(x);
figure(1)
plot(x,C1);
xlabel('x (mm)','FontSize',16); ylabel('[Na]','FontSize',16); title('Descending Loop of Henle Concentration','FontSize',16)

C2=Conc2(x);
figure(2)
plot(x,C2);
xlabel('x (mm)','FontSize',16); ylabel('[Na]','FontSize',16); title('Ascending Loop of Henle Concentration','FontSize',16)

figure(3)
plot([C1 flip(C2)])
ylabel('[Na]','FontSize',16); title('Concentration Through Loop of Henle','FontSize',16);
xticks([]);

fH20=Fna./C1;
figure(4)
plot(x,C1);
xlabel('x (mm)','FontSize',16); ylabel('Flux (L/(min*mm))','FontSize',16); title('Descending Loop of Henle Water Flux','FontSize',16)

%note that these graphs assume ADH is NOT present
Q2=Q1_0*exp(-alpha);
t=0:0.1:10;
figure(5)
plot(t,Q2.*t);
xlabel('Minutes','FontSize',16); ylabel('Urine Volume (L)','FontSize',16); title('Urine Volume Output Over Time','FontSize',16)

figure(6)
C_urine=Conc2(0);
plot(t,Q2.*t*C_urine);
xlabel('Minutes','FontSize',16); ylabel('Na excreted (mol)','FontSize',16); title('Sodium Output Over Time','FontSize',16)

%% With Juxtaglomerular Feedback
close all;

%add a check for if c_star<<C0?

ADH=1; %indicate if ADH is present or not
%or maybe write some function/expression to choose base on C0?

%print out useful info:
a=exp(alpha)*(1-alpha)
Q1_0=Fna*L/C0
CL=exp(1)*C0

Q3=Fna*L*C_star/(exp(1)*C0)^2;
Q2=Fna*L/(exp(1)*C0);

if ADH==1
    Qout=Q3 %Q3 leaving collecting duct
    Qalt=Q2; %alternative choice 
else 
    Qout=Q2 %constant Q2 value, which leaves the collecting duct
    Qalt=Q3;
end

t=0:0.1:10;
figure(1)
plot(t,Qout.*t);
xlabel('Minutes','FontSize',16); ylabel('Urine Volume (L)','FontSize',16); title('Urine Volume Output Over Time','FontSize',16)
hold on
plot(t,Qalt.*t,'--'); legend('Actual','Alternative Choice');

figure(2)
plot(t,Qout.*t*C_star);
xlabel('Minutes','FontSize',16); ylabel('Na excreted (mol)','FontSize',16); title('Sodium Output Over Time','FontSize',16)
hold on
plot(t,Qalt.*t*C_star,'--'); legend('Actual','Alternative Choice');

figure(3)
C1=conc1(x);
figure(3)
plot(x,C1);
xlabel('x (mm)','FontSize',16); ylabel('[Na]','FontSize',16); title('Descending Loop of Henle Concentration','FontSize',16)

%% With Varying Nephron Lengths