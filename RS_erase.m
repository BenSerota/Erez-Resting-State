% erasing 'time' variable in structures, and elec #65

for i = 1:12
    
load (['RestingState_ec' num2str(i) '.mat'])
rsEEGec = rsEEGec.Channels;
rsEEGec(65,:) = [];
save (['RS' num2str(i) '_no_time'], 'rsEEGec')
end

