clc;
clear;

% -----------------------------------------------
file = importdata('PeakDepol.dat', '\t', 2);
ratio = file.data(:,1);
axon = file.data(:,2);
soma = file.data(:,3);
pdend = file.data(:,4);
ddend1 = file.data(:,5);
ddend2 = file.data(:,6);
clear file;

figure;
h1 = semilogx(ratio, axon, '-d', 'color', [1 0 0], 'LineWidth',3);
hold on;
h2 = semilogx(ratio, soma, '-o', 'color', [0 0 1], 'LineWidth',3);
h3 = semilogx(ratio, pdend, '-s', 'color', [0 0.65 0], 'LineWidth',3);
h4 = semilogx(ratio, ddend1, '-v', 'color', [1 0.65 0], 'LineWidth',3);

%xlim([0 5]);
%ylim([0 10]);

xlabel('Ratio R_a by R_e','FontName','Helvetica','FontSize',11,'FontWeight','bold');
ylabel('Peak Depolarization (mV)','FontName','Helvetica','FontSize',11,'FontWeight','bold');

box off;
set(gcf,'color','w');
set(gca,'FontName','Helvetica','FontSize',11);

legend_text = {'Axon', 'Soma', 'P\_dend', 'D\_dend'};
legend([h1 h2 h3 h4], legend_text);


% Better quality output ------------------
set(gcf,'color','w');
set(gca,'FontName','Helvetica','FontSize',11);

set(gcf, 'PaperPositionMode', 'auto');
print -depsc2 fig.eps

fixPSlinestyle('fig.eps', 'fig_fixed.eps');
% close;
% ----------------------------------------