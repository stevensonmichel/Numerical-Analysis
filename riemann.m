function result = riemann()
    format long;
    
    a = input("Enter your a value: ");
    b = input("Enter your b value: ");
    f = @(x) sinc(x);
    e = input("Enter your epsilon value: ");

    n = 1;
    deltaX = b - a;
    L1 = (f(a))*deltaX;
    x = [a];

    n = 2;
    deltaX = deltaX / 2;
    L2 = 0.5 * L1 + (f(x + deltaX)) * deltaX;
    x = [x, x + deltaX];


    while abs(L2 - L1) > e
        n = 2*n;
        deltaX = deltaX / 2;
        L1 = L2;
        L2 = 0.5 * L1 + sum(f(x + deltaX)) * deltaX;
        x = [x, x + deltaX];
    end

    fprintf('The result of t2 for Riemann is: %.15f\n', L2);

    result = L2;
end