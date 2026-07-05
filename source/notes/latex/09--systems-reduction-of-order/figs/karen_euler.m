
%% EULER FOR SYSTEM--for handout euler_part2--Q1
    t0 = 0;
    x0 = 1
    y0 = -2;
    tf = 0.5;
    delta_t = 0.25;
    RHS1 = @(t,x,y) 3*x^2 + 2*y;
    RHS2 = @(t,x,y) x - t;


    num_steps = round((tf-t0)/delta_t,0);

    t_vec = zeros(num_steps + 1,1);
    x_vec = t_vec;
    y_vec = t_vec;
    t_vec(1) = t0;
    x_vec(1) = x0;
    y_vec(1) = y0;
    for i = 2:num_steps+1
        t_vec(i) = t_vec(i-1) + delta_t;
        x_vec(i) = x_vec(i-1) + delta_t * RHS1(t_vec(i-1),x_vec(i-1),y_vec(i-1));
        y_vec(i) = y_vec(i-1) + delta_t * RHS2(t_vec(i-1),x_vec(i-1),y_vec(i-1));
    end

    [t_vec x_vec y_vec]
    
    
%% For Q2
    t0 = 0;
    u0 = 4;
    v0 = -3;
    tf = 1;
    delta_t = 0.5;
    RHS1 = @(t,u,v) v;
    RHS2 = @(t,u,v) exp(t) - t*v - u^2;


    num_steps = round((tf-t0)/delta_t,0);

    t_vec = zeros(num_steps + 1,1);
    u_vec = t_vec;
    v_vec = t_vec;
    t_vec(1) = t0;
    u_vec(1) = u0;
    v_vec(1) = v0;
    for i = 2:num_steps+1
        t_vec(i) = t_vec(i-1) + delta_t;
        u_vec(i) = u_vec(i-1) + delta_t * RHS1(t_vec(i-1),u_vec(i-1),v_vec(i-1));
        v_vec(i) = v_vec(i-1) + delta_t * RHS2(t_vec(i-1),u_vec(i-1),v_vec(i-1));
    end

    [t_vec u_vec v_vec]
    
%% For Q3:
%       Solve the IVP x^2 y'' - 2xy' + 2y = 0, y(1) = 4, y'(1) = 9.
%
%       Use the change of vars u = y, v = y'
    x0 = 1;
    u0 = 4;
    v0 = 9;
    xf = 1.2;
    delta_x = 0.1;
    RHS1 = @(x,u,v) v;
    RHS2 = @(x,u,v) 2*v/x - 2*u/x^2;


    num_steps = round((xf-x0)/delta_x,0);

    x_vec = zeros(num_steps + 1,1);
    u_vec = x_vec;
    v_vec = x_vec;
    x_vec(1) = x0;
    u_vec(1) = u0;
    v_vec(1) = v0;
    for i = 2:num_steps+1
        x_vec(i) = x_vec(i-1) + delta_x;
        u_vec(i) = u_vec(i-1) + delta_x * RHS1(x_vec(i-1),u_vec(i-1),v_vec(i-1));
        v_vec(i) = v_vec(i-1) + delta_x * RHS2(x_vec(i-1),u_vec(i-1),v_vec(i-1));
    end

    [x_vec u_vec v_vec]
    
