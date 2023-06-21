clear all;close all; clc;
A=0:0.1:90;%%Angle from 1 to 90
Gb = csvread('solar.csv',9,2,[9 2 26312 2]);
H = csvread('solar.csv',9,6,[9 6 26312 6]);
Gd = csvread('solar.csv',9,3,[9 3 26312 3]);

B=((pi)*A/180);%%Solar PV installation Angle

GB=Gb.*sin(H+B)./sin(H+pi/4);%%Gb(B)=Gb*sin(a+B)/sin(a+pi/4)

Gtotaly=GB+Gd;%%add the diffused irradiance Gd

Pstc=2.4;%%PV panels are specified by the power they output under standard conditions (STC):
%%This number is just an 
%%example, from the ppt. 
%%The actual value is depending on what PV we decide to use 

Pele=Pstc.*Gtotaly;%%generated power simply
Time=1;%%the table record time intervals of one hour(3600seconds) ,if unit is "wh "use date "1"
Energy=Pele*Time;%%the table of energy produced per hour 
Energytotaly=sum(Energy);%%totaly energy