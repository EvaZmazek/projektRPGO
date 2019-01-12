function r = kot_v_kvat(fi, e)
%input:
% fi            kot
% e             vektor osi
%output:
% Q             kvaternion
%
% sprejme kot fi in os e ter vrne kvaternion, ki predstavlja rotacijo 
% za kot fi okoli osi e

e = e/norm(e);
r = [cos(fi/2) sin(fi/2)*e(1) sin(fi/2)*e(2) sin(fi/2)*e(3)];
end

