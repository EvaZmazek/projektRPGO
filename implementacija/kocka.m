function oglisca = kocka(T0, T1)
%Vrne kocko, definirano z diagonalo (TO,T1)
a = [T1(1) - T0(1) 0 0];
b = [0 T1(2) - T0(2) 0];
c = [0 0 T1(3) - T0(3)];



oglisca = [T0; T0+b; T0+a+b; T0+a; T0+c; T0+c+b; T0+a+b+c; T0+a+c];
%ploskve = [1 2 3 4; 2 6 7 3; 4 3 7 8; 1 5 8 4; 1 2 6 5; 5 6 7 8]; 
end

