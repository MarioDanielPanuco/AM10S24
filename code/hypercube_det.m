% The vertices of a 3D cube
vertices = [0 0 0; 1 0 0; 1 1 0; 0 1 0; % Base square
            0 0 1; 1 0 1; 1 1 1; 0 1 1]; % Top square

% Define the faces of the cube
faces = [1 2 3 4; % Bottom face
         5 6 7 8; % Top face
         1 2 6 5; % Front face
         2 3 7 6; % Right face
         3 4 8 7; % Back face
         4 1 5 8]; % Left face

% Defining a 3x3 transformation matrix
T = [1 0.5 0; 0 1 0.5; 0.5 0 1];
disp(['Determinant of the transformation matrix (Red): ', num2str(det(T))]);

% Apply the transformation to the cube vertices
transformedVertices = vertices * T;

T_2 = [1 0.5 2; 0 1 0.5; 0.5 0 1];
transformedVertices_2 = vertices * T_2;
disp(['Determinant of the transformation matrix (Green): ', num2str(det(T_2))]);


% Plot the original and transformed cubes
figure;
hold on;
title('3D Cube and Its Transformation');
xlabel('X');
ylabel('Y');
zlabel('Z');


% Plot original cube
plotCube(vertices, faces, 'b');

% Plot transformed cube
plotCube(transformedVertices, faces, 'r');
plotCube(transformedVertices_2, faces, 'g');

% legend('Original Cube', 'Transformed Cube');
view(3); % Adjust the view to 3D
axis equal;
grid on;
hold off;

function plotCube(vertices, faces, color)
    for i = 1:size(faces, 1)
        patch('Vertices', vertices, 'Faces', faces(i,:), 'FaceColor', color, 'FaceAlpha', 0.5);
    end
end