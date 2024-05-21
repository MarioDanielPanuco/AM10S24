% Generate synthetic 3D data
rng(1); % 
numPoints = 100; % Number of points per class

% Class 1: around point (1,1,1)
class1 = randn(numPoints,3) + 1;

% Class 2: around point (-1,-1,-1)
class2 = randn(numPoints,3) - 1;

X = [class1; class2];
Y = [ones(numPoints,1); -ones(numPoints,1)];

% Train the SVM with a linear kernel
SVMModel = fitcsvm(X, Y, 'KernelFunction', 'linear');

% Plotting
figure;
hold on
grid on;
view(3); 

% Plot class points
scatter3(class1(:,1), class1(:,2), class1(:,3), 'ro', 'filled');
scatter3(class2(:,1), class2(:,2), class2(:,3), 'bo', 'filled');

% Calculate the decision plane (hyperplane) coefficients
w = SVMModel.Beta;
b = SVMModel.Bias;

% Define the grid for the plane
[x, y] = meshgrid(linspace(min(X(:,1)), max(X(:,1)), 10), ...
                  linspace(min(X(:,2)), max(X(:,2)), 10));
z = (-w(1)*x - w(2)*y - b)/w(3);

% Plot the decision plane
mesh(x, y, z, 'FaceAlpha', 0.5, 'EdgeColor', 'k', 'FaceColor', 'g');

% Highlight support vectors
sv = SVMModel.SupportVectors;
scatter3(sv(:,1), sv(:,2), sv(:,3), 100, 'y', 'filled');

title('3D SVM Classification with 2D Hyperplane');
xlabel('Feature 1');
ylabel('Feature 2');
zlabel('Feature 3');
legend({'Class 1', 'Class 2', 'Decision Plane', 'Support Vectors'}, ...
    'Location', 'Best');
hold off;

