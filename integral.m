function result = integral()
    format long;
    
    a = input("Enter your a value: ");
    b = input("Enter your b value: ");
    f = @(x, y) x^2 - y^2;
    ya = input("Enter the initial value: ")
    e = input("Enter your epsilon value: ");

    n = 1;
    dx = b - a;
    yb1 = ya + f(a, ya) * dx
 
    n = 2;
    dx = (b - a) / 2;
    y = ya + f(a, ya) * dx
    x = a + dx
    yb2 = y + f(x, y) * dx

    while abs(yb2 - yb1) > e
        n = 2*n;
        dx = dx / 2;
        x = a;
        y = ya;
        yb1 = yb2;

        for j = 1 : n
            y = y + f(x, y) * dx;
            x = x + dx;
        
        yb2 = y;

    end

    fprintf('The result of integral is: %.15f\n', yb2);
    fprintf('The number of subinterval is: %.15f\n', n);

    result = yb2;
end