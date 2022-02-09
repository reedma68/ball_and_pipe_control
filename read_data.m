function [distance,pwm,target,deadpan] = read_data(device)
%% Reads data sent back from Ball and Pipe system
% Inputs:
%  ~ device: serialport object controlling the real world system
% Outputs:
%  ~ distance: the IR reading from the time of flight sensor
%  ~ pwm: the PWM from the manual knob of the system (NOT THE SAME AS THE
%  PWM YOU MAY SET THROUGH SERIAL COMMUNICATION)
%  ~ target: the desired height of the ball set by the manual knob of the
%  system
%  ~ deadpan: the time delay after an action set by the manual knob of the
%  system
%
% Created by:  Kyle Naddeo 1/3/2022
% Modified by: Jason Boucher 2/9/2022

%% Ask nicely for data
% use the serialport() command options to write the correct letter to the
% system (Hint: the letters are in the spec sheet)
write(device,"S","string")
%% Read data
% use the serialport() command options to read the response

data = read(device,20,"string");

%% Translate
% translate the response to 4 doubles using str2double() and
% extractBetween() (Hint: the response is in the spec sheet)
% distance   = 
% manual_pwm = 
% target     = 
% deadpan    = 
distance = extractBetween(data,2,5);
pwm = extractBetween(data,7,10);
target = extractBetween(data,12,15);
deadpan = extractBetween(data,17,20);
str2double(distance);
str2double(pwm);
str2double(target);
str2double(deadpan);
end