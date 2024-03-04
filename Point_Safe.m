r0_0 = [0,0,0];
R0_0 = eye(3);
r0_1 = [1,1,0];
r0_2 = [1,2,0];
r0_3 = [2,1,0];
r0_4 = [2,2,0];
r0_p = [-3,1,0];
R0_X = [r0_1; r0_2; r0_3; r0_4];

is_safe = is_point_safe(R0_X,r0_p)





function [y0] = is_point_safe(m1, x2)
    epsilon = 0.1;
    matrix_1 = [1;1;1];
    ngh = size(m1);
    beta = 0;
    r0_x = [x2(1); x2(2); 0]; 
    for i = 1: ngh(2)-1
        aux = [m1(i,1); m1(i,2); m1(i,3)];
        aux2 = [m1(i+1,1);m1(i+1,2); m1(i+1,3)];
        resta = aux - r0_x;
        resta2 = aux2 -r0_x;
        beta = beta + sign(matrix_1*dot(resta,resta2))*abs(acos(dot(resta,resta2)/(norm(resta)*norm(resta2))));
    end
    total = abs((1/2*pi)*beta) + epsilon;
    if total >= 1
        y0 = 1;
    else
        y0 = 0;
    end
end

