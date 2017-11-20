% Mass (kg) vs metabolism (w)
data = log10([
    400 270 % Cow
    70  82  % Human
    45  50  % Sheep
    2   4.8 % Hen
    0.3 1.45 % Rat
    0.16 0.97 % Dove
    ])

m = data(:,1);
p = data(:,2);
plot(m,p)
loglog(m,p)

x = 