function P = projCameraKu(w,cv,cK,cu,p)
cv=cv(:);
cu=cu(:);
cK=cK(:);


zc=(cK - cv)/norm(cK - cv);% monadiaio z;

t=cu-(cu'*zc)*zc;
yc=t/norm(t);%monadiaio y

xc=[0 -yc(3) yc(2);yc(3) 0 -yc(1);-yc(2) yc(1) 0]*zc;%ekswteriko ginomeno gia to x

P=projCamera(w,cv,xc,yc,p);

end