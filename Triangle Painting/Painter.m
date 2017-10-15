function I = Painter(Q,T,Cv,M,N)
X=ones(M,N,3);

for i=1:3
    V=T(Q(i,:),:)';%ta shmeia toy kathe trigwnoy
    [V(1,:),ii]=sort(V(1,:));%taksinomish toys me vash to x
    V(2,:)=V(2,ii);
    
    Cvt=Cv(Q(i,:),:)';%ta xrwmata twn shmeiwn gia kathe trigwno
    Cvt=Cvt(:,ii);
    X=TriPaint(X,V,Cvt);

end
I=X;
end