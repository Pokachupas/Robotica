clc; clear; close all;

q1 = deg2rad(0);
q2 = deg2rad(0);
q3 = deg2rad(0);
q4 = 0;
%---- Vectores punto a punto ----
r0_0 = [0; 0; 0];
R0_0 = eye(3);
r0_1 = [0; 0; 80];
r1_2 = [0; 0; 87.5];
r2_3 = [-130; 0; 0];
r3_4 = [0; 0; -15];
r4_5 = [0; 140; 0];
r5_6 = [0;0;72.50 - q1];
r6_7 = [0;0;55];
%------- Matrices de vectores unitarios -----------
R0_1 = eye(3); 
R1_2 = Rz(q2);
R0_2 = R0_1*R1_2;
R2_3 = eye(3); 
R0_3 = R0_2*R2_3;
R3_4 = Rz(q3);
R0_4 = R0_3*R3_4;
R4_5 = eye(3);
R0_5 = R0_4*R4_5;
R5_6 = eye(3);
R0_6 = R0_5 *R5_6;
R6_7 = Rz(q4);
R0_7 = R0_6*R6_7;
%------- Vectores origne a punto -----
r0_2 = r0_1 + R0_1*r1_2;
r0_3 = r0_2 + R0_2*r2_3;
r0_4 = r0_3 + R0_3*r3_4;
r0_5 = r0_4 + R0_4*r4_5;
r0_6 = r0_5 + R0_5*r5_6;
r0_7 = r0_6 + R0_6*r6_7;
%------- Sistemas de Referencia ----------------
o0 = [R0_0 r0_0];
o1 = [R0_1 r0_1];
o2 = [R0_2 r0_2];
o3 = [R0_3 r0_3];
o4 = [R0_4 r0_4];
o5 = [R0_5 r0_5];
o6 = [R0_6 r0_6];
o7 = [R0_7 r0_7];
%--------- Gráficas --------------
a = 20;
figure(1)
% hold off

%------ Vectores de sistema a sistema ------
vlink(r0_0,r0_1,"o")
vlink(r0_1,r0_2,"o")
vlink(r0_2,r0_3,"o")
vlink(r0_3,r0_4,"o")
vlink(r0_4,r0_5,"o")
vlink(r0_5,r0_6,"o")
vlink(r0_6,r0_7,"o")
%------ Sistemas -------
frame(o0,0,a)
frame(o1,1,a)
frame(o2,2,a)
frame(o3,3,a)
frame(o4,4,a)
frame(o5,5,a)
frame(o6,6,a)
frame(o7,7,a)
grid on
axis(300*[-1 1.5 -1 1 0 2])
view(145,20)
figuresk(1,20,1,14)
% drawnow
% pause(0.1)
% hold on
% end

