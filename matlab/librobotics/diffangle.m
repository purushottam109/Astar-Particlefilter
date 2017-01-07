%DIFFANGLE Take difference of two angles and unwrap it.
%   A = DIFFANGLE(A1,A2) determines the minimal difference
%   A = A1-A2 between two angles A1 and A2. If either A1 or A2
%   is Inf, Inf is returned.
%
%   See also NORMANGLE.

% v.1.0, Dec. 2003, Kai Arras, CAS-KTH

function delta = diffangle(a1,a2);

if (a1 < Inf) & (a2 < Inf),
  
  % Normalize angles a1 and a2
  a1 = normangle(a1,0);  
  a2 = normangle(a2,0);
  
  % Take difference and unwrap
  delta = a1 - a2;
  if a1 > a2,
    while delta >  pi,
      delta = delta - 2*pi;
    end;
  elseif a2 > a1,
    while delta < -pi,
      delta = delta + 2*pi;
    end;
  end;
  
else
  delta = Inf;
end;
