function  plotbezier(B,t, varargin)
% Opis:
%   plotbezier  nariše  Bezierjevo  krivuljo  za dane  kontrolne
%   toèke  in  seznam  parametrov
%
% Definicija:
%   plotbezier(B,t)
%
% Vhodni  podatki:
%   B   matrika  velikosti n+1 x d, ki  predstavlja  kontrolne
%       toèke  Bezierjeve  krivulje  stopnje n v
%       d-dimenzionalnem  prostoru ,
%   t   seznam  parametrov  dolžine k, pri  katerih  raèunamo
%       vrednost  Bezierjeve  krivulje

b = bezier(B,t);
X = b(:,1);
Y = b(:,2);
Z = b(:,3);

hold on
switch nargin
    case 2
        plot3(X,Y,Z,'b')
        %axis([-2,2,-2,2])
        scatter3(B(:,1),B(:,2),B(:,3), 'filled', 'b')
        plot3(B(:,1),B(:,2),B(:,3),'black')
    case 3
        plot(X,Y,Z, varargin{:})
        %axis([-2,2,-2,2])
        scatter3(B(:,1),B(:,2),B(:,3), 'filled', 'b')
        plot3(B(:,1),B(:,2),B(:,3),'black')
end