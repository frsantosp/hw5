rng default; % For reproducibility
m = [randn(100,2)*0.75+ones(100,2);
    randn(100,2)*0.5-ones(100,2)];
%inspired by https://www.mathworks.com/help/stats/kmeans.html


[R,C]=size(m);

k = 4;
c = zeros(k,2);
p = randperm(size(m,1));      % pick at random centroids
for i=1:k
    c(i,:)=m(p(i),:) ; 
end

y_p = zeros(R,1);        
temp=zeros(R,1);         
while 1
    %d=DistMatrix(m,c);       % calculate objcets-centroid distances
    for j=1:R
        dis = zeros(k,1);
        for i=1:k
            d = sqrt((m(j,:) -c(i,:))*(m(j,:)-c(i,:))');   %distance calculation
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
            c(i,:)=mean(m(find(y_p==i),:),1);
        end
    end
end
y=[m,y_p];
count1 = 0 ;
count2 = 0 ;
count3 = 0;
count4 = 0;
x1 = zeros(29, 2); 
x2 = zeros(33, 2);
x3 = zeros(100, 2);
x4 = zeros(38, 2);
for i=1:length(y)
    if y(i,3) ==1
        count1 = count1+1;
        x1(count1,:)= y(i,1:2);
    elseif y(i,3) ==2
        count2 = count2 +1;
        x2(count2,:)= y(i,1:2);
    elseif y(i,3) ==4
        count4 = count4 +1;
        x4(count4,:)= y(i,1:2);
    else
        count3 = count3 +1;
        x3(count3,:)= y(i,1:2);
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
