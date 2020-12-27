clear
clc
close all
%% 決定論的環境でのスイングアップ（nセグメント）
% 
%% 変数の指定
% setparams　で記述されている

gif = 0; % = 1でgifの保存

tic %計測開始
params = setparams ;
N = params.N ;

% 最適化変数　X =[θ1(1),ω1(1),θ2(1),ω2(1),...x2(N),v2(N),u()]
% 状態がセグメント数×2×N,制御コマンドがセグメント数*N
%% 関数の記述
funcs.objective = @(X) objfun(X,params);    %目的関数：必要
funcs.gradient  = @(X) objgrad(X,params);   %目的勾配：必要
funcs.constraints = @(X) confun(X,params);            %制約関数:オプション
funcs.jacobian    = @(X) conjac(X,params);            %制約ヤコビアン：制約がある場合必要
funcs.jacobianstructure = @() conjacstructure(params); %制約ヤコビアンの構造を求める：制約がある場合必要
[X0,L, U] = getIniConBound(params) ;
%% option
options.lb = L;
options.ub = U;
options.cl = zeros(1,params.sumC);
options.cu = zeros(1,params.sumC);
options.ipopt.max_iter = 1000000;% 20000;% 500000;% %最大反復回数
options.ipopt.hessian_approximation = 'limited-memory';
options.ipopt.mu_strategy = 'adaptive';		% worked better than 'monotone'
options.ipopt.tol = 1e-2;
options.ipopt.linear_solver = 'mumps'; %'ma57'; %
options.ipopt.constr_viol_tol = 1e-3;
options.ipopt.compl_inf_tol = 1e-3;
options.ipopt.print_level = 5;
options.ipopt.bound_frac = 0.01;%1e-8;
options.ipopt.bound_push = options.ipopt.bound_frac;
options.ipopt.recalc_y = 'yes';
options.ipopt.dual_inf_tol = 1e-1;
options.ipopt.compl_inf_tol = 1e-2;
% options.ipopt.bound_relax_factor = 0;
%% 最適化の実行
X = ipopt(X0,funcs,options) ;
toc %計測終了
%% 結果のプロット



x = X(1:2:2*N-1) ;
dx = X(2:2:2*N) ;
u = X(2*N+1:3*N) ;

figure(1) 
plot(x)

figure(2)
plot(dx)
figure(3)
plot(u)
