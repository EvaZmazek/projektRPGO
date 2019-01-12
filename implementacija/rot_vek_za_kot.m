function v = rot_vek_za_kot(vec, kot_x,kot_y,kot_z)
%input:
% vec                   3D vektor
% kot_x,y,z             koti v x,y,z osi, za katere rotiramo vektor v
%output:
% v                     rotirani vektor

q = angle2quat(kot_x, kot_y, kot_z);
v = quatmultiply(q, quatmultiply([0 vec], conj_quat(q)));
end

