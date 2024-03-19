
function main2()
    result1 = bisection2();
    fprintf('The result of the Bissection method is: %.15f\n', result1);

    result2 = secant2();
    fprintf('The result of the Secant method is: %.15f\n', result2);

    result3 = newraph2();
    fprintf('The result of the Newton-Raphson method is: %.15f\n', result3);

end