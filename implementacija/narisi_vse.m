function narisi_vse(x0,y0,z0,T0, mat_Q,c, t, osi, prehod,tirnice,robovi)
%Tole bo narisalo vse
%input:
% x0,y0,z0                  stranice kvadra
% T0                        izhodi��e kvadra
% mat_Q                     matrika sferi�nih rotacij
% c                         matrika normirane translacijske funkcije
% t                         parametri, pri katerih ra�unamo
% osi                       dol�ine osi
% prehod, tirnice, robovi   1 ali 0, kaj ho�emo risati
n = length(t);

H = cell(n,1);
P = cell(n,1);
hold on
axis equal
axis([-osi osi -osi osi -osi osi])

% Ri�e prehajanje kvadrov

for i = 1:n
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

% Ri�e tirnice, po katerih se premikajo ogli��a kvadra
if tirnice
    plot_tirnice(P,c)
    plot3(c(:,1), c(:,2), c(:,3),'LineWidth', 2, 'Color', 'k')
end
% Nari�e izra�unano prvo in zadnje stanje
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

