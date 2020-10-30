function bivariate_normal(n,cov)  % Off diagonal entries are sampled from a bivariate normal with mean 0, variance 1 and rho -2/pi
A=zeros(n);
for i=1:n
     for j=i:n
     mu = [0 0];              
     Sigma = [1 cov;cov  1];
     R = mvnrnd(mu,Sigma);
        if i==j
        A(i,j)=0;
        else
        A(i,j)=R(1);
        A(j,i)=R(2);
        end
     end
end
assignin('base','A',A)
d=eig(A);
i=imag(d);
j=real(d);
plot(j,i,'o');
hold on
ellipse(n,1,0,cov)                % Plots the ellipse corresponding to n centred at the origin