clc
clear
close all

[x, Fs] = audioread("voice.wav");

dt = 1 / Fs;
t = dt*(0:length(x)-1);

plot(t, x);
xlabel("seconds");
title(sprintf("Sampled Audio File with Frequency %d", Fs));
xlim([0 10]);

sound(x, Fs);
audiowrite("x.wav", x, Fs);
