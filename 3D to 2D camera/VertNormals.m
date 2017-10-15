function Normals = VertNormals( r , F )
Normals=zeros(3,numel(r(1,:)));
%F=F(:,2:4);

for i=1:numel(r(1,:))%gia kathe korufh
    [a,b]=find(F==i);
    a=unique(a);%trigwna i-osths korufhs
    
    Norma=zeros(3,1);
    for j=1:numel(a)%gia kathe trigwno poy exei korufi i
        v1=r(:,F(a(j),2))-r(:,F(a(j),1));%AB
        v2=r(:,F(a(j),3))-r(:,F(a(j),2));%BC
        n=[0 -v1(3) v1(2);v1(3) 0 -v1(1);-v1(2) v1(1) 0]*v2;%ABxBC
        n=n/norm(n);%monadiaio katheto
        Norma=Norma+n;
    end
    Norma=Norma/numel(a);%mesos oros olwn twn kathetwn dianusmatwn
    Normals(:,i)=Norma/norm(Norma);%monadiaio
end

end