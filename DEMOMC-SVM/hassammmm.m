load trainvec_strong.mat
data=trainvec;
% Create gesture labels
gesture_labels = zeros(size(data, 1), 1);
gesture_labels(1:137) = 1; % Right gesture
gesture_labels(138:149) = 2; % Rest gesture
gesture_labels(150:282) = 3; % Left gesture
gesture_labels(283:294) = 2; % Rest gesture
gesture_labels(295:434) = 3; % Left gesture
gesture_labels(435:446) = 2; % Rest gesture
gesture_labels(447:576) = 1; % Right gesture
gesture_labels(577:588) = 2; % Rest gesture
gesture_labels(589:725) = 4; % Fist gesture
gesture_labels(726:737) = 2; % Rest gesture
gesture_labels(738:868) = 5; % Spread fingers gesture
gesture_labels(869:880) = 2; % Rest gesture
gesture_labels(881:1025) = 5; % Spread fingers gesture
gesture_labels(1026:1037) = 2; % Rest gesture
gesture_labels(1038:1165) = 4; % Fist gesture
% Plot 1: Individual Gesture Data
figure;
subplot(1, 1, 1);
plot(data(:, 1)); % Plot the first channel of the sEMG data
ylabel('Amplitude')
xlabel('Number of Samples')
title('Eacch Gesture Used for Training According to the Training Protocol')
hold on;
% Add check on y-axis for gesture data ranges
line([1, 137], [1, 1], 'Color', 'r', 'LineWidth', 2); % Right gesture
line([138, 149], [1, 1], 'Color', 'g', 'LineWidth', 2); % Rest gesture
line([150, 282], [1, 1], 'Color', 'b', 'LineWidth', 2); % Left gesture
line([283, 294], [1, 1], 'Color', 'g', 'LineWidth', 2); % Rest gesture
line([295, 434], [1, 1], 'Color', 'b', 'LineWidth', 2); % Left gesture
line([435, 446], [1, 1], 'Color', 'g', 'LineWidth', 2); % Rest gesture
line([447, 576], [1, 1], 'Color', 'r', 'LineWidth', 2); % Right gesture
line([577, 588], [1, 1], 'Color', 'g', 'LineWidth', 2); % Rest gesture
line([589, 725], [1, 1], 'Color', 'm', 'LineWidth', 2); % Fist gesture
line([726, 737], [1, 1], 'Color', 'g', 'LineWidth', 2); % Rest gesture
line([738, 868], [1, 1], 'Color', 'k', 'LineWidth', 2); % Spread fingers gesture
line([869, 880], [1, 1], 'Color', 'g', 'LineWidth', 2); % Rest gesture
line([881, 1025], [1, 1], 'Color', 'k', 'LineWidth', 2); % Spread fingers gesture
line([1026, 1037], [1, 1], 'Color', 'g', 'LineWidth', 2); % Rest gesture
line([1038, 1165], [1, 1], 'Color', 'm', 'LineWidth', 2);% Fist gesture

% Add check lines
check_points = [137, 149, 282, 294, 434, 446, 576, 588, 725, 737, 868, 880, 1025, 1037, 1165];
y_values = ylim; % Get the automatic y-axis limits

for i = 1:numel(check_points)
    line([check_points(i), check_points(i)], y_values, 'Color', 'r');
    if i == 1
        text(39, y_values(2), 'Right Gesture', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'top', 'FontSize', 10);
    elseif i == 2
        text(138, y_values(1), 'Rest Gesture', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom', 'FontSize', 10);
    elseif i == 3
        text(180, y_values(2), 'Left Gesture', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'top', 'FontSize', 10);
    elseif i == 4
        text(283, y_values(1), 'Rest Gesture', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom', 'FontSize', 10);
    elseif i == 5
        text(320, y_values(2), 'Left Gesture', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'top', 'FontSize', 10);
    elseif i == 6
        text(435, y_values(1), 'Rest Gesture', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom', 'FontSize', 10);
    elseif i == 7
        text(470, y_values(2), 'Right Gesture', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'top', 'FontSize', 10);
    elseif i == 8
        text(577, y_values(1), 'Rest Gesture', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom', 'FontSize', 10);
    elseif i == 9
        text(615, y_values(2), 'Fist Gesture', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'top', 'FontSize', 10);
    elseif i == 10
        text(726, y_values(1), 'Rest Gesture', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom', 'FontSize', 10);
    elseif i == 11
        text(763, y_values(2), 'Spread Fingers', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'top', 'FontSize', 10);
    elseif i == 12
        text(869, y_values(1), 'Rest Gesture', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom', 'FontSize', 10);
    elseif i == 13
        text(895, y_values(2), 'Spread Fingers', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'top', 'FontSize', 10);
    elseif i == 14
        text(1026, y_values(1), 'Rest Gesture', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom', 'FontSize', 10);
    elseif i == 15
        text(1050, y_values(2), 'Fist Gesture', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'top', 'FontSize', 10);
    end
end