function result = richardsonTrap()
    format long;
    
    a = input("Enter your a value: ");
    b = input("Enter your b value: ");
    f = @(x) sinc(x);
    e = input("Enter your epsilon value: ");

    n = 1;
    deltaX = b - a;
    t1 = 0.5 * (f(a) + f(b))*deltaX;
    x = [a];

    n = 2;
    deltaX = deltaX / 2;
    t2 = 0.5 * t1 + sum(f(x + deltaX)) * deltaX;
    x = [x, x + deltaX];
    R1 = (4 * t2 - t1) / 3;

    n = 4;
    deltaX = deltaX / 2;
    t1 = t2;
    t2 = 0.5 * t1 + sum(f(x + deltaX)) * deltaX;
    x = [x, x + deltaX];
    R2 = (4 * t2 - t1) / 3;


    while abs(R2 - R1) > e
        n = 2*n;
        deltaX = deltaX / 2;
        R1 = R2;
        t1 = t2;
        t2 = 0.5 * t1 + sum(f(x + deltaX)) * deltaX;
        x = [x, x + deltaX];
        R2 = (4 * t2 - t1) / 3;
    end

    fprintf('The result of Richardson for Trapezoidal is: %.15f\n', R2);
    fprintf('The number of subinterval is: %.15f\n', n);

    result = t2;
end