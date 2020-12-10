function competition_mutualism_predatorprey(n,C,p,m,c)  % For calculating (Competition and Mutualism) or (predator-prey). More efficient version                      
                                                        % n - population, C - connectance probability
G=rand(n);                               % nxn uniform random matrix
M=G<C;                                   % preassigned positions of the non-zero entries of the random matrix
MM=(M+M')/2;                             % symmetrize M, the preassigned binary matrix
MM2=double(MM~=0);                       % make MM binary
mu = [0 0];                              % bivariate mean
if p==1                                  
Sigma = [1 0;0 1];                       % Covariance matrix. Off diagonals represent covariance between the 2 r.vs.  
else
Sigma = [1 0;0 1];
end
for j=1:n
for i=1:n
R = abs(mvnrnd(mu,Sigma));               % Generates a pair of integers from a bivariate half-normal distribution with bivariate mean mu, covariance matrix Sigma,
if MM2(i,j)==0                           
else
if p==1
  H=rand(1);
  if H<=0.5
  MM2(i,j)=R(1);
  MM2(j,i)=-R(2);
  else
  MM2(i,j)=-R(1);
  MM2(j,i)=R(2);
  end
elseif m==1
  MM2(i,j)=R(1);
  MM2(j,i)=R(2); 
elseif c==1
  MM2(i,j)=-R(1);
  MM2(j,i)=-R(2);
else
  error('Error. \nInput must be a char.')
end
end

end
end
MM2(1:(n+1):end)=-1;
assignin('base','M',MM2)
d=eig(MM2);
i=imag(d); j=real(d); plot(j,i,'o');
hold on
if p==1
ellipse(n,2*C,-1,-2/pi)
elseif m==1
ellipse(n,C,-1,2/pi)
else
ellipse(n,C,-1,2/pi)
end
% If the correlation coefficient between the 2 random variables are 0, i.e.
% the M_{ij} and M_{ji} are sampled from an independent half normal and
% negative half normal r.v respectively, the resultant community matrix
% has covariance matrix Sigma=[1 -2/pi;-2/pi 1].