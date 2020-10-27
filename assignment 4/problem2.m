%% Homework 4
% Henrik Lucander 724140
clear all
close all
load data2.mat
% Problem 2
% a)
figure(1);
year = data(:,1);
oilConsumption = data(:,2);
economicGrowth = data(:,3);

t = -20:20;
corr = xcorr(oilConsumption, economicGrowth,20);
stem(t,corr);
ylabel('corr');
xlabel('year lag');

% b)
%splitting the data to training and validation sets:
oilTraining = oilConsumption(1:end/2);
oilValidation = oilConsumption(end/2+1:end);
ecoTraining = economicGrowth(1:end/2);
ecoValidation = economicGrowth(end/2+1:end);
pfit1 = polyfit(oilTraining,ecoTraining,1); %second order
pfit2 = polyfit(oilTraining,ecoTraining,2); %third order

% c)
figure(2);
hold on;
xaxis = linspace(-4,6,100); %x-axis
pval1 = polyval(pfit1,xaxis); %second order
pval2 = polyval(pfit2,xaxis); %third order
plot(xaxis, pval1);
plot(xaxis, pval2);

scatter(oilTraining,ecoTraining);
scatter(oilValidation,ecoValidation);
xlabel('oil consumption');
ylabel('economic growth');
legend('polyfit 2nd order','polyfit 3rd order','training data','validation data','Location','southeast');
hold off;
%economic growth in year 2015 assuming that the oil consumption percentage
%was -0.5%
oilChange = -0.5;
ecoGrowthIn2015 = pfit1(1)*oilChange+pfit1(2)