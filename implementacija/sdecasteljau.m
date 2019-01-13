function D = sdecasteljau(Q,t)
% Opis:
%   decasteljau  vrne  shemo  de  Casteljaujevega  postopka  za dan
%   seznam  koordinat Q pri  danem  parametru t
%
% Definicija:
%   D = decasteljau(Q,t)
%
% Vhodna  podatka:
%   Q   seznam  koordinat  kontrolnih  tock  Bezierjeve  krivulje
%       stopnje n
%   t   parameter , pri  katerem  racunamo  koordinato
%       Bezierjeve  krivulje
%
% Izhodni  podatek:
%   D   tabela  velikosti n+1 x n+1, ki  predstavlja  de
%       Casteljaujevo  shemo  za  koordinate b pri  parametru t
%       (element  na  mestu (1,n+1) je  koordinata  Bezierjeve
%       krivulje  pri  parametru t, elementi  na  mestih (i,j)
%       za i > n-j+2 so NaN)

[n,m] = size(Q);
n = n-1;
D = cell(n+1, n+1);


for i = 1:(n+1)
    D{i,1} = Q(i,:);
end
for j=2:(n+1)
    for i=1:(n+2-j)
        D{i,j} = slerp(D{i,j-1},D{i+1,j-1},t);
    end
end
end
