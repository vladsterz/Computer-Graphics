function Im = GouraudPhoto(w ,cv ,cK ,cu ,bC ,M ,N ,H ,W ,r ,F ,S ,ka ,kd ,ks ,ncoeff ,Ia ,I0)
Normals = VertNormals(r , F);

I=zeros(size(r));%ta xrwmata olws twn shmeiwn
Im=ones(M,N,3);%eksodos
%background
Im(:,:,1)=Im(:,:,1)*bC(1);
Im(:,:,2)=Im(:,:,2)*bC(2);
Im(:,:,3)=Im(:,:,3)*bC(3);


%provolh twn shmeiwn sto petasma ths kameras
P = projCameraKu(w , cv, cK, cu, r);

%Euresh xrwmatos kathe korufhs
for i=1:numel(Normals(1,:)) %oles oi korufes
    [a,b]=find(F==i);%se poia trigwna anhkei h kathe korufh
    a=unique(a);
    
    %suntelestes gia kathe shmeio ws mesos oros
    %twn suntelestwn twn trigwnwn
    a1=sum(kd(a,:))/numel(a);
    a2=sum(ks(a,:))/numel(a);
    a3=sum(ka(a,:))/numel(a);
    
    %euresh xrwmatos me vash toys fwtismous
    I1=diffuseLight(r(:,i),Normals(:,i),a1,S,I0);
    I2=specularLight(cv ,r(:,1),Normals(:,i),a2,ncoeff,S,I0);
    I3=ambientLight(i,a3,Ia);
    
    %sunoliko xrwma epeita apo kanonikopoihsh
    I(:,i)=(I1+I2+I3)/256;
end

%provolh toy stoxou ths kameras
Cent= projCamera(w, cv, cK, cu, cK);
Cent= round(Cent);

%metatroph inches->pixels
P=P.*repmat([M/H;N/W],1,numel(P(1,:)));
P=round(P);

%metatopish etsi wste to kentro ths kameras
%na einai to kentro toy petasmatos
P(1,:)=P(1,:)-Cent(1)+M/2;
P(2,:)=P(2,:)-Cent(2)+N/2;

tic

%vafh kathe trigwnoy
for i=1:numel(F(:,1)) %ola ta trigwna
    Im=TriPaint(Im,P(:,F(i,:)),I(:,F(i,:)));
end
toc



end