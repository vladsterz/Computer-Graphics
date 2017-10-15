function Cqh = pointtrans(L,Cph,Ct)
%metasximatismos twn omogenwn suntetagmenwn Cph
%me pinaka metasximatismoy L kai metatopish tous 
%kata Ct
Lh=[L Ct;zeros(1,3) 1];
Cqh=Lh*Cph;
end