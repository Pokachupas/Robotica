clc; close all; clear;
filename = '../Imagenes/Logo.dxf';
data = readdxf(filename);
Pd = data{1};
if size(data,2) > 1
    for i = 1:size(data,2)
        Pd = [Pd; data{i}];
    end
end
Np = length(Pd);
Pd = [Pd zeros(Np,1)];
Pd = 0.5*Pd;
Pd
% ---------------------------
q1 = 0;
q2 = 0;
q3 = 0;
% syms q1 q2 q3
% assume([q1 q2 q3],'real')
% ---------------------------
r0_0 = [0;0;0];
R0_0 = eye(3);
r0_1 = [0;0;15];
r1_2 = [0;0;50];
r2_3 = [45-q3;0;0];
r3_4 = [13;0;0];
% ---------------------------
R0_1 = Rz(deg2rad(q1));
R1_2 = Ry(deg2rad(q2));
R0_2 = R0_1*R1_2;
R2_3 = eye(3);
R0_3 = R0_2*R2_3;
R3_4 = eye(3);
R0_4 = R0_3*R3_4;
% ---------------------------
r0_2 = r0_1 + R0_1*r1_2;
r0_3 = r0_2 + R0_2*r2_3;
r0_4 = r0_3 + R0_3*r3_4;
% ---------------------------
o0 = [R0_0 r0_0];
o1 = [R0_1 r0_1];
o2 = [R0_2 r0_2];
o3 = [R0_3 r0_3];
o4 = [R0_4 r0_4];
%%
figure
a = 10;
vlink(r0_0,r0_1,'o')
vlink(r0_1,r0_2,'o')
vlink(r0_2,r0_3,'o')
vlink(r0_3,r0_4,'o')
frame(o0,0,a)
frame(o1,1,a)
frame(o2,2,a)
frame(o3,3,a)
frame(o4,4,a)
plot3(Pd(:,1),Pd(:,2),Pd(:,3),'b')
grid on
axis(100*[-1 1.5 -1 1 0 2])
view(145,20)
figuresk(1,20,1,14)

