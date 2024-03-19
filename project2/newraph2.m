function final = newraph2()
    format long;

    r = input("Choose your r: ")
    e = input("Choose your epsilon: ")

    a = log(r);
    b = a - 1 + r / (exp(a));
    counter = 0;

    while abs(b - a) > e
        a = b;
        b = a - 1 + r / (exp(a));
        counter = counter + 1;
    endwhile
    
    fprintf("The final value of the counter is %d\n", counter);
    % fprintf("The final value of newraph is %d\n", b);
    % disp(b);
    final = b;
end