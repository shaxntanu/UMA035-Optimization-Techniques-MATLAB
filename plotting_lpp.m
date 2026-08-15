clc;
clear;
close all;
% step 1: parameters
C = [3, 5];
A = [-1,3;
    1,1;
    1, -1];
B = [10; 6; 2];

% step 2: contraints
x1 = 0:1:max(B)
z1 = (10 + x1)/3;
z2 = 6 - x1;
z3 = x1 - 2;
z1 = max(0,z1)
z2 = max(0,z2)
z3 = max(0,z3)

% step 3: plotting
plot (x1, z1, 'green')
hold on 
plot (x1, z2, 'magenta')
hold on 
plot (x1, z3, 'black')
xlabel('value of x1');
ylabel('value of x2');
title ('x2 vs x1');
legend ('x1 + 3x2 = 10', 'x2 + x1 = 6', 'x1 - x2 = 2');

% step 4: to find corner points
cx1 = find (x1 == 0)
c1 = find (z1 == 0)
c2 = find (z2 == 0)
c3 = find (z3 == 0)
line1 = [x1(:, [c1, cx1]); z1(:,[c1, cx1])]'
line2 = [x1(:, [c2, cx1]); z2(:,[c2, cx1])]'
line3 = [x1(:, [c3, cx1]); z3(:,[c3, cx1])]'
corpt = unique ([line1; line2; line3], 'rows');

%step 5: pt of intersection

pt = [0;0];
for i =1:size(A,1)
    for j=i+1:size(A,1)
        A1 = A([i,j],:)
        B1 = B([i,j])
        x = inv(A1)*B1;
        pt = [pt x];
    end
end
ptt = pt'