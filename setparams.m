function params = setparams
%% �œK���p�̃p�����[�^�̎w��
%

%% �p�����^�̐ݒ�
%��b����

params.m = 10  ; % ����(kg)
params.T = 10 ; % ���쎞��(s)
params.N = 50; % �����ԋ�؂萔

params.Fs = params.N/params.T ; % �T���v�����O���[�g
params.n = 1/params.Fs ; % �ЂƋ�ԓ�����̌p������
params.sumX = 3*params.N ;
params.sumC = 2*params.N-2 ;

%�^�X�N����(�v�ݒ�
params.x0 =[0,0] ;% ���_�̈ʒu
params.Lxend = [10,0] ; % �I�����L
params.Uxend = [10,0] ;% �I�����L
% params.u0 = 0 ;


%�œK���ϐ��̉����Ə��(m/s,m/s^2)
params.Lx = [0,0] ;
params.Ux = [20,5] ;
params.Lu = -100 ;
params.Uu = 100 ;

