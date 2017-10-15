function dph = systemtrans(L,Cph,c0)
Lt=inv(L);%antisrofos L
A=[Lt -Lt*c0;zeros(1,3) 1];
%metasximatismos twn suntetagmenwn Cph apo tin vasi (b1,b2,b3)
%kai arxh o
%stin vash T(b1),T(b2),T(b3) me pinaka metasximatismoy L
%kai arxh o|+|v0 me c0 tis suntetagmenes toy v0
dph=A*Cph;
end