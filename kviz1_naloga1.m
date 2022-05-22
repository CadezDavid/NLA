tocke = [41.3477   41.1652   41.0166   40.8009   40.6111   40.4934   40.2494   40.0246   39.8930   39.6418   39.4306   39.1946   39.0827   38.8907   38.7291;        -17.8104  -17.7921  -17.7105  -17.6945  -17.7041  -17.7034  -17.7548  -17.8773  -17.9660  -18.1852  -18.2932  -18.4563  -18.6589  -18.8606  -19.1617]; 

A = [tocke(:,1).*tocke(:,2), tocke(:,2).^2, tocke(:,1), tocke(:,2), ones(size(tocke, 1), 1)];

b = -tocke(:,1).^2;

x = metoda_totalnih_najmanjsih_kvadratov(A, b);

% kriterijska funkcija

F1 = A*x;
disp(F1(1));


% krožnica
% iscemo a, b in r, x = [a; b; r]

% isti problem kot prej, samo da je b = 0, c = 1 in d,e,f prosti parametri
A = [tocke(:,1), tocke(:,2), ones(size(tocke, 1), -1)];
b = -tocke(:,1).^2 - tocke(:,2).^2;

% f  = r^2
% d = -2*a
% e = -2*b
x2 = metoda_totalnih_najmanjsih_kvadratov(A, b);
disp(x2);
% a = x2(1) / (-2); b = x2(2) / (-2);
a = x2(1); b = x2(2);
disp(norm([a b]));

