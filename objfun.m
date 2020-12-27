function obj = objfun(X,params)
%% 目的関数の作成
% 目的関数は各制御トルクの二乗和
% 
%%


N = params.N ; % 微小時間数
n = params.n ; % 微小時間


xend = X(2*N-1) ;
obj = 0 ;
%  obj = (xend - 15)^2 ;  

%トルク二乗最小


for t = 1:N
    
    obj = n^2*X(2*N+t)^2 ;
    
end
%躍度最小(u1-u2)^2

% for t = 1:N-1
%     
%     obj = obj + (X(2*N+t)-X(2*N+t+1))^2 ;
% 
% end

