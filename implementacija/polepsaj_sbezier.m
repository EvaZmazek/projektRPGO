function mat_Q = polepsaj_sbezier(Q)
%spremeni celico Q v matriko mat_Q

n = length(Q);
mat_Q = zeros(n,4);
for i = 1:n
    mat_Q(i,:) = Q{i}{1};
end

end

