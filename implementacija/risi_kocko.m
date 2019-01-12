function risi_kocko(K, barva)
% sprejme koordinate ogli�� K (dobljene iz funkcije "kocka") in barvo
% ter jo nari�e v figuro

ploskve = [1 2 3 4; 2 6 7 3; 4 3 7 8; 1 5 8 4; 1 2 6 5; 5 6 7 8]; 
patch('Vertices', K, 'Faces', ploskve, 'FaceColor', barva);

end

