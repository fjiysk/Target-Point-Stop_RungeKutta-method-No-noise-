function [X0,L, U] = getIniConBound(params)
%% �œK���ϐ��̏����l(X0)�Ȃ�тɂ��̉����l(L)�Ə���l(U)�̐ݒ�
%
% �^�X�N����������ŋL�q
%
% 2020/10/05 �쐬�J�n
%% �J���p
% params = setparams ;

%% code
N = params.N ; % �������Ԑ�
n = params.n ; % ��������
Fs = params.Fs ; %�T���v�����O���[�g
sumX = params.sumX ; % �œK���ϐ��̑���(N)

LX = params.Lx ;
UX = params.Ux ;
Lu = params.Lu ;
Uu = params.Uu ;

x0= params.x0 ; % ��������
% u0 = params.u0 ;
Lxend = params.Lxend ; % �I�[�����i�����j
Uxend = params.Uxend ;
% ���O���蓖��
X0= zeros(1,params.sumX) ;
L = zeros(1,params.sumX) ;
U = zeros(1,params.sumX) ;


Xus = 2*N ; %�g���N�̊J�n-1

for j = 1:N
    % ��Ԃ̐���
    NXj = 2*j-1:2*j ;
    L(NXj) = LX ;
    U(NXj) = UX ;
    % �g���N�̐���
    Nuj = Xus +j ;
    L(Nuj) = Lu ;
    U(Nuj) = Uu ; 
end

%�������(x)
X0(1:2) = x0 ;
L(1:2) = x0 ;
U(1:2) = x0 ;
% L(2*N+1) = u0 ;
% U(2*N+1) = u0 ;
%�I�����(x)
NXend = 2*N-1:2*N ;
X0(NXend) =  Lxend ;
L(NXend) = Lxend ;
U(NXend) = Uxend ;
