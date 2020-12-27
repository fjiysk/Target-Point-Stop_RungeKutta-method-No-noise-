function J = conjacstructure(params)
%% ������z�̍\��
% ���R�r�A���̃X�p�[�X�\�������肷�� determine sparsity structure of Jacobian
% J �� M�~N �̃X�p�[�X�s��
% ��[���v�f���P�̃X�p�[�X�s����쐬����΂悢
%
% 2020/09/28 IPOPT�p�ɕҏW�J�n
% 2020/10/05 �^�X�N������폜
%% �J���p
% params = setparams ;
%% code

N = params.N ; % �������Ԑ�
n = params.n ;
m = params.m ;
sumX = params.sumX ; % �œK���ϐ��̑���(N)
sumC = params.sumC ; % ����̑���(M)


J = sparse(sumC,sumX) ;% ���O���蓖�āFM*N�̃X�p�[�X�s��̍쐬

%��������
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
