function result = rk3Newton()
    format long;
    
    a = input("Enter the start time a: "); 
    b = input("Enter the end time b: "); 
    Ta = input("Enter the ambient temperature Ta: ");
    k = input("Enter the qconstant k: "); 
    ya = input("Enter the initial temperature of the object: "); 
    e = input("Enter your epsilon: "); 

    f = @(x, y) -k * (y - Ta); 

    n = 1;
    deltaX = b - a;
    x = a;
    y = ya;
    k1 = f(x, y);
    k2 = f(x + deltaX / 2, y + k1 * deltaX / 2);
    k3 = f(x + deltaX, y + k2 * deltaX);
    k = (k1 + 2 * k2 + k3) / 4;
    yb1 = ya + k * deltaX;

    n = 2 * n;
    deltaX = (b - a) / 2;
    k1 = f(x, y);
    k2 = f(x + deltaX / 2, y + k1 * deltaX / 2);
    k3 = f(x + deltaX, y + k2 * deltaX);
    k = (k1 + 2 * k2 + k3) / 4;
    y = ya + k * deltaX;
    x = a + deltaX;

    k1 = f(x, y);
    k2 = f(x + deltaX / 2, y + k1 * deltaX / 2);
    k3 = f(x + deltaX, y + k2 * deltaX);
    k = (k1 + 2 * k2 + k3) / 4;
    yb2 = y + f(x, y) * deltaX;

    while abs(yb2 - yb1) > e
        n = 2 * n;
        deltaX = deltaX / 2;
        x = a;
        y = ya;
        yb1 = yb2;

        for j = 1:n
            k1 = f(x, y);
            k2 = f(x + deltaX / 2, y + k1 * deltaX / 2);
            k3 = f(x + deltaX, y + k2 * deltaX);
            k = (k1 + 2 * k2 + k3) / 4;
            y = y + k * deltaX;
            x = x + deltaX;
        end
        
        yb2 = y;
    end

    fprintf('The result of the temperature for Runga-Kutta Stage 3 is: %.15f\n', yb2);
    fprintf('The number of subintervals is: %.15f\n', n);

    result = yb2;
end