function bivariate2CB(n,C)  % For calculating Competition and Mutualism or predator-prey. More efficient version
A=zeros(n);
for i=1:n
for j=1:n
mu = [0 0];
Sigma = [1 (2*C)/pi;(2*C)/pi  1]; 
R = abs(mvnrnd(mu,Sigma));
G=rand;
if G<C
    k=randi(n,[1,2]);
    if k(1)==k(2)
    j=j-1;
    else
    A(k(1),k(2))=R(1);
    A(k(2),k(1))=R(2);
    end
else
    k=randi(n,[1,2]);

end
end
end
A(1:(n+1):end)=-1;
assignin('base','A',A)
d=eig(A);
i=imag(d); j=real(d); plot(j,i,'o')