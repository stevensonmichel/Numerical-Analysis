function final = fixedpoint2()
    format long;

    r = input("Write your r: ");
    e = input("Choose your epsilon: ");

    a = 1;
    b = (a + r)/(a + 1);
    counter = 0;

    while abs(b - a) > e
        a = b;
        b = (a + r)/(a + 1);
        counter = counter + 1;
    end
    
    disp(a);
    disp(counter);
    final = a;
end