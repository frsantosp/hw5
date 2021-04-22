load USPS.mat

for i=1:length(A)
    A(i,:) = A(i,:)- mean(A(i,:));
end

[U,S,V] = svd(A);
V_10 = V(:,1:10);
V_50 = V(:,1:50);
V_100 = V(:,1:100);
V_200 = V(:,1:200);

R = A * V_10;               %p = 10
re = R *V_10';

disp(norm(A-re));
figure;
imshow(reshape(re(1,:), 16, 16));
imwrite(reshape(reconstructed(1,:), 16, 16)','image_1_10.jpg');
imshow(reshape(re(301,:), 16, 16));
imwrite(reshape(reconstructed(301,:), 16, 16)','image_2_10.jpg');


R = A * V_50;               %p = 50
re = R *V_50';
disp(norm(A-re));

figure;
imshow(reshape(re(1,:), 16, 16));
imwrite(reshape(reconstructed(1,:), 16, 16)','image_1_50.jpg');
imshow(reshape(re(301,:), 16, 16));
imwrite(reshape(reconstructed(301,:), 16, 16)','image_2_50.jpg');

R = A * V_100;              %p = 100
re = R *V_100';
disp(norm(A-re));
figure;
imshow(reshape(re(1,:), 16, 16));
imwrite(reshape(reconstructed(1,:), 16, 16)','image_1_100.jpg');
imshow(reshape(re(301,:), 16, 16));
imwrite(reshape(reconstructed(301,:), 16, 16)','image_2_100.jpg');

R = A * V_200;              %p = 200
re = R *V_200';
disp(norm(A-re));
figure;
imshow(reshape(re(1,:), 16, 16));
imwrite(reshape(reconstructed(1,:), 16, 16)','image_1_200.jpg');
imshow(reshape(re(301,:), 16, 16));
imwrite(reshape(reconstructed(301,:), 16, 16)','image_2_200.jpg');