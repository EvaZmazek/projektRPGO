function [mat_Q,w,c] = izracunaj_vse(Q, B, t)
%Tole bo izraèunalo vse za en premik
%input:
% Q                     matrika kontrolnih kvaternionov za sferiène
%                       rotacije
% B                     matrika kontrolnih toèk za Bezierjevo krivuljo
%                       izhodišèa
% t                     parametri, pri katerih raèunamo
%output:
% mat_Q                 matrika kvaternionov, ki doloèajo sferiène rotacije
% w                     Bezierjeva krivulja premika koordinatnega izhodišèa
% c                     normirana translacijska funkcija

mat_Q = polepsaj_sbezier(sbezier(Q,t));
w = bezier(B,t);
c = translacija(w,mat_Q, t);
end

