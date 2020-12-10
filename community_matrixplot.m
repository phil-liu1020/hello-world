function community_matrixplot(M)
a=zeros(length(M),2);
n=length(M);
for i=1:n
for j=1:n
    if i==j
    else
    a(j,1)=M(i,j);
    a(j,2)=M(j,i);
    end
end
end
assignin('base','a',a)
Rho=corrcoef(a);
assignin('base','Rho', Rho)
plot(a(:,1),a(:,2),'*')