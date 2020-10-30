function bivariate2CCA(n,C)  % For calculating (Competition and Mutualism) or (predator-prey). More efficient version
                             % n - population size, C - connection probability
G=rand(n);
M=G<C;                 % preassigned non-zero entries of the random matrix
M=double(M~=0);        % Make M binary
MM=(M+M')/2;           % Make M symmetric
MM2=double(MM~=0);     % Make MM binary
mu = [0 0];
Sigma = [1 0;0  1];
for j=1:n
for i=1:n
R = abs(mvnrnd(mu,Sigma));   %mvnrnd(mu,Sigma) generates a pair of values from a normal distribution. abs(mvnrnd(mu,Sigma)) takes their absolute values.
if MM2(i,j)==0               % since we're taking the absolute values of the randomly generated numbers, it doesn't matter if the correlation coefficient is negative or positive, provided their sizes are the same.
else
H=rand(1);
if H<=0.5
MM2(i,j)=R(1);
MM2(j,i)=-R(2);
else
MM2(i,j)=-R(1);
MM2(j,i)=R(2);
end
end
end
end
MM2(1:(n+1):end)=-1;
assignin('base','M',MM2)
d=eig(MM2);
i=imag(d); j=real(d); plot(j,i,'o')

%Best one so far