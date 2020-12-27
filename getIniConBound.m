function [X0,L, U] = getIniConBound(params)
%% 最適化変数の初期値(X0)ならびにその下限値(L)と上限値(U)の設定
%
% タスク制約をここで記述
%
% 2020/10/05 作成開始
%% 開発用
% params = setparams ;

%% code
N = params.N ; % 微小時間数
n = params.n ; % 微小時間
Fs = params.Fs ; %サンプリングレート
sumX = params.sumX ; % 最適化変数の総数(N)

LX = params.Lx ;
UX = params.Ux ;
Lu = params.Lu ;
Uu = params.Uu ;

x0= params.x0 ; % 初期条件
% u0 = params.u0 ;
Lxend = params.Lxend ; % 終端条件（下限）
Uxend = params.Uxend ;
% 事前割り当て
X0= zeros(1,params.sumX) ;
L = zeros(1,params.sumX) ;
U = zeros(1,params.sumX) ;


Xus = 2*N ; %トルクの開始-1

for j = 1:N
    % 状態の制約
    NXj = 2*j-1:2*j ;
    L(NXj) = LX ;
    U(NXj) = UX ;
    % トルクの制約
    Nuj = Xus +j ;
    L(Nuj) = Lu ;
    U(Nuj) = Uu ; 
end

%初期状態(x)
X0(1:2) = x0 ;
L(1:2) = x0 ;
U(1:2) = x0 ;
% L(2*N+1) = u0 ;
% U(2*N+1) = u0 ;
%終期状態(x)
NXend = 2*N-1:2*N ;
X0(NXend) =  Lxend ;
L(NXend) = Lxend ;
U(NXend) = Uxend ;
