function result = richardsonRie3()
    format long;
    
    a = input("Enter your a value: ");
    b = input("Enter your b value: ");
    f = @(x) log(x);
    e = input("Enter your epsilon value: ");

    n = 1;
    deltaX = b - a;
    L1 = (f(a))*deltaX;
    x = [a];

    n = 2;
    deltaX = deltaX / 2;
    L2 = 0.5 * L1 + (f(x + deltaX)) * deltaX;
    x = [x, x + deltaX];
    R1 = 2*L2 - L1;

    n = 4;
    deltaX = deltaX / 2;
    L1 = L2;
    L2 = L2 = 0.5 * L1 + sum(f(x + deltaX)) * deltaX;
    x = [x, x + deltaX];
    R2 = 2*L2 - L1;

    while abs(R2 - R1) > e
        n = 2*n;
        deltaX = deltaX / 2;
        R1 = R2;
        L1 = L2;
        L2 = 0.5 * L1 + sum(f(x + deltaX)) * deltaX;
        x = [x, x + deltaX];
        R2 = 2*L2 - L1
    end

    fprintf('The result of Richardson for Riemann is: %.15f\n', R2);
    fprintf('The number of subinterval for Riemann is: %.15f\n', n);

    result = R2;
end