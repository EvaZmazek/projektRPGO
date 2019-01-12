function Q = conj_quat(q)
%input:
%q              kvaternion  
%output:
%Q              konjugiran qvaternion

Q = [q(1), -q(2:4)];
end

