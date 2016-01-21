clear all
clc
hfiles=ls('*.wav');

h1=hfiles(2,:);
y11=wavread(h1);
