function demo2a
p1=[1 2 -5 1]';
p2=[0 1 1 1]';
p3=[2 3 -5 1]';
p4=[4 2 -1 1]';

P=[p1 p2 p3 p4]%pinakas me ta shmeia se omogeneis suntetagmenes
t1=[-2 -2 3]';
K=[4 -2 4]';
g=[2 3 -1]';
fi=pi/4;
t2=[2 2 -3]';

P=pointtrans(eye(3),P,t1)% metatopish twn shmeiwn kata t1


P=systemtrans(eye(3),P,K);%allagh susthmatos suntetagmenwn kai arxhs
u=g/norm(g);%monadiaio dianusma/aksonas peristrofis

R=rotmat(fi,u);%pinakas peristrofis

P=pointtrans(R,P,zeros(3,1));%peristrofi twn shmeiwn

P=systemtrans(eye(3),P,-K)%epanafora susthmatos suntetagmenwn kai arxhs

P=pointtrans(eye(3),P,t2)%metatopishs kata t2

end