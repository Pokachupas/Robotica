clc; close all; clear;

function [route] = generate_Route(target, z, n)
    route = zeros((size(target,1)/2)*n,3);
    for i = 0:size(target,1)
        if(target(i,:) == target(i-1,:))
            break;
        else
            
        end
    end
end