function Q = slerp(Q1, Q2, t)
%input:
% Q1, Q2            kvaterniona
% t                 parameter v [0,1]
%output:
% Q                 rezultat slerp-a med Q1 in Q2 na mestu t
%To je sferièna linearna interpolacija, ki naj bi zamenjala
%navadno v de Casteljauju.
% https://en.wikipedia.org/wiki/Slerp

if t == 0
    Q = Q1;
else
    if t == 1
        Q = Q2;
    else
%         q = quatmultiply(Q1,Q2);
%         if q(1) <= 0 
%             display('dolga pot')
%             display(q)
%             [r1,r2,r3] = quat2angle(q)
%             %Q1 = -Q1; %tako naj bi izbrala krajšo pot, se mi zdi 
%         end
        Q = quatmultiply(Q1, quat_exp(quatmultiply(quat_exp(Q1,-1),Q2),t));
    end
end
end

