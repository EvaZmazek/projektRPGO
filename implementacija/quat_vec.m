function v = quat_vec(Q)
%input:
%Q              kvaternion (q0, q1, q2, q3)
%output:
%v              vektorski komponenta Q-ja, (q1, q2, q3)


v = [Q(2) Q(3) Q(4)];
end

