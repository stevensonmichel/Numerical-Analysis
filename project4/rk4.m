function result = rk4()
    format long;
    
    a = input("Enter your a value: ");
    b = input("Enter your b value: ");
    f = @(x, y) x^2 - y^2;
    ya = input("Enter the initial value: ");
    e = input("Enter your epsilon value: ");

    n = 1;
    deltaX = b - a;
    k1 = f(a, ya);
    k2 = f(a + deltaX/2, ya + k1 * deltaX/2);
    k3 = f(a + deltaX/2, ya + k2 * deltaX/2);
    k4 = f(a + deltaX, ya + k3 * deltaX);
    k = (k1 + 2 * k2 + 2 * k3 + k4) / 6;
    yb1 = ya + k * deltaX;
 
    n = 2 * n;
    deltaX = deltaX / 2;
    k1 = f(a, ya);
    k2 = f(a + deltaX/2, ya + k1 * deltaX/2);
    k3 = f(a + deltaX/2, ya + k2 * deltaX/2);
    k4 = f(a + deltaX, ya + k3 * deltaX);
    k = (k1 + 2 * k2 + 2 * k3 + k4) / 6;
    y = ya + k * deltaX;
    x = a + deltaX;

    k1 = f(x, y);
    k2 = f(x + deltaX/2, y + k1 * deltaX/2);
    k3 = f(x + deltaX/2, y + k2 * deltaX/2);
    k4 = f(x + deltaX, y + k3 * deltaX);
    k = (k1 + 2 * k2 + 2 * k3 + k4) / 6;
    yb2 = y + f(x, y) * deltaX;

    while abs(yb2 - yb1) > e
        n = 2*n;
        deltaX = deltaX / 2;
        x = a;
        y = ya;
        yb1 = yb2;

        for j = 1 : n
            k1 = f(x, y);
            k2 = f(x + deltaX/2, y + k1 * deltaX/2);
            k3 = f(x + deltaX/2, y + k2 * deltaX/2);
            k4 = f(x + deltaX, y + k3 * deltaX);
            k = (k1 + 2 * k2 + 2 * k3 + k4) / 6;
            y = y + k * deltaX;
            x = x + deltaX;
        endfor
        
        yb2 = y;

    end

    fprintf('The result of r-k-4 integral is: %.15f\n', yb2);
    fprintf('The number of subinterval is: %.15f\n', n);

    result = yb2;
end