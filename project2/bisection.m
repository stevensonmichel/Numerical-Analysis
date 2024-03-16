function final = bisection()
    format long;
    r = input("Choose your r: ");
    e = input("Choose your epsilon:" );

    if r > 1
        a = 1;
        b = r;
    else
        a = r;
        b = 1;
    end

    counter = 0
    while abs(b - a) >= e
        c = (a + b) / 2;
        counter = counter + 1
        if c^2 > r
            b = c;
        else
            a = c;
        end
    end
fprintf("Final value of counter is %d\n", counter)
fprintf("Final result of bissection is %d\n", c)
disp(c)
final = c;
end