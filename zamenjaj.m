function [Q, R2] = zamenjaj(R, i, j)

% če sta i in j sosednja poracunamo in vidimo, da mora veljati
% c/s = rij / (ri - rj) torej bo c = sqrt(k^2/(1 + k^2)) in
% s = sqrt(1/(1 + k^2)), kjer je k=rij/(ri-rj)
% za nesosednja pa moramo (i j) razpisati kot produkt transpozicij oblike
% (k k+1)

% (i j) = (i i+1) (i+1 i+2) ... (j-1 j) (j-2 j-1) ... (i i+1)

n = size(R, 1);

i = min(i, j);
j = max(i, j);

Q = eye(n);
R2 = R;

for k = [linspace(i, j-1, j-i), linspace(j-2, i, j-i-1)]

    disp([k, k+1]);
    p = R2(k, k+1)/(R2(k,k)-R2(k+1,k+1));
    c = p/sqrt(1+p^2);
    s = 1/sqrt(1+p^2);

    Q([k k+1],:) = [c -s; s c] * Q([k k+1],:);
    R2([k k+1],:) = [c -s; s c] * R2([k k+1],:);
    R2(:,[k k+1]) = R2(:,[k k+1]) * [c -s; s c]';
end

end