function price_house = estimate_price(house_params)
table1=readtable('data2.xlsx');
data1=table2array(table1);
P=[1.43 0.63];
d=size(data1(:,1),1);
price=data1(:,1);

dis=sqrt((P(1)-data1(:,6)).^2+(P(2)-data1(:,7)).^2);
X=[ones(1,d)', data1(:,2:5),dis];
theta=(X'*X)^-1*X'*price;

dis2=sqrt((P(1)-house_params(5)).^2+(P(2)-house_params(6)).^2);

price_house=theta(1)+house_params(1:4)*theta(2:5)+dis2*theta(6);

SSE=(price-X*theta)'*(price-X*theta);
SST=sum((price-mean(price)).^2);
R2=1-(SSE/SST);
subplot(2,1,1)
plot(1:size(price,1),(price-X*theta).^2);
variance=SSE/(size(price,1)-(size(X,2)-1)-1);

title(sprintf('SSE = %d',SSE))
ylabel('Squared Error')
subplot(2,1,2)
scatter(1:size(price,1),price,'b');hold on;
scatter(201,price_house,'r')
title('All the datapoints')
legend('Data','Estimate')
ylabel('Price')
fprintf('Price=%f\n',price_house);
fprintf('R^2=%f\n',R2);
fprintf('SSE=%f\n',SSE);
fprintf('SST=%f\n',SST);
fprintf('Variance=%f\n',variance);

end
