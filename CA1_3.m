clc
clear
close all

[x, Fs] = audioread("voice.wav");
N = length(x);
n = 0:N;
h = (n == 0) + 0.64*(n == Fs);
y = conv(x(:), h, 'full');
addedEchoTime = N + Fs;

yf = y(1:addedEchoTime);
sound(yf, Fs);

dt = 1 / Fs;
t = dt*(0:length(yf)-1);

plot(t, yf);
xlim([0 11]);
xlabel("seconds");
ylabel("Output Signal");
title("Echoed Signal with a Delay of 1s and 64% amp");

audiowrite("y.wav", yf, Fs);
