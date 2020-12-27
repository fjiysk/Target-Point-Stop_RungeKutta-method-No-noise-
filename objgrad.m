function dobj = objgrad(X, params)
%% –Ú“IŒù”z
% 
% 

%% code

N = params.N ; % ”÷¬ŠÔ”
n = params.n ; % ”÷¬ŠÔ

dobj = zeros(size(X)); % –‘OŠ„‚è“–‚Ä

xend = X(2*N-1) ;

% dobj(2*N-1) = 2*xend;

for t = 1:N
    
    dobj(2*N+t) = 2*(X(2*N+t)*n) ;
    
end

