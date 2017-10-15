function R = rotmat(theta,u)
%R: pinakas metasxhmatismoy peristrofis kata gwnia theta
%gurw apo ton aksona poy orizei to monadiaio dianusma u
A=u*u';
B=eye(3);
C=[0 -u(3) u(2);u(3) 0 -u(1);-u(2) u(1) 0];

R=(1-cos(theta))*A + cos(theta)*B + sin(theta)*C;
end