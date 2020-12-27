function J = conjac(X,params)
%% ������z�̍쐬
%
% 

%% �J���p
% params.N = 10 ; % �������Ԑ�
% params.s = 3 ; % 
% params.sumC = 2 ;
% params.sumX = 10 ;
%% code

N = params.N ; % �������Ԑ�
n = params.n ; % ��������
m = params.m ; % ����(kg)
sumX = params.sumX ; % �œK���ϐ��̑���(N)
sumC = params.sumC ; % ����̑���(M)


J = conjacstructure(params) ;% ���O���蓖�āFM*N�̃X�p�[�X�s��̍쐬

%��������
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
    
