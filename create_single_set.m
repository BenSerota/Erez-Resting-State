
clc

% i = chosen set
i = 8;

% 
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

load gTec_Chanlocs.mat


% creates SETs
EEG = pop_importdata('dataformat','matlab','nbchan',0,'data',['C:\\Users\\cognitive\\Desktop\\Ben\\EC\\EC_no_time\\RS' num2str(i) '_no_time.mat'],'srate',256,'pnts',0,'xmin',0) ;
%['/Users/admin/BGU Drive/Graduate_Studies/CPL/EEG_Data/Erez Resting State/EC_no_time/RS' 
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname',num2str(i),'gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_saveset( EEG, 'filename',['RS_EC_SS' num2str(i) '.set'],'filepath','C:\\Users\\cognitive\\Desktop\\Ben\\EC\\Sets');
% '/Users/admin/BGU Drive/Graduate_Studies/CPL/EEG_Data/Erez Resting State/EC_no_time/');
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);


% assign electrode locations
EEG.chanlocs = ChanLocs;
EEG = eeg_checkset( EEG );

%Reject bad channels
%automatic (statistically, above/below 5 Z-scores deviations)
EEG = pop_rejchan(EEG, 'elec',[1: EEG.nbchan] ,'threshold',5,'norm','on','measure','kurt');

% subj-specific: 
% if i == 1
%     EEG = pop_select( EEG, 'nochannel',25);
%     [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','saveold','C:\\Users\\cognitive\\Desktop\\Ben\\EC\\Sets\\RS_EC_S1.set','gui','off');
%     '/Users/admin/BGU Drive/Graduate_Studies/CPL/EEG_Data/Erez Resting State/EC_no_time/RS_EC_S1.set','gui','off'); 
%     EEG = eeg_checkset( EEG );
% end


% Re-reference (average)
EEG = pop_reref( EEG, []); 
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname',['SS' num2str(i)],'overwrite','on','gui','off'); 
EEG = eeg_checkset( EEG );

% remove drift (HI-pass) above 0.5Hz
EEG = pop_eegfiltnew(EEG, [],0.5,1690,1,[],0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','saveold',['C:\\Users\\cognitive\\Desktop\\Ben\\EC\\Sets\\RS_EC_SS' num2str(i) '.set'],'gui','off'); 
    % '/Users/admin/BGU Drive/Graduate_Studies/CPL/EEG_Data/Erez Resting State/EC_no_time/

% % CLEANLINE @50Hz
% EEG = pop_cleanline(EEG, 'bandwidth',2,'chanlist',[1:EEG.nbchan] ,'computepower',1,'linefreqs',[50 100] ,'normSpectrum',0,'p',0.01,'pad',2,'plotfigures',0,'scanforlines',1,'sigtype','Channels','tau',100,'verb',1,'winsize',4,'winstep',1);
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, i,'overwrite','on','saveold',['C:\\Users\\cognitive\\Desktop\\Ben\\EC\\Sets\\RS_EC_S' num2str(i) '.set'],'gui','off'); 
% EEG = eeg_checkset( EEG );

eeglab redraw

% Bandpass
EEG = pop_eegfiltnew(EEG, 0.5,45,1690,0,[],1);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','saveold',['C:\\Users\\cognitive\\Desktop\\Ben\\EC\\Sets\\RS_EC_SS' num2str(i) '.set'],'gui','off'); 
EEG = eeg_checkset( EEG );

% ICA
EEG = pop_runica(EEG, 'extended',1,'interrupt','on');
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
EEG = eeg_checkset( EEG );

eeglab redraw

% locate dipoles MNI
% locate_dipoles_dipfit_mni_single
% 
% eeglab redraw

