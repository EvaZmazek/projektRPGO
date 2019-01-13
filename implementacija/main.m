% definicija kocke

% STRANICE KOCKE
x0 = [1 0 0];
y0 = [0 1.5 0];
z0 = [0 0 2];
T0 = [0 0 0];
K = kocka_vek(x0,y0,z0, T0);

% Q0 = angle2quat(0, 0, 0);
% Q1 = angle2quat(pi/2, 0, 0);
% Q2 = angle2quat(pi/2, pi/4, 0);
% Q3 = angle2quat(pi/2, pi/4, pi/3);

% KVATERNIONI ZA OBRAÈANJE KOCKE
Q0 = kot_v_kvat(0, [1,0,0]);
Q1 = kot_v_kvat(-pi/2, [1,0,0]);
Q2 = kot_v_kvat(-pi/2, [0,0,1]);
Q3 = kot_v_kvat(3*pi/4, [1,0,-1]);
% to vse dela, èe ne obraèamo okoli y-osi

% PRIMER: pri temle naj bi šel po "dolgi poti", vendar se mi zdi
%  da je brez popravka boljše (glej funkcijo "slerp")
% Q0 = kot_v_kvat(0, [1,0,0]);
% Q1 = kot_v_kvat(pi/4, [1,0,0]);
% Q2 = kot_v_kvat(-pi/2, [0,0,1]);
% Q3 = kot_v_kvat(3*pi/4, [1,0,-1]);

n = 100;
B = [Q0; Q1; Q2; Q3];
t = linspace(0,1,n);

mat_Q = polepsaj_sbezier(sbezier(B,t));
%mat_Q = bezier(B,t);

b0 = [-9 -9 -9];
b1 = [6 2 5];
b2 = [-8 6 9];
b3 = [5 5 -5];
B2 = [b0; b1; b2; b3];
w = bezier(B2,t); % premik izhodišèa
c = translacija(w, mat_Q, t); % normiran premik izhodišèa
%ni najlepše napisano, potrebni argumenti so zelo specifièni


% RISANJE SFERIÈNEGA PREMIKANJA 
% to bova najbrž skombinirala s translacijo v eno funkcijo
H = cell(n,1);
P = cell(n,1);
hold on
axis equal
A = 10;
axis([-A A -A A -A A])
x = x0;
y = y0;
z = z0;
for i = 1:n
    H{i} = quat_rot_mat(mat_Q(i,:));
    x = (H{i}*x0')';
    y = (H{i}*y0')';
    z = (H{i}*z0')';
    P{i} = [x;y;z];
    if (mod(i, 1) == 0 || i == 1)
        risi_kocko(kocka_vek(x, y, z, c(i,:)), [(n-i)/n, 0, i/n]);
    end
end
% X = zeros(n);
% Y = zeros(n);
% Z = zeros(n);
% for i = 1:n
%     diag_p = sum(P{i});
%     ci = c(i,:);
%     X(i) = diag_p(1)+ci(1);
%     Y(i) = diag_p(2)+ci(2);
%     Z(i) = diag_p(3)+ci(3);
% end
% plot3(X,Y,Z)

plot_tirnice(P,c)
%scatter3(B(:,1), B(:,2), B(:,3),'g');
plot3(c(:,1), c(:,2), c(:,3),'LineWidth', 2, 'Color', 'k')

% RISANJE POLIGONA

H = quat_rot_mat(Q3);
x = (H*x0')';
y = (H*y0')';
z = (H*z0')';
T = T0+c(end,:);
risi_kocko(kocka_vek(x, y, z, T),'g');
H = quat_rot_mat(Q0);
x = (H*x0')';
y = (H*y0')';
z = (H*z0')';
T = T0+c(1,:);
risi_kocko(kocka_vek(x, y, z, T),'y');

%plot_kontrolne_kocke(x0,y0,z0,T0, B,c, 'y','c','g',0) % dodati še translacijo
