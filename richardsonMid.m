function result = richardsonMid()
    format long;
    
    a = input("Enter your a value: ");
    b = input("Enter your b value: ");
    f = @(x) sinc(x);
    e = input("Enter your epsilon value: ");

    n = 1;
    deltaX = b - a;
    x = (a + b)/2 
    M1 = (f(x)) * deltaX

    n = 2;
    deltaX = deltaX / 2;
    x = [x - deltaX/2, x + deltaX/2];
    M2 = (sum(f(x))) * deltaX
    R1 = (4 * M2 - M1) / 3;

    n = 4;
    deltaX = deltaX / 2;
    M1 = M2;
    x = [x - deltaX/2, x + deltaX/2];
    M2 = (sum(f(x))) * deltaX
    R2 = (4 * M2 - M1) / 3;

    while abs(R2 - R1) > e
        R1 = R2;
        M1 = M2;
        n = 2*n;
        deltaX = deltaX / 2;
        x = [x - deltaX/2, x + deltaX/2];
        M2 = (sum(f(x))) * deltaX;
        R2 = (4 * M2 - M1) / 3;

    end

    fprintf('The result of Richardson for Midpoint is: %.15f\n', R2);
    fprintf('The number of subinterval is: %.15f\n', n);

    result = M2;
end