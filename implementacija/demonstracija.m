% DEFINIRANJE

% kocke
x0 = [0.1 0 0];
y0 = [0 0.2 0];
z0 = [0 0 2];
T0 = [0 0 0];
K = kocka_vek(x0,y0,z0, T0);

% rotacije
fi = [0, pi/3 pi/3 pi/3 -pi/2 3*pi/4]; 
osi = [1 1 0 ; 1 0 0; 0 1 0; 1 1 1; 1 0 1; -1 -1 -1];

N = length(fi);
Q = zeros(length(fi),4);
for i = 1:length(fi)
    os = osi(i,:);
    kot = fi(i);
    q = kot_v_kvat(kot, os);
    Q(i,:) = q;
end

% translacija

%B = [-9 -9 -9; -6 8 10; -10 10 -10; 7 -5 -8; 8 -6 8];
B = [0 0 0]; % samo za rotacijo


% RISANJE

hold on
n = 10;
t = linspace(0,1,n);
meja = 3;

%kontrolne rotacije
for i = 1:N
    q = Q(i,:);
    [kont_K,x,y,z] = rotirana_kocka(x0,y0,z0,q);
    barva = [(N-i)/N, 1, i/N];
    risi_kocko(kont_K, barva)
end

[mat_Q, w, c] = izracunaj_vse(Q,B,t);
narisi_vse(x0,y0,z0,T0, mat_Q,c,t, meja, 1, 0, 0, 1)

pause
risi_kocko(rotirana_kocka(x0,y0,z0,Q(1,:)), 'y');
risi_kocko(rotirana_kocka(x0,y0,z0,Q(end,:)), 'g');
pause

axis([-10 10, -10 10, -10 10])

n = 10;
t = linspace(0,1,n);
B = [-9 -9 -9; -6 8 10; -10 10 -10; 7 -5 -8; 8 -6 8];

plot3(B(:,1),B(:,2),B(:,3), 'LineWidth', 1.5, 'Color','k')
scatter3(B(:,1),B(:,2),B(:,3))
pause
plotbezier(B,t);
pause
[mat_Q, w, c] = izracunaj_vse(Q,B,t);
narisi_vse(x0,y0,z0,T0, mat_Q,c,t, 10, 1, 0, 1, 1)

pause
clf

n = 50;
t = linspace(0,1,n);
B = [-9 -9 -9; -6 8 10; -10 10 -10; 7 -5 -8; 8 -6 8];
[mat_Q, w, c] = izracunaj_vse(Q,B,t);
narisi_vse(x0,y0,z0,T0, mat_Q,c,t, 10, 1, 0, 1, 1)



