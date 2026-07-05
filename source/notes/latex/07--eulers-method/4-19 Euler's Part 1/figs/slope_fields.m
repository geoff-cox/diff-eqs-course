%In-class activity on Euler's Method


% %For the DE y' = y^2 - y^4
%     slope_D = @(x,y) y.^2 - y.^4;
%     figure(5)
%     dirfield(slope_D, -3:0.25:3, -2:0.25:2)
%     hold on
%     plot([0 0], [-2 2],'k', [-3 3],[0 0], 'k')
%     hold off
%     axis([-3 3 -2 2])
%     title('Slope Field for dy/dx = y^2 - y^4')
    

%For the DE y' = 0.1*\sqrt{y} + 0.4*x^2
    slope_E = @(x,y) 0.1*sqrt(y) + 0.4*x^2;
    figure(6)
    dirfield(slope_E, 0:0.25:3, 0:0.25:5)
    hold on
    plot([0 0], [0 5],'k', [0 3],[0 0], 'k')
    hold off
    axis([0 3 0 5])
    title('Slope Field for dy/dx = 0.1*sqrt(y) + 0.4*x^2')
    