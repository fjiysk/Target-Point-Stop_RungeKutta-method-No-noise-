function obj = objfun(X,params)
%% �ړI�֐��̍쐬
% �ړI�֐��͊e����g���N�̓��a
% 
%%


N = params.N ; % �������Ԑ�
n = params.n ; % ��������


xend = X(2*N-1) ;
obj = 0 ;
%  obj = (xend - 15)^2 ;  

%�g���N���ŏ�


for t = 1:N
    
    obj = n^2*X(2*N+t)^2 ;
    
end
%���x�ŏ�(u1-u2)^2

% for t = 1:N-1
%     
%     obj = obj + (X(2*N+t)-X(2*N+t+1))^2 ;
% 
% end

