function bivariate(n) % Bivariate normal
A=zeros(n);
for i=1:n
for j=i:n
mu = [0 0];
Sigma = [1 -2/pi; -2/pi 1];
R = mvnrnd(mu,Sigma);
if i==j
    A(i,j)=0;
else
    A(i,j)=R(1);A(j,i)=R(2);

end
end
end
assignin('base','A',A)
d=eig(A);
i=imag(d); j=real(d); plot(j,i,'o')
%djgdjnjfngjvfd