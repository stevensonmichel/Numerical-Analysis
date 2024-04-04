function result = midpoint3()
    format long;
    
    a = input("Enter your a value: ");
    b = input("Enter your b value: ");
    f = @(x) log(x);
    e = input("Enter your epsilon value: ");

    n = 1;
    deltaX = b - a;
    x = (a + b)/2 
    M1 = (f(x)) * deltaX

    n = 2;
    deltaX = deltaX / 2;
    x = [x - deltaX/2, x + deltaX/2];
    M2 = (sum(f(x))) * deltaX

    while abs(M2 - M1) > e
        M1 = M2
        n = 2*n;
        deltaX = deltaX / 2;
        x = [x - deltaX/2, x + deltaX/2];
        M2 = (sum(f(x))) * deltaX

    end

    fprintf('The result of t2 for Trapezoidal is: %.15f\n', M2);
    fprintf('The number of subinterval is: %.15f\n', n);

    result = M2;
end