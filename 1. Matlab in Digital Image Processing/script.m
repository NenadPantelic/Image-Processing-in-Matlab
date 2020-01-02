%% read raw images (textual file)
fid = fopen('images/im1.dat', 'r');
% I - array of 418 rows (this should be reshaped in matrix)
I = fscanf(fid, '%d');
fclose(fid);

%figure
J = reshape(I, [11, 38])'; imshow(J);
J2 = reshape(I, [38, 11])'; imshow(J2);
J3 = reshape(I, [19, 22])'; imshow(J3);


%% read raw images (binary file)
fid = fopen('images/im2.bin', 'rb');
% I - array of 76800 rows (this should be reshaped in matrix)
I = uint8(fread(fid, 'uint8'));
fclose(fid);

%figure
J = reshape(I, [480, 160])'; imshow(J);
J2 = reshape(I, [240, 320])'; imshow(J2);
J3 = reshape(I, [320, 240])'; imshow(J3);

%% image read - imread
% monochromatic images
f = imread('images/einstein.tif');
[height, width] = size(f);
% RGB image
g = imread('images/cartman.png');
[height, width, num_planes] = size(g);

%% Show an image
imshow(f);
figure; imshow(g);
figure; imshow(f, [100,200]); % [lower, upper] -> lower than lower bound, scale to 0;
%greater than higher bound, scale to 255
figure; imshow(f, []);

%% image writing to file
% general form - imwrite(im_matrix, 'filename', 'quality', q) 
% if use quality param, use jpg file
imwrite(f, 'einstein.png');
imwrite(f, 'einstein_q10.jpg', 'quality', 10);
imwrite(f, 'einstein_q50.jpg', 'quality', 50);
imwrite(f, 'einstein_q90.jpg', 'quality', 90);


%% img conversion
% im2uint8 im2uint16 im2double im2single mat2gray (output values double in [0,1] im2bw

% f = [-1.2 -0.3; 2.5 -0.4];
% uint8(f)
% int8(f)
% im2uint8(f)
% mat2gray(f)
% k = im2bw(f)
% K  = im2bw(f, 0.1)
% g = uint8([120 10; 280 -5])
% double(g)
% im2double(g)

%% indexing
v = [1 3 5 7 9 11];
v(3)
v(2:5)
v(4:end)
v(1:2:5)
v(end:-2:2)
v([1 2 6])
disp('matrices indexing');
m = [1 2 3; 4 5 6; 9 10 11];
m(2,3)
m(3,:)
m(2:end, 2:3)
m([1 3], [1 3])

% linear indexing
% 1 2 3
% 4 5 6
% 9 10 11

%indices
% 1 4 7 
% 2 5 8
% 3 6 9
m(7) %3
m(1:5) %1 4 9 2 5
m(end-1:-2:6) %6 10

% conversion of coordinates

[row, col] = ind2sub(size(m), 7) % 1 3
[row, col] = ind2sub(size(m), 1:5) % 1 2 3 1 2  1 1 1 2 2
%[row, col] = ind2sub(size(m), end-1:-2:6) % error
lin_index = sub2ind(size(m), [1 1 2 3], [2 3 3 2]) % 4 7 8 6

% Logical addressing
% m(mask)
load images/einstein_mask.mat
figure; imshow(f);
figure; imshow(mask);
f(mask) = 128;
figure; imshow(f);

figure; imshow(f);
figure; imshow(f(:,end:-1:1));
figure; imshow(f(end:-1:1, :));
figure; imshow(f(:,end:-1:1));
figure; imshow(f(1:2:end,1:2:end));
figure; imshow(f(76:149,95:157));

%% Some built-in matrices & operations with matrices

a1 = zeros(100, 50);
a2 = ones(100, 50);
a3 = true(100, 50);
a4 = false(100, 50);
a5 = rand(100, 50);
a6 = randn(100, 50);

matr = [-1.2 0.3; 2.5 -0.4];
mean(matr)
max(matr, [], 2)
% transposing
disp(matr');
matr2 = [1 2 3; 4 5 6];
disp(matr * matr2);

cell = {f, 'einstein.png', size(f), mean(f(:))};
disp(cell{1});
disp(cell{3}(1));

structure = struct('data', f,...
                    'file_name', 'einstein.png',...
                    'size', size(f),...
                    'mean',mean(f(:)));
disp(structure.data);
disp(structure.size);
