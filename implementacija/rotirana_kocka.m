function [K0, x0, y0, z0] = rotirana_kocka(x,y,z,Q)

H = quat_rot_mat(Q);
x0 = (H*x')';
y0 = (H*y')'; 
z0 = (H*z')';
K0 = kocka_vek(x0,y0,z0, [0 0 0]);

end

