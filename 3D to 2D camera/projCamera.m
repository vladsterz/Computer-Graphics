function P=projCamera(w,cv,cx,cy,p)
cx=cx/norm(cx);
cy=cy/norm(cy);

cz=[0 -cx(3) cx(2);cx(3) 0 -cx(1);-cx(2) cx(1) 0]*cy(:);%ekswteriko ginomeno x,y
cz=cz/norm(cz);%monadiaio dianusma Vz ths kameras
R=[cx(:) cy(:) cz(:)];% pianakas strofis
p=systemtrans(R,[p;ones(1,numel(p(1,:)))],cv);%peristrofh kai metatopish kata cv

P(1,:)=w*p(1,:)./p(3,:);%provolh x
P(2,:)=w*p(2,:)./p(3,:);%provolh y

end
