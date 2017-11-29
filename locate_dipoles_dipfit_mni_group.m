
for i = 1:12
    
    % choose set
    if i == 1
        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, i,'retrieve',i,'study',0); 
    else
        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, i-1,'retrieve',i,'study',0); 
    end
    
    % use MNI model, wrap around head
    EEG = pop_dipfit_settings( EEG, ...
        'hdmfile','C:\\Program Files\\MATLAB\\R2016b\\eeglab15\\plugins\\dipfit2.3\\standard_BEM\\standard_vol.mat',...
        'coordformat','MNI','mrifile','C:\\Program Files\\MATLAB\\R2016b\\eeglab15\\plugins\\dipfit2.3\\standard_BEM\\standard_mri.mat',...
        'chanfile','C:\\Program Files\\MATLAB\\R2016b\\eeglab15\\plugins\\dipfit2.3\\standard_BEM\\elec\\standard_1005.elc','coord_transform',...
        [0.70139 -15.5033 2.167 0.079955 0.0023044 -1.573 1.1708 1.0622 1.1523] ,'chansel',[1:EEG.nbchan] );
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    
    % Autofit dipoles
    EEG = pop_multifit(EEG, [1:EEG.nbchan] ,'threshold',100,'rmout','on','dipplot','on','plotopt',{'normlen' 'on'});
%     EEG = pop_multifit(EEG, [1:64] ,'threshold',100,'rmout','on','dipoles',2,'dipplot','on','plotopt',{'normlen' 'on'});
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    
    %save
    EEG = eeg_checkset( EEG );
    EEG = pop_saveset( EEG, 'savemode','resave');
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

end