T = readtable('navigator_issues.csv');
load('navigator_issues.mat');

% Sort by overall importance
T_sorted = sortrows(T, "Overall", "descend");

figure('Color','w');
barh(T_sorted.Overall(1:10));
set(gca,'YTickLabel',T_sorted.Issue(1:10));
xlabel('% citing as top 3 issue');
title('Top 10 Voter Priorities (Navigator Research, Dec 2024)');
grid on;

figure('Color','w');
bar([T.Women_18_44, T.Men_18_44], 'grouped');
set(gca,'XTickLabel',T.Issue,'XTickLabelRotation',30);
ylabel('% citing as top 3 issue');
legend({'Women 18–44','Men 18–44'}, 'Location','northeastoutside');
title('Top Issues: Young Women vs Young Men');
grid on;

figure('Color','w');
bar([T.Women_18_44, T.Women_45_64, T.Women_65_plus, ...
     T.Men_18_44, T.Men_45_64, T.Men_65_plus], 'grouped');
set(gca,'XTickLabel',T.Issue,'XTickLabelRotation',30);
ylabel('% citing as top 3 issue');
legend({'Women 18–44','Women 45–64','Women 65+','Men 18–44','Men 45–64','Men 65+'}, ...
       'Location','northeastoutside');
title('Top Issues by Gender and Age Group');
grid on;

% Extract numeric matrix and labels
M = [T.Women_18_44, T.Women_45_64, T.Women_65_plus, ...
     T.Men_18_44, T.Men_45_64, T.Men_65_plus];
groups = {'Women 18–44','Women 45–64','Women 65+','Men 18–44','Men 45–64','Men 65+'};

figure('Color','w');
h = heatmap(groups, T.Issue, M, 'Colormap', parula);
h.Title = 'Top 3 Issue Importance by Group';
h.XLabel = 'Demographic Group';
h.YLabel = 'Issue';

% Difference between men and women ages 18–44
T.Diff_Young = T.Men_18_44 - T.Women_18_44;

figure('Color','w');
barh(T.Diff_Young);
set(gca,'YTickLabel',T.Issue);
xlabel('Difference (Men - Women, 18–44)');
title('Gender Gap in Issue Importance (Young Voters)');
grid on;
