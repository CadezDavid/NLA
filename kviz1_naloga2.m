% uporabil bom funkcijo, ki sem jo napisal za domačo nalogo

ro = 1/1000;
u = sqrt([1.9; 2.1; 1.1; 2.9; 4]);
d = [1.1; 1.4; 1.9; 2.9; 3.7];
% i označuje indeks intervala, kjer iščemo ničlo
i = 3;

x0 = d(i) * 1/4 + d(i+1) * 3/4;

x = rac_newtonova_metoda(u, d, ro, i, x0);

f = @(x) 1 + ro * (u.^2)' * (1./(d - x));

disp(f(x));

% za drugi del sem vstavil en disp() klic v
% vnaprej napisano funkcijo rac_newtonova_metoda