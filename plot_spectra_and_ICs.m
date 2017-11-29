
% CHANNEL SPECTRA
figure; pop_spectopo(EEG, 1, [0  240000], 'EEG' , 'freq', [6 10 22], 'freqrange',[2 45],'electrodes','off');

% IC SPECTRA
figure; pop_spectopo(EEG, 0, [0  240000], 'EEG' , 'freq', [10], 'plotchan', 0, 'icacomps', [1:length(EEG.icachansind)], 'nicamaps', 5, 'freqrange',[2 45],'electrodes','off');

% IC maps 
pop_selectcomps(EEG, [1:length(EEG.icachansind)] );