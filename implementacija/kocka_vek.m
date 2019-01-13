function oglisca = kocka_vek(X, Y, Z, T0)
%input:
% x,y,z         vektorji stranic x,y,z stranic
% T0            izhodisce
%output:
% oglisca       vsa oglisca kocke, ki se zacne v T0

oglisca = [T0; T0+Y; T0+X+Y; T0+X; T0+Z; T0+Z+Y; T0+X+Y+Z; T0+X+Z];
%ploskve = [1 2 3 4; 2 6 7 3; 4 3 7 8; 1 5 8 4; 1 2 6 5; 5 6 7 8]; 
end
