function bivariate_halfnormal(n,cov)  % Bivariate half normal
A=zeros(n);
mu = [0 0];
Sigma = [1 -0.99;-0.99 1];
for i=1:n
     for j=i:n
     R = [abs(rand),abs(rand)];
       if i==j
       A(i,j)=0;
       else
       H=rand;
       if H<0.5
         A(i,j)=-R(1);
         A(j,i)=R(2); 
       else 
         A(i,j)=R(1);
         A(j,i)=-R(2);  
       end
       end
     end
end
assignin('base','A',A)
d=eig(A);
i=imag(d);
j=real(d);
plot(j,i,'o');
hold on
ellipse(n,1,0,cov);