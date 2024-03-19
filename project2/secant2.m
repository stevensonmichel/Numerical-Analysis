function final = secant2()
    format long;

    r = input("Choose your r: ");
    e = input("Choose your epsilon: ");

    a = 0;
    b = 0;
    c = 0;
    counter = 0;

    if r < 1
        b = 1;
    else
        a = 1;
        b = log(r);
    endif

    while abs(b - a) > e
        % c = (r + a*b) / (a + b);
        
        fa = exp(a) - r;
        fb = exp(b) - r;
        c = b - fb * (b - a) / (fb - fa);
        a = b;
        b = c;
        counter = counter + 1;
    endwhile
    fprintf("Final value of counter is %d\n", counter);
    % fprintf("Final result of secant is %d\n", c);
    % disp(c);
    final = c;
end