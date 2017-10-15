function demo2b
[P,F]=readplg('stanford_bunny.plg.txt');
P=[P;ones(1,numel(P(1,:)))];%metatropi se omogeneis suntetagmenes
t1=[-2 -2 3]';
K=[4 -2 4]';
g=[2 3 -1]';
fi=pi/4;
t2=[2 2 -3]';

figure();
hold on;
plotplg(P,F);

%akrivws i idia diadikasia me to demo2a
%gia tis omogeneis suntetagmenes tis eikonas
P=pointtrans(eye(3),P,t1);



plotplg(P(1:3,:),F);
P=systemtrans(eye(3),P,K);


u=g/norm(g);
R=rotmat(fi,u);

P=pointtrans(R,P,zeros(3,1));

P=systemtrans(eye(3),P,-K);
plotplg(P(1:3,:),F);

P=pointtrans(eye(3),P,t2);
plotplg(P(1:3,:),F);

hold off;


end