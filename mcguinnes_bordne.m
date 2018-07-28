function [pet_mm_per_day]=mcguinnes_bordne(lat,date,t_max,t_min)
% *************************************************************
% Code written by Pankaj Dey, PhD student in Indian Institute of Science,
% Bangalore
%****************************************************************
% This function is use to calculate daily potential evapotranspiration
% using Mcguinnes Bordne formulation.
%
% Input:
% lat: latitude of the place in decimal degrees.
% date: date array in the following format
%
%For example:    		Col.1     Col.2      Col.3
%                                Year     Month       Day
%                        
%                          date= 1904        3         1
%                                1905        3         1
%
% t_max: maximum daily temperature in degree celsius
% t_min: minimum daily temperature in degree celsius
%
% Output: pet_mm_per_day is daily potential evapotranspiration in fourth
% column. The first three columns indicate year, month and day of the
% observation respectively.
%
%
%
% The main code begins from here
%
% computation of phi in radians
% lat is acronym for latitude in degrees
phi=(pi/180)*lat; % lat is input

% Computation of julian day
jd=date2julian(date);   % date vector is input

% Computation of Relative earth-sun distance 

dr=1+0.033*cos((2*pi/365)*(jd));

% Compuatation of Solar declination in radians
delta=0.4093*sin((2*pi/365)*(jd)-1.405); % jd is julian day

% Computation of Sunset hour angle

ws=acos(-tan(phi)*tan(delta));  % in radians

% Computation of extra terrestrial radiation in MJ/mm2.day

S0=37.62*(dr)*(ws*sin(phi)*sin(delta)+cos(delta)*cos(phi)*sin(ws));



% Computation of Mean daily temperature
t_mean=(t_max + t_min )/2;  % t_max and t_min are input data

% lambda: latent heat of vaporisation
lambda=2.501 - (2.361*10^-3)*t_mean; % MJ/kg

% Potential Evapotranspiration in mm/day
pet=(1/lambda)*(S0)*((t_mean+5)/68);

% Daily pet
pet_mm_per_day=[date, pet];