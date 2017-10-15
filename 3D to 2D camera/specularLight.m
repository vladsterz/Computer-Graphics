function I = specularLight(V,P,N,ks,ncoeff,S,I0)
N=N/norm(N);%monadiaio katheto sthn epifaneia dianusma
I=zeros(3,1);%apotelesma

for i=1:numel(S(1,:))
    d=S(:,i)-P;%duanisma phgwn-epifaneias
    di=norm(d);
    L=d/di;%monadiaio pros thn phgh apo thn epifaneia
    V=(P-V)/norm(P-V);%monadiaio pros ton parathrhth apo thn epifaneia
    cosa=((2*N*(N'*L) - L)'*V)^ncoeff;%eswteriko ginomeno dianusmatos idanikis anaklashs kai parathrhth
    
    if cosa<=0 
        continue 
    end;
    I=I + I0(:,i).*ks'*cosa/(di^2);%ypologismos fwteinothtas
end    

end