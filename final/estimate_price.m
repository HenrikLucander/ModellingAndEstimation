%% problem 2
%Henrik Lucander
%724140
%clear all;
%close all;
%house_params = [45 1978 1 1 0.2 0.3];
function price_house = estimate_price(house_params)
data=readtable('data2.xlsx');
arrData = table2array(data);
P = [1.43 0.63]; %coordinates of downtown

%calculating distance to downtown(P) with basic distance between 2 points formula
%for the data
dis_to_P = sqrt((P(1) - arrData(:,6)).^2 + (P(2) - arrData(:,7)).^2);

%we make the input matrix X for the closed form solution theta
x = [ones(200,1) arrData(:,2:5) dis_to_P];

%closed form solution where:
%arrData(:,1) is the price column, acts as the output matrix Y
theta = (x'*x)^-1*x'*arrData(:,1); 

%calculating distance to downtown(P) for house_params
dis_to_P_house_params = sqrt((P(1) - house_params(5)).^2 + (P(2) - house_params(6)).^2);

%price of the house, output of the function
price_house = theta(1)+house_params(1:4)*theta(2:5)+dis_to_P_house_params*theta(6);

format longg;
SSE = (arrData(:,1) - x*theta)' * (arrData(:,1) - x*theta);
SST = sum((arrData(:,1) - mean(arrData(:,1))).^2);
R2 = 1 - (SSE/SST);
var = SSE/(size(arrData(:,1),1) - (size(x,2)-1)-1);

hold on;
subplot(2,1,1);
plot(1:size(arrData(:,1),1), (arrData(:,1) - x*theta).^2);
title(sprintf('SSE = %d',SSE));
ylabel('Squared Error')
xlabel('data points')

subplot(2,1,2)
scatter(dis_to_P,arrData(:,1),'b');
scatter(dis_to_P_house_params,price_house,'r')
title('distance and price correlation')
legend('Estimate','Data')
ylabel('Price')
xlabel('Distance from downtown(km)')

fprintf('Price = %f\n',price_house);
fprintf('SSE = %f\n',SSE);
fprintf('SST = %f\n',SST);
fprintf('R^2 = %f\n',R2);
fprintf('Var = %f\n',var);

end


