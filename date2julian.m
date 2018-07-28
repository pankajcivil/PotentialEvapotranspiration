% This function will convert the calendar date to Julian Date.
%
% For example: suppose I have a date from a leap year such as 1st March
% 1904. 
% The corresponding Julian Date of the calender date will be 61. Similarly,
% if I have a date of 1st March 1905 from a regular year, the Julian Date
% will be 60.
%
%  Input: date: it is an array with three columns. The first, second and
%  third column corresponds to year, month  and day respectively.
%
%      For example:    		Col.1     Col.2      Col.3
%                                Year     Month       Day
%                        
%                      date=     1904        3         1
%                                1905        3         1
%                              
%   Output: jd: values in the rows indicates the Julian date of every
%   elements of the date input vector.
%      
%
%   Please Note that in this function there are two .mat file namely
%   "leap_year" and "normal_year". Keep it in the same folder of the data
%   analysis for working of this code.
function jd=date2julian(date)
[n m]=size(date);
year=date(:,1);
month=date(:,2);
day=date(:,3);
load leap_year;
load normal_year;
for i=1:n
if( mod(year(i,1),400)==0)  % conditions for leap year
      jd(i,1)=find(leap_year(:,1)==month(i,1) & leap_year(:,2)==day(i,1));
else if (mod(year(i,1),4)==0 & mod(year(i,1),100)~=0)% conditions for leap year
        jd(i,1)=find(leap_year(:,1)==month(i,1) & leap_year(:,2)==day(i,1));
else
   jd(i,1)=find(normal_year(:,1)==month(i,1) & normal_year(:,2)==day(i,1));
end
end
end
end

