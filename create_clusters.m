
[STUDY ALLEEG] = std_editset( STUDY, ALLEEG, 'commands',...
    {{'inbrain' 'on' 'dipselect' 0.15}},'updatedat','on','savedat','on','rmclust','on' );
[STUDY ALLEEG] = std_checkset(STUDY, ALLEEG);
CURRENTSTUDY = 1; EEG = ALLEEG; CURRENTSET = [1:length(EEG)];

[STUDY ALLEEG] = std_preclust(STUDY, ALLEEG, 1,{'dipoles' 'weight' 1});

STUDY = std_topoplot(STUDY,ALLEEG,'clusters',[2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63], 'design', 1);
STUDY = std_dipplot(STUDY,ALLEEG,'clusters',[2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63], 'design', 1);
STUDY = pop_dipparams(STUDY, 'projimg','on','projlines','on','density','on');
[STUDY] = pop_clust(STUDY, ALLEEG, 'algorithm','kmeans','clus_num',  61 , 'outliers',  3 );

eeglab redraw 