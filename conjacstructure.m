function J = conjacstructure(params)
%% 制約勾配の構造
% ヤコビアンのスパース構造を決定する determine sparsity structure of Jacobian
% J は M×N のスパース行列
% 非ゼロ要素が１のスパース行列を作成すればよい
%
% 2020/09/28 IPOPT用に編集開始
% 2020/10/05 タスク制約を削除
%% 開発用
% params = setparams ;
%% code

N = params.N ; % 微小時間数
n = params.n ;
m = params.m ;
sumX = params.sumX ; % 最適化変数の総数(N)
sumC = params.sumC ; % 制約の総数(M)


J = sparse(sumC,sumX) ;% 事前割り当て：M*Nのスパース行列の作成

%物理制約
for i = 1:N-1
    
    % x2 = x1 + n*dx1
    J(2*i-1,2*i-1) = 1 ;
    J(2*i-1,2*i+1) = 1 ;
    J(2*i-1,2*i) = 1 ;
    J(2*i-1,2*i+2) = 1 ;
    
    % dx2 = dx1 + n*u
    J(2*i,2*i) = 1 ;
    J(2*i,2*i+2) = 1 ;
    J(2*i,2*N+i) = 1 ;
    J(2*i,2*N+i+1) = 1 ;
end
