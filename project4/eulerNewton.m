function result = eulerNewton()
    format long;
    
    a = input("Enter the start time a: ");
    b = input("Enter the end time b: ");
    ya = input("Enter the initial temperature of the object: ");
    Ta = input("Enter the ambient temperature Ta: ");
    k = input("Enter the constant k: ");
    e = input("Enter your epsilon: ");
    
    f = @(x, y) -k * (y - Ta);

    n = 1;
    dx = b - a;
    yb1 = ya + f(a, ya) * dx;

    n = 2;
    dx = (b - a) / 2;
    y = ya + f(a, ya) * dx;
    x = a + dx;
    yb2 = y + f(x, y) * dx;

    while abs(yb2 - yb1) > e
        n = 2 * n;
        dx = dx / 2;
        x = a;
        y = ya;
        yb1 = yb2;

        for j = 1 : n
            y = y + f(x, y) * dx;
            x = x + dx;
        end
        
        yb2 = y;
    end

    fprintf('The result of the temperature for Euler Method is: %.15f\n', yb2);
    fprintf('The number of subintervals is: %.15f\n', n);

    result = yb2;
end