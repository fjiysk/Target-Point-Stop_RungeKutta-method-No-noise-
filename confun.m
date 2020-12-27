function [c] =confun(X,params)
%% ����֐��̍쐬�i����_�I���j
%
% params = setparams;
% X = [1:4*params.N] ; 
% 
%% code
N = params.N ;
n = params.n ;
m = params.m ;

%���O���蓖��
c = zeros(params.sumC,1) ;

%��������
for i = 1:N-1
    
    % x2 = x1 + n/2*(dx1+dx2)
    c(2*i-1) = X(2*i-1) + (n/2)*(X(2*i)+X(2+i+2)) - X(2*i+1) ;
    
    % dx2 = dx1 + n/m/2*(u1+u2)
    c(2*i) = X(2*i) + (n/2/m)*(X(2*N+i)+X(2*N+i+1)) - X(2*i+2) ;
    
end
    
