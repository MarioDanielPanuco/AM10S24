% Visualizing the Effect of a 3x3 Matrix on a Unit Sphere

for i = 1:5
    [u, v, w] = sphere(24); % Increase the value for finer resolution
    X = u;
    Y = v;
    Z = w;
    A = rand(3,3); 
      % A = [2 3 0; 0 5 0; 0 0 1];
    % A = [(1/2)*cos(theta) -sin(theta) 0;sin(theta) cos(theta) 0; 0 0 2];
    hold on 
    hold on 
    % Reshape the sphere coordinates into a list of points
    numPoints = numel(X);
    points = [X(:), Y(:), Z(:)]';
    
    % Apply the matrix to transform the unit sphere
    transformed_points = A * points;
    
    % Reshape the transformed points back into X, Y, Z format
    X_transformed = reshape(transformed_points(1,:), size(X));
    Y_transformed = reshape(transformed_points(2,:), size(Y));
    Z_transformed = reshape(transformed_points(3,:), size(Z));
    
    % Plot the original and transformed spheres
    figure;
    subplot(1, 2, 1);
    surf(X, Y, Z);
    axis equal;
    title('Original Unit Sphere');
    
    subplot(1, 2, 2);
    surf(X_transformed, Y_transformed, Z_transformed);
    axis equal;
    title('Transformed Sphere');
    
    xlabel('X-axis');
    ylabel('Y-axis');
    zlabel('Z-axis');
end
