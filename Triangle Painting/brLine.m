function brLine(x0,y0,x1,y1)
M=200;
N=300;
A=ones(M,N);

DeltaX=2*(x1-x0);
DeltaY=2*(y1-y0);
x=x0;
y=y0;
f=DeltaX/2 - DeltaY;
A(M-x+1,N-y+1)=0;

for i=x0+1:x1
    x=i;
    if f<0
        y=y+1;
        f=f+DeltaX;
    end
    f=f - DeltaY;
    A(M-x+1,N-y+1)=0;
end
imshow(A);

end