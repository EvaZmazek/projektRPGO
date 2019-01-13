function c = quatmultiply(a,b)
%QUATMULTIPLY izracuna produkt dveh kvaternionov, kot je opisano v clanku
%
% Input:
% a ... prvi kvaternion
% b ... drugi kvaternion
%
% Output:
% c ... produkt (nov kvaternion)

c = zeros(1,4);
a_s = a[1];
b_s = b[1];

a_v = quat_vec(a);
b_v = quat_vec(b);

c[1] = a_s * b_s - a_v * b_v;
c_v = a_s * b_v + b_s * a_v + cross(a_v,b_v);
end

