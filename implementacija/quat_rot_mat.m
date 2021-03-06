function H = quat_rot_mat(Q)
%input:
%Q          kvaternion
%
%output:
%H          rotacijska matrika za sfericno gibanje
%           (hi v zapiskih)

H = zeros(3,3);
h = sum(Q.^2);

if h == 0
    H = eye(3,3); % ne vem, ce je to prav
else
    H(1,1) = Q(1)^2+Q(2)^2 - Q(3)^2 - Q(4)^2;
    H(1,2) = 2*(Q(2)*Q(3) - Q(1)*Q(4));
    H(1,3) = 2*(Q(2)*Q(4) + Q(1)*Q(3));

    H(2,1) = 2*(Q(2)*Q(3) + Q(1)*Q(4));
    H(2,2) = Q(1)^2 - Q(2)^2 + Q(3)^2 - Q(4)^2;
    H(2,3) = 2*(Q(3)*Q(4) - Q(1)*Q(2));

    H(3,1) = 2*(Q(2)*Q(4) - Q(1)*Q(3));
    H(3,2) = 2*(Q(3)*Q(4) + Q(1)*Q(2));
    H(3,3) = Q(1)^2 - Q(2)^2 - Q(3)^2 + Q(4)^2;

    H = 1/h.*H;  
end

end


