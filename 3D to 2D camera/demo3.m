function demo3
close all;
a=load('vase2016.mat');
F=a.F;
C=a.C;
r=a.r;
F=F(:,2:4);



cv=[-150 -90 10]';

cK=[20 20 -10]';


cu=[0 0 1]';
H=1/2;
W=2/3;
M=480;
N=640;
w=0.5;

ka=0.5*C;
kd=0.5*C;
ks=0.5*C;
ncoeff=3;

bC=[0.8 0.8 0.8];

Ia=[1 1 1]';
S=[190 -250 180]';
I0=[1 1 1]';

%Taksinomish twn trigwnwn me vash thn
%apostash toys apo thn camera
weights=zeros(numel(F(:,1)),1);
for i=1:numel(F(:,1))
    weights(i)=norm(sum(r(:,F(i,:)))'/3 - cv);
end
[weights,i]=sort(weights,'descend');
F=F(i,:);
ka=ka(i,:);
kd=kd(i,:);
ks=ks(i,:);


Im=GouraudPhoto(w ,cv ,cK ,cu ,bC ,M ,N ,H ,W ,r ,F ,S ,ka ,kd ,ks ,ncoeff ,Ia ,I0);
figure();
imshow(Im);
title(sprintf('w=%0.1f inches',w));
end