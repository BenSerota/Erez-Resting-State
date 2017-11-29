% General frame:
% 1. erase time
% 2. erase elec #65
% 3. create study

experiment_info
%global expinfo

%RS_erase 
create_sets
load_sets
% locate_dipoles_dipfit_mni_group

% fprintf('Time to look at ICs') 
% pause

create_study
% create_clusters

% per set:
plot_spectra_and_ICs