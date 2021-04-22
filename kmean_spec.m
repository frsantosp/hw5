rng default; % For reproducibility
m = [randn(100,2)*0.75+ones(100,2);
    randn(100,2)*0.5-ones(100,2)];
%inspired by https://www.mathworks.com/help/stats/kmeans.html

k = 4;
[R,C]=size(m);


[U,S,V] = svd(m*m');
Y = V(:,1:k);
%Y = Y';

X = Y;

[maxR, maxC]=size(X);

c = zeros(200,k);
p = randperm(size(m,1));      % pick at random centroids
for i=1:k
    c(i,:)=X(p(i),:) ; 
end

y_p = zeros(R,1);        
temp= zeros(R,1);         
while 1
                                   % calculate objcets-centroid distances
    for j=1:maxR
        dis = zeros(k,1);
        for i=1:k
            d = sqrt((X(j,:) -c(i,:))*(X(j,:)-c(i,:))');   %distance calculation
            dis(i) = d;
        end
        [r,I] = min(dis); 
        y_p(j) = I(1);
    end
    
    if y_p==temp
        break;                % if no new centroids , stop
    else
        temp=y_p;             
    end
    
    for i=1:k
        f=find(y_p==i);
        if f                  % find new centroids
            c(i,:)=mean(X(find(y_p==i),:),1);
        end
    end
end
y=[X,y_p];
count1 = 0 ;
count2 = 0 ;
count3 = 0;
count4 = 0;
x1 = zeros(59, 2); 
x2 = zeros(37, 2);
x3 = zeros(101, 2);
x4 = zeros(3, 2);
for i=1:200
    if y_p(i) ==1
        count1 = count1+1;
        x1(count1,:)= m(i,1:2);
    elseif y_p(i) ==2
        count2 = count2 +1;
        x2(count2,:)= m(i,1:2);
    elseif y_p(i) ==4
        count4 = count4 +1;
        x4(count4,:)= m(i,1:2);
    else
        count3 = count3 +1;
        x3(count3,:)= m(i,1:2);
    end
end
count1
count2
count3
count4
plot(x1(:,1),x1(:,2),'*');
hold on;
plot(x2(:,1),x2(:,2),'o');
hold on;
plot(x3(:,1),x3(:,2),'+');
hold on;
plot(x4(:,1),x4(:,2),'s');
hold off;