clc
clear
close all

[x, Fs] = audioread("voice.wav");
N = length(x);
n = 0:N;

delay = floor(Fs/5);
h = (n == 0) + 0.5*(n == delay);

y = conv(x(:), h, 'full');
addedEchoTime = N + delay;
yf = y(1:addedEchoTime);
sound(yf, Fs);

dt = 1 / Fs;
t = dt*(0:length(yf)-1);

plot(t, yf);
xlim([0 11]);

audiowrite("y_best.wav", yf, Fs);
