function result = richardsonSimp()
    format long;
    
    a = input("Enter your a value: ");
    b = input("Enter your b value: ");
    f = @(x) sinc(x);
    e = input("Enter your epsilon value: ");

    n = 1;
    deltaX = b - a;
    T1 = 0.5 * (f(a) + f(b)) * deltaX;
    x = [(a + b) / 2];
    M1 = f(x) * deltaX
    S2 = (T1 + 2 * M1)/3
 
    n = 2;
    deltaX = deltaX / 2;
    T2 = (T1 + M1) / 2;
    x = [x - deltaX/2, x + deltaX/2];
    M2 = sum(f(x)) * deltaX;
    S4 = (T2 + 2 * M2) / 3;
    R1 = (16 * S4 - S2) / 15

    n = 4;
    S2 = S4;
    T2 = (T1 + M1) / 2;
    x = [x - deltaX/2, x + deltaX/2];
    M2 = sum(f(x)) * deltaX;
    S4 = (T2 + 2 * M2)/3

    while abs(S4 - S2) > e
        n = 2*n;
        deltaX = deltaX / 2;
        T1 = T2;
        M1 = M2;
        S2 = S4
        T2 = (T1 + M1)/2
        x = [x - deltaX/2, x + deltaX/2];
        M2 = sum(f(x)) * deltaX;
        S4 = (T2 + 2 * M2)/3
        
    end

    fprintf('The result of t2 for Simpson is: %.15f\n', S4);
    fprintf('The number of subinterval is: %.15f\n', 2 * n);

    result = S4;
end