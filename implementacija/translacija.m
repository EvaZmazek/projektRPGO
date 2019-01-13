function c = translacija(w, Q, t)
%input:
% w                 translacijska funkcija izhodi��a, ra�unana na t,
%                   n x 3 matrika
% Q                 sferi�na rotacijska Bez krivulja, ra�unana na t,
%                   n x 4 matrika
% t                 n parametrov, pri katerih ra�unamo funkcijo
%output:
% c                 normirana translacija, matrika n x 3

n = length(t);
c = zeros(n,3);

for i = 1:n
    nQt = norm(Q(i,:))^2;
    c(i,:) = w(i,:)/nQt;
end
end

