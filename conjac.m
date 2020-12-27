function J = conjac(X,params)
%% 制約勾配の作成
%
% 

%% 開発用
% params.N = 10 ; % 微小時間数
% params.s = 3 ; % 
% params.sumC = 2 ;
% params.sumX = 10 ;
%% code

N = params.N ; % 微小時間数
n = params.n ; % 微小時間
m = params.m ; % 質量(kg)
sumX = params.sumX ; % 最適化変数の総数(N)
sumC = params.sumC ; % 制約の総数(M)


J = conjacstructure(params) ;% 事前割り当て：M*Nのスパース行列の作成

%物理制約
for i = 1:N-1

    
    % x2 = x1 + n*dx1
    J(2*i-1,2*i-1) = 1 ;  %x1
    J(2*i-1,2*i+1) = -1 ; %x2
    J(2*i-1,2*i) = n/2 ; %dx1
    J(2*i-1,2*i+2) = n/2 ; %dx2
   
    % dx2 = dx1 + n*u
    J(2*i,2*i) = 1 ; %dx1
    J(2*i,2*i+2) = -1 ; %dx2
    J(2*i,2*N+i) = n/m/2 ; % u1
    J(2*i,2*N+i) = n/m/2 ;
end
    
