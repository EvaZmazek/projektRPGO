function c = translacija(w, Q, t)
%input:
% w                 translacijska funkcija izhodišèa, raèunana na t,
%                   n x 3 matrika
% Q                 sferièna rotacijska Bez krivulja, raèunana na t,
%                   n x 4 matrika
% t                 n parametrov, pri katerih raèunamo funkcijo
%output:
% c                 normirana translacija, matrika n x 3

n = length(t);
c = zeros(n,3);

for i = 1:n
    nQt = norm(Q(i,:))^2;
    c(i,:) = w(i,:)/nQt;
end
end

