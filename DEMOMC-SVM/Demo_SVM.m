%% Start
clear all; close all; clc; clear cache;
DaqObj = MyoMex; % create a MYO object
DaqObj.myoData.rateIMU;
pause (2);
%% sampleRate
% sampleRate = DaqObj.myoData.rateIMU; % sample rate
sampleRate = 50;
%% Data processing object
ProcessObj = dataprocessing(sampleRate);
ProcessObj.nsamples_interval = round((ProcessObj.interval/1000)*(DaqObj.myoData.rateIMU));
ProcessObj.nsamples_window = round((ProcessObj.windowsize/1000)*(DaqObj.myoData.rateIMU));
%% SVM model loading
disp('Getting Labels . . .'); 
load trainlabel_NEW.mat % load training labels 
train_l = train_labels;
clear train_labels;
for j = 1:length(train_l)
    train_labels(j) = categorical({num2str(train_l(j,:))});
end
train_labels = train_labels';
disp('Loading Multiclass SVM-ECOC Machine Learning Algorithm . . . .'); 
 % loading SVM Machine learning ECOC Algorithm accuracy is 99.05% cursor control is significant 
load model_NEW.mat
 %load modelKNN.mat % accuracy is 99.74 %
%% Test
disp('Starting testing phase . . .')
ViewObj = interface_new1; % view cursor in the interface of LAPTOP screen
timewatch = tic();
prevest = [0 0];
Window = [];
%% While Loop for
while toc(timewatch) <60 % run for 120 seconds
    temp_data = (DaqObj.myoData.emg_log(end,:));
    posedata = [DaqObj.myoData.pose_rest(end,:) DaqObj.myoData.pose_fist(end,:) DaqObj.myoData.pose_wave_in(end,:) DaqObj.myoData.pose_wave_out(end,:) DaqObj.myoData.pose_fingers_spread(end,:)];
    if length(Window) > 2
        Window(1:size(temp_data,1),:) = []; % remove first nsamples_interval
    end
    Window = [Window ; temp_data]; % update to keep the size as nsamples_window
    testvec = [Window posedata];
    est = predict(model,testvec);
    estimation = str2num(string(est));
    lbl = [0 0];
    ViewObj.updatedata(10*estimation,lbl);
end
%% Cross-validate Mdl using 10-fold cross-validation.
% cvmodel= crossval(model);
%% CVMdl is a ClassificationPartitionedECOC cross-validated ECOC classifier.
% genError = kfoldLoss(cvmodel);
%% confusion matrix
%C = confusionmat(est,train_labels(1:length(est),:));
%% accuracy
%Accuracy = sum(est==train_labels(1:length(est)))/numel(est);