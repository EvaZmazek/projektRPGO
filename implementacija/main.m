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

Q0 = kot_v_kvat(0, [1,0,0]);
Q1 = kot_v_kvat(-pi/2, [1,0,0]);
Q2 = kot_v_kvat(-pi/2, [0,0,1]);
Q3 = kot_v_kvat(3*pi/4, [1,0,-1]);

Q = [Q0; Q1; Q2; Q3];

% to vse dela, èe ne obraèamo okoli y-osi


% PRIMER: pri temle naj bi sel po "dolgi poti", vendar se mi zdi
%  da je brez popravka boljse (glej funkcijo "slerp")
% Q0 = kot_v_kvat(0, [1,0,0]);
% Q1 = kot_v_kvat(pi/4, [1,0,0]);
% Q2 = kot_v_kvat(-pi/2, [0,0,1]);
% Q3 = kot_v_kvat(3*pi/4, [1,0,-1]);



% BEZIERJEVA KRIVULJA ZA TRANSLACIJO
b0 = [-9 -9 -9];
b1 = [6 2 5];
b2 = [-8 6 9];
b3 = [5 5 -5];
B = [b0; b1; b2; b3];

n = 15;
t = linspace(0,1,n);
os = 10;

[mat_Q, w, c] = izracunaj_vse(Q,B,t);
narisi_vse(x0,y0,z0,T0, mat_Q,c,t, os, 1, 1, 1)
%plot3(B(:,1),B(:,2),B(:,3))
%scatter3(B(:,1),B(:,2),B(:,3))

% ZLEPKI?
% to sta še dva premika, ki se nadaljujeta 
% samo C^0 zveznost

QQ = [Q3; kot_v_kvat(pi/4, [-1,0,1]); kot_v_kvat(pi/2, [1,0,0]); kot_v_kvat(pi/3, [1,0,1])]; 
BB = [b3; 2 3 4; 5 6 7; -5 -5 5];
[mat_QQ, ww, cc] = izracunaj_vse(QQ,BB,t);
narisi_vse(x0,y0,z0,T0, mat_QQ,cc,t, os, 1, 1, 1)
%plot3(BB(:,1),BB(:,2),BB(:,3))
%scatter3(BB(:,1),BB(:,2),BB(:,3))

QQQ = [QQ(end,:); kot_v_kvat(-pi/3, [1,0,1]); kot_v_kvat(pi/2, [0,0,1]); kot_v_kvat(-pi/2, [1,0,0])]; 
BBB = [BB(end,:); 0 9 0; 0 0 -9; 0 0 0];
[mat_QQQ, www, ccc] = izracunaj_vse(QQQ,BBB,t);
narisi_vse(x0,y0,z0,T0, mat_QQQ,ccc,t, os, 1, 1, 1)
%plot3(BBB(:,1),BBB(:,2),BBB(:,3))
%scatter3(BBB(:,1),BBB(:,2),BBB(:,3))

% Èe združimo kontrolne poligone, dobimo precej drugaène premik
% N = 5*n;
% skupaj_Q = [Q; QQ(2:end-1,:); QQQ];
% skupaj_B = [B; BB(2:end-1,:); BBB];
% [mat_skuQ, skuw, skuc] = izracunaj_vse(skupaj_Q,skupaj_B,linspace(0,1,N));
% narisi_vse(x0,y0,z0,T0, mat_skuQ,skuc,linspace(0,1,N), os, 1, 1, 1)

























