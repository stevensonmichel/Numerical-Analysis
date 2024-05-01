function main4()

    heunNewton(1, 20, 50, 18, 0.2, 0.00001);
    rk3Newton(1, 20, 50, 18, 0.2, 0.00001);
    rk4Newton(1, 20, 50, 18, 0.2, 0.00001);
    % fprintf('The result of the integration is: %.15f\n', result);
end