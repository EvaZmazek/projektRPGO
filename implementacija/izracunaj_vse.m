function [mat_Q,w,c] = izracunaj_vse(Q, B, t)
%Tole bo izra�unalo vse za en premik
%input:
% Q                     matrika kontrolnih kvaternionov za sferi�ne
%                       rotacije
% B                     matrika kontrolnih to�k za Bezierjevo krivuljo
%                       izhodi��a
% t                     parametri, pri katerih ra�unamo
%output:
% mat_Q                 matrika kvaternionov, ki dolo�ajo sferi�ne rotacije
% w                     Bezierjeva krivulja premika koordinatnega izhodi��a
% c                     normirana translacijska funkcija

mat_Q = polepsaj_sbezier(sbezier(Q,t));
w = bezier(B,t);
c = translacija(w,mat_Q, t);
end

