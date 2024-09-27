function [freq, imp] = readImpedanceData(filename)
    % A function which reads in the data from the impedance analyser and
    % transforms it to a reasonable output. The input is the filenames, and
    % the output is the frequency array and the complex impedance

    % read in raw data
    data = readmatrix(filename);

    % know that there are nans in the middle, find them
    nanIndex = find(isnan(data(:,1))); 

    freq = data(1:(nanIndex(1)-1), 1);
    amplitude = data(1:(nanIndex(1)-1), 2);
    phase = data(nanIndex(end)+1:end, 2);

    imp = amplitude.*exp( deg2rad(phase)*1i );
end