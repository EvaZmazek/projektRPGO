% DEFINIRANJE

% kocke
x0 = [0.1 0 0];
y0 = [0 0.2 0];
z0 = [0 0 2];
T0 = [0 0 0];
K = kocka_vek(x0,y0,z0, T0);

% rotacije
fi = 0:pi/6:2*pi;
osi = ones(size(fi,2),3);

N = length(fi);
Q = zeros(length(fi),4);
for i = 1:length(fi)
    os = osi(i,:);
    kot = fi(i);
    q = kot_v_kvat(kot, os);
    Q(i,:) = q;
end

% translacija

B = [-9 -9 -9; -3 -3 3 ;8 8 8];
B0 = [0 0 0]; % samo za rotacijo


% RISANJE

hold on
n = 10;
t = linspace(0,1,n);

meja = 3;

%kontrolne rotacije
for i = 1:N
    q = Q(i,:);
    os = osi(i,:);
    [kont_K,x,y,z] = rotirana_kocka(x0,y0,z0,q);
    barva = [(N-i)/N, 1, 0];
    risi_kocko(kont_K, barva);
    X = [0, os(1)];
    Y = [0, os(2)];
    Z = [0, os(3)];
    plot3(X,Y,Z, 'Color', barva)
end
xlabel('x');
ylabel('y');
zlabel('z');
scatter3(osi(:,1),osi(:,2), osi(:,3))

[mat_Q, w, c] = izracunaj_vse(Q,B0,t);
narisi_vse(x0,y0,z0,T0, mat_Q,c,t, meja, 0, 0, 0, 0)

% pause
% risi_kocko(rotirana_kocka(x0,y0,z0,Q(1,:)), 'y');
% risi_kocko(rotirana_kocka(x0,y0,z0,Q(end,:)), 'g');
pause

axis([-10 10, -10 10, -10 10])

n = 10;
t = linspace(0,1,n);

plot3(B(:,1),B(:,2),B(:,3), 'LineWidth', 1.5, 'Color','k')
scatter3(B(:,1),B(:,2),B(:,3))
pause
plotbezier(B,linspace(0,1,5*n));
pause
[mat_Q, w, c] = izracunaj_vse(Q,B,t);
narisi_vse(x0,y0,z0,T0, mat_Q,c,t, 10, 1, 0, 1, 0)

T = linspace(0,1,50);

pause
clf
[mat_Q, w, c] = izracunaj_vse(Q,B,T);
narisi_vse(x0,y0,z0,T0, mat_Q,c,T, 10, 1, 0, 0, 0)
xlabel('x');
ylabel('y');
zlabel('z');
plotbezier(B,linspace(0,1,5*n));
pause
narisi_vse(x0,y0,z0,T0, mat_Q,c,T, 10, 1, 1, 0, 0)

% pause
% clf
% 
% n = 50;
% t = linspace(0,1,n);
% B = [-9 -9 -9; -6 8 10; -10 10 -10; 7 -5 -8; 8 -6 8];
% [mat_Q, w, c] = izracunaj_vse(Q,B,t);
% plotbezier(B,t);
% narisi_vse(x0,y0,z0,T0, mat_Q,c,t, 10, 1, 1, 1, 1)



