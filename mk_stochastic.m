function CPT = mk_stochastic(CPT)
% MK_STOCHASTIC Make a matrix stochastic, i.e., the sum over the last dimension is 1.
% T = mk_stochastic(T)
%
% If T is a vector, it will be normalized.
% If T is a matrix, each row will sum to 1.
% If T is e.g., a 3D array, then sum_k T(i,j,k) = 1 for all i,j.

if isvec(CPT)
  CPT = normalise(CPT);
else
  n = ndims(CPT);
  % Copy the normalizer plane for each i.
  normalizer = sum(CPT, n);
  normalizer = repmat(normalizer, [ones(1,n-1) size(CPT,n)]);
  % Set zeros to 1 before dividing
  % This is valid since normalizer(i) = 0 iff CPT(i) = 0
  normalizer = normalizer + (normalizer==0);
  CPT = CPT ./ normalizer;
end

%%%%%%%
function p = isvec(v)

s=size(v);
if ndims(v)<=2 & (s(1) == 1 | s(2) == 1)
  p = 1;
else
  p = 0;
end
