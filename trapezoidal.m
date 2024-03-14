function result = trapezoidal()
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
    t2 = 0.5 * t1 + (f(x + deltaX)) * deltaX;
    x = [x, x + deltaX];


    while abs(t2 - t1) > e
        n = 2*n;
        deltaX = deltaX / 2;
        t1 = t2;
        t2 =     t2 = 0.5 * t1 + sum(f(x + deltaX)) * deltaX;
        x = [x, x + deltaX];
    end

    fprintf('The result of t2 for Trapezoidal is: %.15f\n', t2);

    result = t2;
end