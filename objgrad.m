function dobj = objgrad(X, params)
%% �ړI���z
% 
% 

%% code

N = params.N ; % �������Ԑ�
n = params.n ; % ��������

dobj = zeros(size(X)); % ���O���蓖��

xend = X(2*N-1) ;

% dobj(2*N-1) = 2*xend;

for t = 1:N
    
    dobj(2*N+t) = 2*(X(2*N+t)*n) ;
    
end

