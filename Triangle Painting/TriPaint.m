function Y = TriPaint(X,V,Cv)
[M,~,~]=size(X);

% temp(1,i):xmin gia thn akmh i
% temp(2,i):ymin   >> >>
% temp(3,i):xmax  >> >>
% temp(4,i):ymax >> >>
% temp(5,i):1/ki opoy k einai h klhsh ths akmhs i
temp=zeros(5,3);



colGrad=zeros(3,3);% metavolh xrwmatos ws pros y
mincol=zeros(3,3);% to xrwma toy ymin shmeio gia kathe akmh

for i=1:3
    j=mod(i,3);
    %euresh elaxistwn kai megistwn gia kathe akmh
    if V(2,i)>V(2,j+1)
        %mins
        temp(1,i)=V(1,j+1);
        temp(2,i)=V(2,j+1);
    
        %maxs
        temp(3,i)=V(1,i);
        temp(4,i)=V(2,i);
        
        %color grad
        colGrad(:,i)=(Cv(:,i)-Cv(:,j+1))./(temp(4,i)-temp(2,i));
        mincol(:,i)=Cv(:,j+1);
    else
        temp(1,i)=V(1,i);
        temp(2,i)=V(2,i);
    
        %maxs
        temp(3,i)=V(1,j+1);
        temp(4,i)=V(2,j+1);
        
        %color grad
        colGrad(:,i)=(Cv(:,j+1)-Cv(:,i))./(temp(4,i)-temp(2,i));
        mincol(:,i)=Cv(:,i);
    end

end

%%1/mi gia kathe akmh
temp(5,1)=(V(1,2)-V(1,1))/(V(2,2)-V(2,1));%m12
temp(5,2)=(V(1,3)-V(1,2))/(V(2,3)-V(2,2));%m23
temp(5,3)=(V(1,1)-V(1,3))/(V(2,1)-V(2,3));%m13



%OLES OI GRAMMES SARWSHS
ymin=min(temp(2,:));
ymax=max(temp(4,:));

%MIN MAX FOUND
ActAk=[];
ActSm=[];
[ActAk,ActSm]=findAct(ActAk,ActSm,ymin,temp);%euresh oriakwn shmeiwn kai akmwn gia ymin

for y=ymin:ymax %scanlines
   xp=floor(ActSm+0.5);
   
   
   if ~isempty(ActAk)
       t1=ActAk(1);
       t2=ActAk(2);
   else
       t1=1;
       t2=2;
   end

   c1=colGrad(:,t1)*(y-temp(2,t1)) + mincol(:,t1);%xrwma thn akmhs poy tmhtai prwta apo thn grammh sarwshs
   c2=colGrad(:,t2)*(y-temp(2,t2)) + mincol(:,t2);% >>             >>         deutero   >>     >>   
   
   aa=min(xp);%mikrotero oriako shmeio
   bb=max(xp);%megalutero oriako shmeio
   for x=aa:bb
       %grammikh parembolh me vash to x
       gx=0;
       if aa~=bb
        gx=(c2-c1)./(bb-aa);
       end
       cc=gx*(x-aa) + c1;
       X(M-y+1,x,:)=cc;
       
   end
  %euresh energwn akmwn kai shmeiwn gia thn epomenh grammh sarwshs
  [ActAk,ActSm]=findAct(ActAk,ActSm,y+1,temp); 
end

Y=X;
X=[];

end

