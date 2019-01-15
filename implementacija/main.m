% definicija kocke

% STRANICE KOCKE
x0 = [1 0 0];
y0 = [0 1.5 0];
z0 = [0 0 2];
T0 = [0 0 0];
K = kocka_vek(x0,y0,z0, T0);


% KVATERNIONI ZA OBRAÈANJE KOCKE

% Q0 = angle2quat(0, 0, 0);
% Q1 = angle2quat(pi/2, 0, 0);
% Q2 = angle2quat(pi/2, pi/4, 0);
% Q3 = angle2quat(pi/2, pi/4, pi/3);

% KVATERNIONI ZA OBRACANJE KOCKE

fi = [0, -pi/2 -pi/2 pi/2 -pi/2 3*pi/4]; 
osi = [1 0 0; 1 0 0; 0 1 0; 1 1 1; 1 0 1; 1 0 -1];

Q0 = kot_v_kvat(fi(1), osi(1,:));
Q1 = kot_v_kvat(fi(2), osi(2,:));
Q2 = kot_v_kvat(fi(3), osi(3,:));
Q3 = kot_v_kvat(fi(4), osi(4,:));
Q4 = kot_v_kvat(fi(5), osi(5,:));
Q5 = kot_v_kvat(fi(6), osi(6,:));

lok0 = arc_circle(0,0,1, fi(1),Q0, 50);
lok1 = arc_circle(0,0,1, fi(2),Q1, 50);
lok2 = arc_circle(0,0,1, fi(3),Q2, 50);
lok3 = arc_circle(0,0,1, fi(4),Q3, 50);
lok4 = arc_circle(0,0,1, fi(5),Q4, 50);
lok5 = arc_circle(0,0,1, fi(6),Q5, 50);


Q = [Q0; Q1; Q2; Q3; Q4; Q5];

% to vse dela, èe ne obraèamo okoli y-osi

% PRIMER: pri temle naj bi sel po "dolgi poti", vendar se mi zdi
%  da je brez popravka boljse (glej funkcijo "slerp")
% Q0 = kot_v_kvat(0, [1,0,0]);
% Q1 = kot_v_kvat(pi/4, [1,0,0]);
% Q2 = kot_v_kvat(-pi/2, [0,0,1]);
% Q3 = kot_v_kvat(3*pi/4, [1,0,-1]);


% BEZIERJEVA KRIVULJA ZA TRANSLACIJO
b0 = [-9 -9 -9];
b1 = [-6 8 10];
b2 = [-10 10 -10];
b3 = [7 -5 -8];
b4 = [8 -6 8];
%B = [b0; b1; b2; b3; b4];
B = [0 0 0]; % èe hoèemo videti samo sferièno rotacijo

n = 5;
t = linspace(0,1,n);
os = 10;

[mat_Q, w, c] = izracunaj_vse(Q,B,t);
narisi_vse(x0,y0,z0,T0, mat_Q,c,t, os, 0, 0, 1)

%plot3(B(:,1),B(:,2),B(:,3), 'LineWidth', 1.5, 'Color','k')
%scatter3(B(:,1),B(:,2),B(:,3))
plot3(lok0(1,:),lok0(2,:),lok0(3,:),'b')
plot3(lok1(1,:),lok1(2,:),lok1(3,:),'b')
plot3(lok2(1,:),lok2(2,:),lok2(3,:),'b')
plot3(lok3(1,:),lok3(2,:),lok3(3,:),'b')
plot3(lok4(1,:),lok4(2,:),lok4(3,:),'b')
plot3(lok5(1,:),lok5(2,:),lok5(3,:),'b')



% 
% % ZLEPKI?
% % to sta še dva premika, ki se nadaljujeta 
% % samo C^0 zveznost
% 
% QQ = [Q3; kot_v_kvat(pi/4, [-1,0,1]); kot_v_kvat(pi/2, [1,0,0]); kot_v_kvat(pi/3, [1,0,1])]; 
% BB = [b3; 2 3 4; 5 6 7; -5 -5 5];
% [mat_QQ, ww, cc] = izracunaj_vse(QQ,BB,t);
% narisi_vse(x0,y0,z0,T0, mat_QQ,cc,t, os, 1, 1, 1)
% %plot3(BB(:,1),BB(:,2),BB(:,3))
% %scatter3(BB(:,1),BB(:,2),BB(:,3))
% 
% QQQ = [QQ(end,:); kot_v_kvat(-pi/3, [1,0,1]); kot_v_kvat(pi/2, [0,0,1]); kot_v_kvat(-pi/2, [1,0,0])]; 
% BBB = [BB(end,:); 0 9 0; 0 0 -9; 0 0 0];
% [mat_QQQ, www, ccc] = izracunaj_vse(QQQ,BBB,t);
% narisi_vse(x0,y0,z0,T0, mat_QQQ,ccc,t, os, 1, 1, 1)
% %plot3(BBB(:,1),BBB(:,2),BBB(:,3))
% %scatter3(BBB(:,1),BBB(:,2),BBB(:,3))
% 
% % Èe združimo kontrolne poligone, dobimo precej drugaène premik
% % N = 5*n;
% % skupaj_Q = [Q; QQ(2:end-1,:); QQQ];
% % skupaj_B = [B; BB(2:end-1,:); BBB];
% % [mat_skuQ, skuw, skuc] = izracunaj_vse(skupaj_Q,skupaj_B,linspace(0,1,N));
% % narisi_vse(x0,y0,z0,T0, mat_skuQ,skuc,linspace(0,1,N), os, 1, 1, 1)
























