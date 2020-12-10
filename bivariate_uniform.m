function bivariate_uniform(n,cov)  % Bivariate uniform
y=sqrt(6-14/pi);
x=sqrt(2/pi);
A=zeros(n);
mu = [0 0];
Sigma = [1 -2/pi;-2/pi 1];
for i=1:n
     for j=i:n
       if i==j
       A(i,j)=0;
       else
       H=rand;
         if H<0.5
         A(i,j)=2*sqrt(2/pi)*rand;
         A(j,i)=2*y*rand-(y+x);
         else
         A(i,j)=2*y*rand-(y+x);
         A(j,i)=2*sqrt(2/pi)*rand;    
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