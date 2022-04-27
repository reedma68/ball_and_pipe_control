% A MATLAB script to control Rowans Systems & Control Floating Ball 
% Apparatus designed by Mario Leone, Karl Dyer and Michelle Frolio. 
% The current control system is a PID controller.
%
% Created by Kyle Naddeo, Mon Jan 3 11:19:49 EST 
% Modified by Team Rasool

%% Start fresh
close all; clc; clear device; clear;

%% Connect to device
device = serialport("COM3", 19200);

%% Parameters
target      = 0.5;   % Desired height of the ball [m]
sample_rate = 0.1;  % Amount of time between controll actions [s]

%% Give an initial burst to lift ball and keep in air
set_pwm(device, 3400); % Initial burst to pick up ball
n = 1;
y_values = zeros(200);
while n < 20           % loop to read data and save it in vector
    pause(sample_rate)
    [di,p,t,de] = read_data(device);
    di
    y_values(n) = di;
    n = n + 1; 
end

set_pwm(device, 2000);
while n < 50
    pause(sample_rate)
    [di,p,t,de] = read_data(device);
    di
    y_values(n) = di;
    n = n + 1;
end

set_pwm(device, 2525); % Set to lesser value to level out somewhere in
                       % the pipe
while n < 200
    
    [di,p,t,de] = read_data(device);
    di
    y_values(n) = di;
    n = n + 1;
    pause(sample_rate)
end

plot(y_values);
%% Initialize variables
% action      = ; % Same value of last set_pwm   
error       = 0;
error_sum   = 0;

%% Feedback loop
while true
    %% Read current height
    % [add_proper_args] = read_data(add_proper_args);
    % y = ir2y(add_proper_args); % Convert from IR reading to distance from bottom [m]
    
    %% Calculate errors for PID controller
    error_prev = error;             % D
    error      = target - y;        % P
    error_sum  = error + error_sum; % I
    
    %% Control
    prev_action = action;
    %action = % Come up with a scheme no answer is right but do something
    % set_pwm(add_proper_args); % Implement action
%% System wtihout PID controller
pair=1.2250;%air density
veq=2.4384;
mball=0.027;%mass of ball in kg

vball=0;%velocity of ball (ideal)
c2=((2*9.8)/veq)*((mball-pair*vball)/mball);
c3=6.3787*10^(-4);

s = tf('s');

sys=(c3*c2)/(s*(s+c2));

%figure
%step(sys)
%% PID Controlled system
kcr=700000000;%value of kp that produces sustained oscillation
Pcr=0.0033;%period of sustained oscillation

kp=0.6*kcr;
Ti=0.5*Pcr;
Td=0.125*Pcr;

ki=kp/Ti;
kd=kp*Td;
cont=pid(kp,ki,kd)%tuning controller

%figure
%step(feedback(cont*sys,1))%step response used to get values below
    
% Wait for next sample
    pause(sample_rate)
end

