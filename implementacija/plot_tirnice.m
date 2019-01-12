function plot_tirnice(P, c)
%input:
% P                 premaknjeni vektorji kvadra
% c                 translacijska funkcija
%ouput:
% nariše "tirnice", po katerih se premikajo oglišèa kvadra

n = size(c, 1);

%en vektor
V_x = zeros(n,3);
V_y = zeros(n,3);
V_z = zeros(n,3);
V_xy = zeros(n,3);
V_zy = zeros(n,3);
V_xz = zeros(n,3);
V = zeros(n,3);


for i = 1:n
    Pi = P{i};
    V_x(i,:) = Pi(1,:);
    V_y(i,:) = Pi(2,:);
    V_z(i,:) = Pi(3,:); 
end

% dva vektorja
V_xy = V_x + V_y + c;
V_zy = V_z + V_y + c;
V_xz = V_x + V_z + c;

% vsi
V = V_x + V_y + V_z + c;

V_x = V_x + c;
V_y = V_y + c;
V_z = V_z + c;


plot3(V_x(:,1), V_x(:,2), V_x(:,3),...
    V_y(:,1), V_y(:,2), V_y(:,3),...
    V_z(:,1), V_z(:,2), V_z(:,3),...
    V_xy(:,1), V_xy(:,2), V_xy(:,3),...
    V_zy(:,1), V_zy(:,2), V_zy(:,3),...
    V_xz(:,1), V_xz(:,2), V_xz(:,3),...
    V(:,1), V(:,2), V(:,3),...
    c(:,1), c(:,2), c(:,3),...
    'LineWidth',1.5)


end

