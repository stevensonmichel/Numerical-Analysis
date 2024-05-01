function result = heunNewton(a, b, ya, Ta, k, e)
    format long;
    
    % a = input("Enter the start time a: ");
    % b = input("Enter the end time b: ");
    % ya = input("Enter the initial temperature of the object: ");
    % Ta = input("Enter the ambient temperature Ta: ");
    % k = input("Enter the constant k: ");
    % e = input("Enter your epsilon: ");
    
    f = @(x, y) -k * (y - Ta);

    n = 1;
    deltaX = b - a;
    k1 = f(a, ya);
    k2 = f(a + deltaX, ya + k1 * deltaX);
    k = (k1 + k2) / 2;
    yb1 = ya + k * deltaX;
 
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
    yb2 = y + k * deltaX;

    while abs(yb2 - yb1) > e
        n = 2*n;
        deltaX = deltaX / 2;
        x = a;
        y = ya;
        yb1 = yb2;

        for j = 1:n
            k1 = f(x, y);
            k2 = f(x + deltaX, y + k1 * deltaX);
            k = (k1 + k2) / 2;
            y = y + k * deltaX;
            x = x + deltaX;
        end
        
        yb2 = y;
    end

    fprintf('The result of the temperature for Heun Method is: %.15f\n', yb2);
    fprintf('The number of subintervals is: %.15f\n', n);

    result = yb2;
end
