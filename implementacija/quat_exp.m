function e = quat_exp(q, t)
%input:
% q             kvaternion [a, b, c, d]
% t             eksponent
%output:
% e             rezultat q^t

if t==-1
    e = conj_quat(q)/norm(q);
else
    a = q(1);
    v = quat_vec(q);
    theta = acos(a/norm(q));
    n = v/norm(v);

    e = norm(q)^t*[cos(t*theta), n*sin(t*theta)];
end

