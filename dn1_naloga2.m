%f = @(x) 1+(1.9/(0.9-x)+2.0/(1.4-x)+0.9/(1.9-x)+2.9/(2.9-x)+3.9/(3.7-x))/1000;

u = sqrt([1.9; 2.0; 0.9; 2.9; 3.9]);
d = [0.9; 1.4; 1.9; 2.9; 3.7];
ro = 1/1000;
i = 2;
x0 = d(i) * 1/3 + d(i+1) * 2/3;

%df = @(x) (1/1000) * (1.9/(0.9-x)^2+2.0/(1.4-x)^2+0.9/(1.9-x)^2+2.9/(2.9-x)^2+3.9/(3.7-x)^2);

% poisci niclo sekularne funkcije f na intervalu (1.4, 1.9)

x = rac_newtonova_metoda(u, d, ro, i, x0);

disp(x);

eps = 1;
while eps > 1e-20
    y = rac_newtonova_metoda(u, d, ro, i, x);
    eps = abs(y - x);
    x = y;
end

disp(x);