clc
clear all
close all
x = linspace(1,10,10);
y = 2.*x;
p = plot(x,y,'-*');

dt = datatip(p,3.5,7,'SnapToDataVertex','off');