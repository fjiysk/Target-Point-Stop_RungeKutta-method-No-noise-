function params = setparams
%% 最適化用のパラメータの指定
%

%% パラメタの設定
%基礎事項

params.m = 10  ; % 質量(kg)
params.T = 10 ; % 動作時間(s)
params.N = 50; % 総時間区切り数

params.Fs = params.N/params.T ; % サンプリングレート
params.n = 1/params.Fs ; % ひと区間当たりの継続時間
params.sumX = 3*params.N ;
params.sumC = 2*params.N-2 ;

%タスク制約(要設定
params.x0 =[0,0] ;% 原点の位置
params.Lxend = [10,0] ; % 終期状態L
params.Uxend = [10,0] ;% 終期状態L
% params.u0 = 0 ;


%最適化変数の下限と上限(m/s,m/s^2)
params.Lx = [0,0] ;
params.Ux = [20,5] ;
params.Lu = -100 ;
params.Uu = 100 ;

