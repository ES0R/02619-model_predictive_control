function [y, z, t] = SimulateStochasticBrown(F)


    t0 = 0.0;
    tfin = 20*60;
    Ts = 10;
    t = [t0:Ts:tfin];     % time vector
    N = length(t);
    
    sz = 4;
    su = 2;
    
    % Realization of Ns Standard Brownian Motions
    Ns = 2;            % Number of realizations
    seed = 100;         % Seed for reproducibility
    rng(seed);
    dV = sqrt(Ts)*randn(Ns,N);
    d_s = cumsum(dV,2);
    
    F1 = 300;
    F2 = 300;
    u = [repmat(F1,1,N); repmat(F2,1,N)];   % control
    
    % Measurement Noise setup
    R = eye(4);
    Lr = chol(R,'lower');
    v = Lr*randn(4,N);
    
    
    nx = 4; nu = 2; ny = 4; nz = 2;
    x = zeros(nx,N);
    y = zeros(ny,N);
    
    % Process noise
    Q = [2 1; 1 10];
    Lq = chol(Q,'lower');
    w = Lq*randn(2,N);
    
    
    
    
    z = zeros(nz,N);
    X = zeros(0,nx);
    T = zeros(0,1);
    step_size = 0.01;
    x(:,1) = [0;0;0;0];
    
    
    for i = 1:period:N
        if mod(i, 2*period) < period
            d(:, i:min(i+period-1, N)) = 2*amplitude;
        else
            d(:, i:min(i+period-1, N)) = amplitude;
        end
    end
    
    d_plot = d(1, :);
    
    figure()
    plot(t, d_plot, 'LineWidth', 1.5);
    title(['Tank ', "Deterministic Disturbance"], 'interpreter', 'latex');
    xlabel('Time [sec]', 'interpreter', 'latex');
    ylabel('Water Level [cm$^3$/s]', 'interpreter', 'latex');
    grid on; % Add grid
    
    
    for k = 1:N-1
        y(:,k) = FourTankSystemSensor(x(:,k),parameters)+v(:,k); % Sensor function WITH noise
        z(:,k) = FourTankSystemOutput(x(:,k),parameters);
        % Output function
        disturbance = d(:,k) + d_s(:,k);
        [Tk,Xk] = ode45(@ModifiedFourTankSystem,[t(k):step_size:t(k+1)],x(:,k),[], ...
            u(:,k)+ w(:,k),disturbance,parameters);
        x(:,k+1) = Xk(end,:)';
        % T = [T; Tk];
        X = [X; Xk];
    end
    
    
    k = N;
    y(:,k) = FourTankSystemSensor(x(:,k),parameters) + v(:,k); % Sensor function
    z(:,k) = FourTankSystemOutput(x(:,k),parameters);        % Output function



end

