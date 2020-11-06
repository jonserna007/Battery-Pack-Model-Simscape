% Code to plot simulation results from Battery_Pack_Thermal_Management
%% Plot Description:
%
% Copyright 2020 The MathWorks, Inc.

% Generate new simulation results if they don't exist or if they need to be updated
if ~exist('simlog_Battery_Pack_Thermal_Management', 'var') || ...
        pm_simlogNeedsUpdate(simlog_Battery_Pack_Thermal_Management) 
    sim('Battery_Pack_Thermal_Management')
end

% Reuse figure if it exists, else create new figure
if ~exist('h2_Battery_Pack_Thermal_Management', 'var') || ...
        ~isgraphics(h2_Battery_Pack_Thermal_Management, 'figure')
    h2_Battery_Pack_Thermal_Management = figure('Name', 'Battery_Pack_Thermal_Management');
end
figure(h2_Battery_Pack_Thermal_Management)
clf(h2_Battery_Pack_Thermal_Management)

% Get simulation results
sim_t    = simlog_Battery_Pack_Thermal_Management.Current_Source.i.series.time;
dc_curr  = simlog_Battery_Pack_Thermal_Management.Current_Source.i.series.values;
pump_pow = simlog_Battery_Pack_Thermal_Management.Power.P.series.values;

SOC1 = simlog_Battery_Pack_Thermal_Management.Battery_Pack.Module_1.outputCellSOC.series.values;
SOC2 = simlog_Battery_Pack_Thermal_Management.Battery_Pack.Module_2.outputCellSOC.series.values;
SOC3 = simlog_Battery_Pack_Thermal_Management.Battery_Pack.Module_3.outputCellSOC.series.values;
SOC4 = simlog_Battery_Pack_Thermal_Management.Battery_Pack.Module_4.outputCellSOC.series.values;
SOC5 = simlog_Battery_Pack_Thermal_Management.Battery_Pack.Module_5.outputCellSOC.series.values;
SOC6 = simlog_Battery_Pack_Thermal_Management.Battery_Pack.Module_6.outputCellSOC.series.values;
SOC7 = simlog_Battery_Pack_Thermal_Management.Battery_Pack.Module_7.outputCellSOC.series.values;
SOC8 = simlog_Battery_Pack_Thermal_Management.Battery_Pack.Module_8.outputCellSOC.series.values;

T1 = simlog_Battery_Pack_Thermal_Management.Battery_Pack.Module_1.outputCellTemp.series.values;
T2 = simlog_Battery_Pack_Thermal_Management.Battery_Pack.Module_2.outputCellTemp.series.values;
T3 = simlog_Battery_Pack_Thermal_Management.Battery_Pack.Module_3.outputCellTemp.series.values;
T4 = simlog_Battery_Pack_Thermal_Management.Battery_Pack.Module_4.outputCellTemp.series.values;
T5 = simlog_Battery_Pack_Thermal_Management.Battery_Pack.Module_5.outputCellTemp.series.values;
T6 = simlog_Battery_Pack_Thermal_Management.Battery_Pack.Module_6.outputCellTemp.series.values;
T7 = simlog_Battery_Pack_Thermal_Management.Battery_Pack.Module_7.outputCellTemp.series.values;
T8 = simlog_Battery_Pack_Thermal_Management.Battery_Pack.Module_8.outputCellTemp.series.values;


% Plot results
simlog_handles(1) = subplot(2, 1, 1);
gcah_t1 = plot(sim_t, T1, 'LineWidth', 1);
hold on
gcah_t2 = plot(sim_t, T2, 'LineWidth', 1);
gcah_t3 = plot(sim_t, T3, 'LineWidth', 1);
gcah_t4 = plot(sim_t, T4, 'LineWidth', 1);
gcah_t5 = plot(sim_t, T5, 'LineWidth', 1);
gcah_t6 = plot(sim_t, T6, 'LineWidth', 1);
gcah_t7 = plot(sim_t, T7, 'LineWidth', 1);
gcah_t8 = plot(sim_t, T8, 'LineWidth', 1);
hold off
grid on
title('Cell Temperature')
ylabel('Temperature (K)')
xlabel('Time (s)')
%
simlog_handles(2) = subplot(2, 1, 2);
gcah_soc1 = plot(sim_t, SOC1, 'LineWidth', 1);
hold on
gcah_soc2 = plot(sim_t, SOC2, 'LineWidth', 1);
gcah_soc3 = plot(sim_t, SOC3, 'LineWidth', 1);
gcah_soc4 = plot(sim_t, SOC4, 'LineWidth', 1);
gcah_soc5 = plot(sim_t, SOC5, 'LineWidth', 1);
gcah_soc6 = plot(sim_t, SOC6, 'LineWidth', 1);
gcah_soc7 = plot(sim_t, SOC7, 'LineWidth', 1);
gcah_soc8 = plot(sim_t, SOC8, 'LineWidth', 1);
hold off
grid on
title('Cell SOC')
ylabel('SOC (-)')
xlabel('Time (s)')
linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear sim_t pump_pow dc_curr T1 T2 T3 T4 T5 T6 T7 T8
clear SOC1 SOC2 SOC3 SOC4 SOC5 SOC6 SOC7 SOC8
clear simlog_handles