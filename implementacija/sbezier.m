function b = sbezier(Q,t)
% Opis:
%   bezier  vrne  toèke  na  Bezierjevi  krivulji  pri  danih
%   parametrih
%
% Definicija:
%   b = bezier(B,t)
%
% Vhodna  podatka:
%   Q   matrika  velikosti n+1 x d, ki  predstavlja  kontrolne
%       toèke  Bezierjeve  krivulje  stopnje n v
%       d-dimenzionalnem  prostoru ,
%   t   seznam  parametrov  dolžine k, pri  katerih  raèunamo
%       vrednost  Bezierjeve  krivulje
%
% Izhodni  podatek:
%   b   matrika  velikosti k x d, kjer i-ta  vrstica
%       predstavlja  toèko  na  Bezierjevi  krivulji  pri
%       parametru  iz t na i-tem  mestu

%[N, d] = size(B);
%n = N-1;
k = length(t);

b = cell(k,1);

for K = 1:k
    decast = sdecasteljau(Q,t(K));
    b{K} = decast(1,end);
end
b;


