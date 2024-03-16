function final = newraph2()
    format long;

    r = input("Write your r: ")
    e = input("Choose your epsilon: ")

    a = r/2;
    b = (r + a^2)/(2 * a);
    counter = 0;

    while abs(b - a) > e
        a = b;
        b = (r + a^2) / (2 * a);
        counter = counter + 1;
    endwhile
    
    fprintf("The final value of the counter is %d\n", counter);
    fprintf("The final value of newraph is %d\n", b);
    disp(b);
    final = b;
end