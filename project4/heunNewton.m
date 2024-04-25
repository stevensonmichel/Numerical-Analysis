function result = heunNewton()
    format long;
    
    a = input("Enter the start time t0: ");
    b = input("Enter the end time tf: ");
    Ta = input("Enter the ambient temperature Ta: ");
    k = input("Enter the cooling constant k: ");
    T0 = input("Enter the initial temperature of the object T0: ");
    e = input("Enter your epsilon value: ");
    
    n = 1;
    dt = b - a;
    k1 = -k * (T0 - Ta);
    k2 = -k * ((T0 + k1 * dt) - Ta);
    avgK = (k1 + k2) / 2;
    T_next = T0 + avgK * dt;

    n = 2;
    dt = (b - a) / 2;
    T = T0;
    t = a;

    k1 = -k * (T - Ta);
    T1 = T + k1 * dt;
    k2 = -k * (T1 - Ta);
    avgK = (k1 + k2) / 2;
    T2 = T + avgK * dt;

    while abs(T2 - T_next) > e
        n = 2 * n;
        dt = dt / 2;
        t = a;
        T = T0;
        T_next = T2;

        for j = 1 : n
            k1 = -k * (T - Ta);
            T1 = T + k1 * dt;
            k2 = -k * (T1 - Ta);
            avgK = (k1 + k2) / 2;
            T = T + avgK * dt;
            t = t + dt;
        end

        T2 = T;
    end

    fprintf('The final temperature is: %.15f\n', T2);
    fprintf('The number of subintervals is: %d\n', n);

    result = T2;
end
