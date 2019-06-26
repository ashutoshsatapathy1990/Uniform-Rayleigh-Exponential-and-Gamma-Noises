%....................................................................
% // Uniform Random Noise in The Range [0, 1] Scaled by k =  0.3.   |
% // Rayleigh Noise with its [A = 0, B = 1] Scaled by k = 0.3.      |
% // Exponential Noise Scaled By 0.2 Where The Value of A = 1.      |
% // Gamma (Erlang) Noise where [A, B ] = [2, 5] and SF 'K' = 0.1.  |
% // imnoise2.m File Function Is Called Inside This Program.        |
%...................................................................|

%// Read an Image from The Given Path.
img = imread('input/img.bmp');

% // Extract Red, Green and Blue Channels of Input. 
Rframe = img(:, :, 1);
Gframe = img(:, :, 2);
Bframe = img(:, :, 3);
Rframe = double(Rframe);
Gframe = double(Gframe);
Bframe = double(Bframe);

% // Normalized Intensities of Each Channel [0, 1].
Rframe = Rframe - min(Rframe(:));
Rframe = Rframe / max(Rframe(:));
Gframe = Gframe - min(Gframe(:));
Gframe = Gframe / max(Gframe(:));
Bframe = Bframe - min(Bframe(:));
Bframe = Bframe / max(Bframe(:));

% // Generate Uniform Noise Matrices, Scaled Down by 70%. 
UN_R =  0.3 * imnoise2('uniform', 512, 512);
UN_G =  0.3 * imnoise2('uniform', 512, 512);
UN_B =  0.3 * imnoise2('uniform', 512, 512);

% // Generate Rayleigh Noise Matrices, Scaled Down by 70%.
RN_R =  0.3 * imnoise2('rayleigh', 512, 512);
RN_G =  0.3 * imnoise2('rayleigh', 512, 512);
RN_B =  0.3 * imnoise2('rayleigh', 512, 512);

% // Generate Exponential Noise Matrices, Scaled Down by 80%.
EN_R =  0.2 * imnoise2('exponential', 512, 512);
EN_G =  0.2 * imnoise2('exponential', 512, 512);
EN_B =  0.2 * imnoise2('exponential', 512, 512);

% // Generate Erlang Noise Matrices, Scaled Down by 90%.
GN_R =  0.1 * imnoise2('erlang', 512, 512);
GN_G =  0.1 * imnoise2('erlang', 512, 512);
GN_B =  0.1 * imnoise2('erlang', 512, 512);

% // Add Uniform Noises to Each Image Channel [R, G, B]. 
R_UNoisy = Rframe + UN_R;
G_UNoisy = Gframe + UN_G;
B_UNoisy = Bframe + UN_B;

% // Add Rayleigh Noises to Each Image Channel [R, G, B]. 
R_RNoisy = Rframe + RN_R;
G_RNoisy = Gframe + RN_G;
B_RNoisy = Bframe + RN_B;

% // Add Exponential Noises to Each Image Channel [R, G, B]. 
R_ENoisy = Rframe + EN_R;
G_ENoisy = Gframe + EN_G;
B_ENoisy = Bframe + EN_B;

% // Add Gamma (Erlang) Noises to Each Image Channel [R, G, B]. 
R_GNoisy = Rframe + GN_R;
G_GNoisy = Gframe + GN_G;
B_GNoisy = Bframe + GN_B;

% // Construct Noisy Images from The Corresponding Noisy Channels.
Img_UNoisy = cat(3, R_UNoisy, G_UNoisy, B_UNoisy);
Img_RNoisy = cat(3, R_RNoisy, G_RNoisy, B_RNoisy);
Img_ENoisy = cat(3, R_ENoisy, G_ENoisy, B_ENoisy);
Img_GNoisy = cat(3, R_GNoisy, G_GNoisy, B_GNoisy);

% // Display Images
figure
subplot(1, 5, 1), imshow(img), title('Original image')
subplot(1, 5, 2), imshow(Img_UNoisy), title('Noisy image, Noise = Uniform')
subplot(1, 5, 3), imshow(Img_RNoisy), title('Noisy image, Noise = Rayleigh')
subplot(1, 5, 4), imshow(Img_ENoisy), title('Noisy image, Noise = exponential')
subplot(1, 5, 5), imshow(Img_GNoisy), title('Noisy image, Noise = Erlang')

% // Save Images to .bmp files
imwrite(Img_UNoisy,'output/Noise_Uni.bmp');
imwrite(Img_RNoisy,'output/Noise_Ray.bmp');
imwrite(Img_ENoisy,'output/Noise_Exp.bmp');
imwrite(Img_GNoisy,'output/Noise_Ga.bmp');
