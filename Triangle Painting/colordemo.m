function colordemo
close all;
M=300;
N=400;
Q=[1 2 3;2 3 5;3 4 5];%Trigwna
T=[10 30;290 40;20 180;130 270;380 190];%Shmeia trigwnwn me anafora sto Q
Cv=[0.8 0.2 0.1;1.0 0.0 0.0;0.4 0.8 0.9;0.0 0.0 1.0;0.2 0.5 0.6];%Xrwmata korufwn

%TODO ta trigwna xrwmatizontai me thn seira twn grammwn tou Q
I=Painter(Q,T,Cv,M,N);
figure();
imshow(I);
    

end