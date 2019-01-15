function narisi_vse(x0,y0,z0,T0, mat_Q,c, t, osi, prehod,tirnice,robovi, pavza)
%Tole bo narisalo vse
%input:
% x0,y0,z0                  stranice kvadra
% T0                        izhodisce kvadra
% mat_Q                     matrika sfericnih rotacij
% c                         matrika normirane translacijske funkcije
% t                         parametri, pri katerih racunamo
% osi                       dolzine osi
% prehod, tirnice, robovi   1 ali 0, kaj hocemo risati
% pavza                     1 ali 0, ce hocemo pavzirati
n = length(t);

H = cell(n,1);
P = cell(n,1);
hold on
axis equal
axis([-osi osi -osi osi -osi osi])

% Rise prehajanje kvadrov

if nargin < 12
    pavza = 0;
end

for i = 1:n
    if pavza
        pause
    end
    H{i} = quat_rot_mat(mat_Q(i,:));
    x = (H{i}*x0')';
    y = (H{i}*y0')';
    z = (H{i}*z0')';
    P{i} = [x;y;z];
    if prehod
        if (mod(i, 1) == 0 || i == 1)
            risi_kocko(kocka_vek(x, y, z, c(i,:)), [(n-i)/n, 0, i/n]);
        end
    end
end

% Rise tirnice, po katerih se premikajo oglisca kvadra
if tirnice
    plot_tirnice(P,c)
    plot3(c(:,1), c(:,2), c(:,3),'LineWidth', 2, 'Color', 'k')
end
% Narise izracunano prvo in zadnje stanje
if robovi
    H = quat_rot_mat(mat_Q(end,:));
    x = (H*x0')';
    y = (H*y0')';
    z = (H*z0')';
    T = T0+c(end,:);
    risi_kocko(kocka_vek(x, y, z, T),'g');
    H = quat_rot_mat(mat_Q(1,:));
    x = (H*x0')';
    y = (H*y0')';
    z = (H*z0')';
    T = T0+c(1,:);
    risi_kocko(kocka_vek(x, y, z, T),'y');
end
end

