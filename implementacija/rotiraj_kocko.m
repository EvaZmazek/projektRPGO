function K1 = rotiraj_kocko(K0, kot_x, kot_y, kot_z)
%zarotira kocko K0 za podane kote

K1 = zeros(size(K0));
for i = 1:8
    K1(i,:) = quat_vec(rot_vek_za_kot(K0(i,:), kot_x, kot_y, kot_z));
end
end

