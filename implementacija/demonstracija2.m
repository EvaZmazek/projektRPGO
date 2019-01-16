% DEFINIRANJE

% kocke
x0 = [1 0 0];
y0 = [0 1.5 0];
z0 = [0 0 2];
T0 = [0 0 0];
K = kocka_vek(x0,y0,z0, T0);


% rotacije
fi = 0:pi/6:2*pi;
osi = ones(size(fi,2),3);
osi(:,1) = zeros(size(osi,1),1);

N = length(fi);
Q = zeros(length(fi),4);
for i = 1:length(fi)
    os = osi(i,:);
    kot = fi(i);
    q = kot_v_kvat(kot, os);
    Q(i,:) = q;
end

% translacija

B = [-9 -9 -9; 4 -3 -5; -3 3 6 ; 5 2 3; 8 8 8];
B0 = [0 0 0]; % samo za rotacijo


% RISANJE

hold on

axis([-10 10, -10 10, -10 10])
axis equal
xlabel('x');
ylabel('y');
zlabel('z');

n = 10;
t = linspace(0,1,n);

plot3(B(:,1),B(:,2),B(:,3), 'LineWidth', 1.5, 'Color','k')
scatter3(B(:,1),B(:,2),B(:,3))
pause
plotbezier(B,linspace(0,1,5*n));
pause
[mat_Q, w, c] = izracunaj_vse(Q,B,t);
narisi_vse(x0,y0,z0,T0, mat_Q,c,t, 10, 1, 1, 1, 1)
pause
clf
axis([-10 10, -10 10, -10 10])
axis equal
xlabel('x');
ylabel('y');
zlabel('z');
narisi_vse(x0,y0,z0,T0, mat_Q,c,t, 10, 1, 0, 0, 0)

