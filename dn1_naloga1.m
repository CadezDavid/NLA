tocke = [41.3477   41.1652   40.9966   40.8009   40.6111   40.4934   40.2494   40.0246   39.8930   39.6418   39.4306   39.1946   39.0827   38.8907   38.7291;   -17.8104  -17.7921  -17.7105  -17.7045  -17.7041  -17.7034  -17.7548  -17.8773  -17.9660  -18.1852  -18.2932  -18.4563  -18.6589  -18.8606  -19.1617]'; 

% iscemo stožnico a x^2 + b xy + c y^2 + d x + e y + f = 0, ki bo po metodi
% najmanjših kvadratov najbolje aproksimirala naše točke

A = [tocke(:,1).*tocke(:,2), tocke(:,2).^2, tocke(:,1), tocke(:,2), ones(size(tocke, 1), 1)];

b = -tocke(:,1).^2;

x1 = metoda_najmanjsih_kvadratov(A, b);
x2 = metoda_totalnih_najmanjsih_kvadratov(A, b);

x2 = [1, x2'];
a = x2(1); b = x2(2); c = x2(3); d = x2(4); e = x2(5); f = x2(6);

p1 = @(x) (-(b*x+e) + sqrt((b*x+e)^2 - 4*c*(a*x^2+d*x+f))) / (2 * c);
p2 = @(x) (-(b*x+e) - sqrt((b*x+e)^2 - 4*c*(a*x^2+d*x+f))) / (2 * c);

dist = @(x) min(norm( [x; p1(x)] - [38.8907; -18.8606]), ...
    norm( [x; p2(x)] - [38.8907; -18.8606]));


fprintf("Prvi del:")
disp(x1(1));

fprintf("Drugi del:")
disp( ...
    [fminbnd(dist, 0, 100), dist(fminbnd(dist, 0, 100))] ...
);