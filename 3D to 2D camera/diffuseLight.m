function I = diffuseLight(P,N,kd,S,I0)
N=N/norm(N);%monadiaio katheto sthn epifaneia dianusma
I=zeros(3,1);%apotelesma


for i=1:numel(S(1,:))
    d=S(:,i)-P;%dianusma phghs-epifaneias
    di=norm(d);
    cosa=N'*d/di;%eswteriko ginomeno twn 2 monadiaiwn
    
    if cosa<=0 
        continue 
    end;
    I=I + I0(:,i).*kd'*cosa/(di^2);%ypologismos fwteinothtas
end

end