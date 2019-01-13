function c = translacija(w, Q, t)
%input:
% w                 translacijska funkcija izhodisca, racunana na t,
%                   n x 3 matrika
% Q                 sfericna rotacijska Bez krivulja, racunana na t,
%                   n x 4 matrika
% t                 n parametrov, pri katerih racunamo funkcijo
%output:
% c                 normirana translacija, matrika n x 3

n = length(t);
c = zeros(n,3);

for i = 1:n
    nQt = norm(Q(i,:))^2;
    c(i,:) = w(i,:)/nQt;
end
end

