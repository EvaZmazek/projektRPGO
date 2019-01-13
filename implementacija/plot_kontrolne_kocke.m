function  plot_kontrolne_kocke(x0,y0,z0,T0, B,c, zac_barva, vmes_barva, kon_barva, pavza)
%input:
% x,y,z             vektorji, ki dolocajo zacetno kocko
% T0                izhodidce kocke
% B                 matrika n x 4, v kateri so kontrolni kvaternioni kot 
%                   vrstice
% c                 translacijska funkcija
% barve             kake barve naj bodo kontrolni kvadri
% pavza             ali naj pavzira vmes
%output:
% narise "kontroln kvadre" - to so kvadri, ki bi jih dobili s premikanjem
% osnovnega z hi(Q_i), kjer je Q_i kontrolni kvaternion


for i = 1:size(B,1)
    if pavza
        pause
    end
    switch i
        case 1
            barva = zac_barva;
        case size(B,1)
            barva = kon_barva;
        otherwise
            barva = vmes_barva;
    end
    Q = B(i,:);
    H = quat_rot_mat(Q);
    x = (H*x0')';
    y = (H*y0')';
    z = (H*z0')';
    T = T0+c(i,:);
    risi_kocko(kocka_vek(x, y, z, T),barva);
end

