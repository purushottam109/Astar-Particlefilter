%NORMANGLE Put angle into a two-pi interval.
%   AR = NORMANGLE(A,MIN) puts angle A into the interval
%   [MIN..MIN+2*pi[. If A is Inf, Inf is returned.
%
%   See also DIFFANGLE.

% v.1.0, Dec. 2003, Kai Arras, CAS-KTH: accel. with profiler

function ar = normangle(a,mina);

if a < Inf,
  while a >= mina + 2*pi,
    a = a - 2*pi;
  end;
  while a < mina,
    a = a + 2*pi;
  end;
  ar = a;
else
  ar = Inf;
end;