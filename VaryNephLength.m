%% With Varying Nephron Lengths
global L Fna Q1_0 C0
for L = 1:5                %vary nephron lengths of individual nephrons (mm)
    Q1_0 = Fna*L/C0;        %find initial flow     
    Q2 = Fna*L/(exp(1)*C0); %find final flow
    x=0:0.1:L;              %vary x along L
    C1 = conc1(x);          %find descending concentration
    C2 = Conc2(x,L);        %find ascending concentration
    
    figure(7)               %plot concentration vs distance for each nephron length
    plot(x,C1)
    hold on
    figure(8)
    plot(x,C2)
    hold on
end
figure(7)
xlabel('x (mm)','FontSize',16); ylabel('[Na]','FontSize',16); title('Descending Loop of Henle Concentration','FontSize',16)
figure(8)
xlabel('x (mm)','FontSize',16); ylabel('[Na]','FontSize',16); title('Ascending Loop of Henle Concentration','FontSize',16)
hold off