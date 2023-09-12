classdef dataprocessing < handle
    properties
        windowsize = 200; % ms
        interval = 100; % ms
        nsamples_interval; % number of samples in one interval (e.g. 40 samples in default setting)
        nsamples_window; % number of samples in one window (e.g. 200 samples in default setting)
    end
    
    properties (SetAccess = private)
        updatefreq; % Hz - frequency of updating new estimation to interface
        initial_buffer; % at t=0, buffer is required to extract data with windowsize
        samplerate; % sampling rate
    end
    
    properties (Access = private)
        meanval; % mean of training samples
        stdval; % standard deviation of training samples
        trainflag = false; % were mean and std of training samples calculated?
    end
    
    methods
        function obj = dataprocessing(samplerate)
            obj.updatefreq = 1 / (obj.interval / 1000); % set to same length as interval
            obj.nsamples_window = round((obj.windowsize / 1000) * samplerate);
            obj.nsamples_interval = round((obj.interval / 1000) * samplerate);
            obj.initial_buffer = obj.nsamples_window - obj.nsamples_interval;
            obj.samplerate = samplerate;
        end
        
        function feature = extractfeature(obj, rawdata, feat)
            feature = [];
            
            % Plot raw data
            figure;
            subplot(2, 1, 1);
            plot(rawdata);
            title('Raw Data');
            xlabel('Sample');
            ylabel('Amplitude');
            ylim([-1 1]); % Adjust the y-axis limits if needed
            
            rawdata = obj.zscore_normalize(rawdata);
            
            % Plot normalized data
            subplot(2, 1, 2);
            plot(rawdata);
            title('Normalized Data');
            xlabel('Sample');
            ylabel('Amplitude');
            ylim([-3 3]); % Adjust the y-axis limits if needed
            
            switch feat
                case 'RMS'
                    for ind = 1:obj.nsamples_interval:size(rawdata, 1) - obj.nsamples_window + 1
                        % Calculate RMS feature
                        window = rawdata(ind:ind+obj.nsamples_window-1, :);
                        rms_feature = sqrt(mean(window.^2, 1));
                        
                        % Plot RMS feature
                        figure;
                        plot(rms_feature);
                        title('RMS Feature');
                        xlabel('Window');
                        ylabel('Amplitude');
                        ylim([0 1]); % Adjust the y-axis limits if needed
                        
                        feature = [feature; rms_feature];
                    end
            end
        end
    end
    
    methods (Static)
        function normalized = zscore_normalize(data)
            meanval = mean(data, 1);
            stdval = std(data, 0, 1);
            normalized = (data - meanval) ./ stdval;
        end
    end
end
%% old class
% classdef dataprocessing < handle
%     properties
%         windowsize = 200; % ms
%         interval = 100; % ms
%         nsamples_interval; % number of samples in one interval (e.g. 40 samples in default setting)
%        nsamples_window; % number of samples in one window (e.g. 200 samples in default setting)
%         
%     end
%     properties (SetAccess = private)
%         updatefreq; % Hz - frequency of updating new estimation to interface
%         initial_buffer; % at t=0, buffer is required to extract data with windowsize
%         samplerate; % sampling rate
%     end
%     properties (Access = private)
%         meanval; % mean of training samples
%         stdval; % standard deviation of training samples
%         trainflag = false; % were mean and std of training samples calculated?
%     end
%     methods
%         function obj = dataprocessing(samplerate)
%             obj.updatefreq = 1/(obj.interval/1000); % set to same length as interval
%             obj.nsamples_window = (obj.windowsize/1000)*samplerate;
%              obj.nsamples_interval = (obj.interval/1000)*samplerate;
%             obj.initial_buffer = obj.nsamples_window - obj.nsamples_interval;
%             obj.samplerate = samplerate;
%         end
%         
%         function feature = extractfeature(obj,rawdata,feat) % extracting features
%             feature = [];
%             rawdata = obj.zscore_normalize(obj,rawdata);
%             switch feat
%                 % may add more types of feature
%                 case 'RMS'
%                     for ind = 0:obj.nsamples_interval:size(rawdata,1)-obj.nsamples_window+1
%                         feature = [feature;...
%                         sqrt(mean(rawdata(ind+1:ind+obj.nsamples_window-1,:).^2,1))]; % get the RMS feature with normalization
%                       
%                     end
%             end
%         end
%     end
%     methods (Static)
%         function normalized = zscore_normalize(obj,data)
%             if ~(obj.trainflag)
%                 obj.meanval = mean(data,1); % get a mean with normalization
%                 obj.stdval = std(data,0,1); % get a moving standard deviation
%                 obj.trainflag = true;
%             end
%             normalized = (data-obj.meanval)./obj.stdval;
%         end
%     end
% end