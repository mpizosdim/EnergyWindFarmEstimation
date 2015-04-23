function plot(obj)
figure
bar([obj.windTurbine(:).Energy])
grid on
xlabel('Number of Wind Turbine')
ylabel('Energy')

