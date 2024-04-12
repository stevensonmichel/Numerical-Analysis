function result = heun()
    format long;
    
    a = input("Enter your a value: ");
    b = input("Enter your b value: ");
    f = @(x, y) x^2 - y^2;
    ya = input("Enter the initial value: ")
    e = input("Enter your epsilon value: ");

    n = 1;
    deltaX = b - a;
    yb1 = ya + f(a, ya) * deltaX;
 
    n = 2;
    deltaX = (b - a) / 2;
    x = a;
    k1 = f(a, ya);
    k2 = f(x + deltaX, ya + k1 * deltaX);
    k = (k1 + k2) / 2;
    y = ya + k * deltaX;
    x = a + deltaX;
    k1 = f(x, y);
    k2 = f(x + deltaX, y + k1 * deltaX);
    k = (k1 + k2) / 2;
    yb2 = y + f(x, y) * deltaX;

    while abs(yb2 - yb1) > e
        n = 2*n;
        deltaX = deltaX / 2;
        x = a;
        y = ya;
        yb1 = yb2;

        for j = 1 : n
            k1 = f(x, y);
            k2 = f(x + deltaX, y + k1 * deltaX);
            k = (k1 + k2) / 2;
            y = y + k * deltaX;
            x = x + deltaX;
        endfor
        
        yb2 = y;

    end

    fprintf('The result of integral is: %.15f\n', yb2);
    fprintf('The number of subinterval is: %.15f\n', n);

    result = yb2;
end