clear
clc
close all
%% ����_�I���ł̃X�C���O�A�b�v�in�Z�O�����g�j
% 
%% �ϐ��̎w��
% setparams�@�ŋL�q����Ă���

gif = 0; % = 1��gif�̕ۑ�

tic %�v���J�n
params = setparams ;
N = params.N ;

% �œK���ϐ��@X =[��1(1),��1(1),��2(1),��2(1),...x2(N),v2(N),u()]
% ��Ԃ��Z�O�����g���~2�~N,����R�}���h���Z�O�����g��*N
%% �֐��̋L�q
funcs.objective = @(X) objfun(X,params);    %�ړI�֐��F�K�v
funcs.gradient  = @(X) objgrad(X,params);   %�ړI���z�F�K�v
funcs.constraints = @(X) confun(X,params);            %����֐�:�I�v�V����
funcs.jacobian    = @(X) conjac(X,params);            %���񃄃R�r�A���F���񂪂���ꍇ�K�v
funcs.jacobianstructure = @() conjacstructure(params); %���񃄃R�r�A���̍\�������߂�F���񂪂���ꍇ�K�v
[X0,L, U] = getIniConBound(params) ;
%% option
options.lb = L;
options.ub = U;
options.cl = zeros(1,params.sumC);
options.cu = zeros(1,params.sumC);
options.ipopt.max_iter = 1000000;% 20000;% 500000;% %�ő唽����
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
%% �œK���̎��s
X = ipopt(X0,funcs,options) ;
toc %�v���I��
%% ���ʂ̃v���b�g



x = X(1:2:2*N-1) ;
dx = X(2:2:2*N) ;
u = X(2*N+1:3*N) ;

figure(1) 
plot(x)

figure(2)
plot(dx)
figure(3)
plot(u)
