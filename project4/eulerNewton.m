function result = eulerNewton()
    format long;
    
    a = input("Enter the start time a: ");
    b = input("Enter the end time b: ");
    Ta = input("Enter the ambient temperature Ta: ");
    k = input("Enter the cooling constant k: ");
    T0 = input("Enter the initial temperature of the object T0: ");
    e = input("Enter your epsilon value: ");
    
    n = 1;
    dt = b - a;
    T_next = T0 + (-k * (T0 - Ta)) * dt; 
    
    n = 2;
    dt = (b - a) / 2;
    T = T0;
    t = a;
    T1 = T0 + (-k * (T0 - Ta)) * dt;
    t = t + dt;
    T2 = T1 + (-k * (T1 - Ta)) * dt;

    while abs(T2 - T_next) > e
        n = 2 * n;
        dt = dt / 2;
        t = a;
        T = T0;
        T_next = T2;

        for j = 1 : n
            T = T + (-k * (T - Ta)) * dt;
            t = t + dt;
        end

        T2 = T;

    end

    fprintf('The final temperature is: %.15f\n', T2);
    fprintf('The number of subintervals is: %d\n', n);

    result = T2;
end
