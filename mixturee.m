function mixturee(n,C)  %For calculating mixture of competition and mutualism
A=rand(n);
M=A<C;
MM=(M+M')/2;
MM2=double(MM~=0);
for i=1:n
for j=1:n
mu = [0 0];
Sigma = [1 0;0 1];
R = abs(mvnrnd(mu,Sigma));
if MM2(i,j)==0
else
    H=rand;
if H<0.5
MM2(i,j)=R(1);
MM2(j,i)=R(2);
else
MM2(i,j)=-R(1);
MM2(j,i)=-R(2);
end
end

end
end
MM2(1:(n+1):end)=0;
assignin('base','M',MM2)
d=eig(MM2);
i=imag(d); j=real(d); plot(j,i,'o');
hold on
ellipse(n,C,0,2/pi)
xlabel('Re(\lambda)');
ylabel('Im(\lambda)');