classdef interface_new1 < handle
    
    properties
        interf_fig;
        interf_axis;
        interf_plot;
        interf_plot2;
        interf_text;
        interf_text2;
%         mydaq01= daq('ni');
%         mydaq02= daq('ni');  
    end
    methods
        function obj = interface_new1
%             Create a figure
            obj.interf_fig = figure('Position',[100 35 1100 600],'Name','Interface','NumberTitle','on');
            % Plot setting
            subplot(121);
            obj.interf_plot = plot(0,0,'.k','MarkerSize',25);
             lgd = legend('Hand Gesture Recognition');
             title(lgd,'SVM Based Hand Gesture Recognition')
             hold on
             obj.interf_text = text(0.2,-0.5,'\circ');
             s = obj.interf_text.FontSize;
             obj.interf_text.FontSize= 25;
            % Axis setting
            set(gca,'sortmethod','childorder')
            obj.interf_axis = gca;
             obj.interf_axis.Clipping = 'off';
             obj.interf_axis.XLim = [-5.1 5.1];
             obj.interf_axis.YLim = [-5.1 5.1];
             obj.interf_axis.XTick=[];
             obj.interf_axis.YTick=[];
             obj.interf_axis.XAxisLocation = 'origin';
             obj.interf_axis.YAxisLocation = 'origin';
             obj.interf_axis.DataAspectRatio = [1.1 1.1 1.1];
            axis tight manual;
            
            subplot(122);
            obj.interf_plot2 = plot(0,0,'.k','MarkerSize',25);
            legend('Gesture control Cursor for SVM Evaluation');
%              title(lgd,'Regression Algorithm');
             hold on
             obj.interf_text2 = text(0.2,-0.5,'\circ');
             s = obj.interf_text2.FontSize;
             obj.interf_text2.FontSize= 25;
             obj.interf_axis = gca;
             obj.interf_axis.Clipping = 'off';
             obj.interf_axis.XLim = [-5.1 5.1];
             obj.interf_axis.YLim = [-5.1 5.1];
             obj.interf_axis.XTick=[];
             obj.interf_axis.YTick=[];
             obj.interf_axis.XAxisLocation = 'origin';
             obj.interf_axis.YAxisLocation = 'origin';
             obj.interf_axis.DataAspectRatio = [1.1 1.1 1.1];
            axis tight manual;
%                 obj.mydaq01.addoutput('dev1', 'ao0', 'Voltage');
%                 obj.mydaq02.addoutput('dev1', 'ao1', 'Voltage');
%                 obj.mydaq01.addinput('dev1', 'ai0', 'Voltage');
        end
        
        
        function updatedata(obj,data,lbl)
            % Update current position
%             diff1 = abs(data(1) - prevdata(1));
%             diff2 = abs(data(2) - prevdata(2));

            if ((data(1)>0) && (data(2)==0))
                text_data='Right \rightarrow';
                if (obj.interf_plot.XData<=1)
                    set(obj.interf_plot(1),'xdata',data(1)+obj.interf_plot.XData,'ydata',obj.interf_plot.YData);
                end
%                     ao0_value = 2.5;
%                     ao1_value = 3.88;
%                     obj.mydaq01.write(ao0_value)
%                     obj.mydaq02.write(ao1_value)
            elseif ((data(1)<0) && (data(2)==0))
                text_data='Left \leftarrow';
                if (obj.interf_plot.XData>=-1)
                    set(obj.interf_plot(1),'xdata',data(1)+obj.interf_plot.XData,'ydata',obj.interf_plot.YData);
                end
%                     ao0_value = 2.5;
%                     ao1_value = 1.4;
%                     obj.mydaq01.write(ao0_value)
%                     obj.mydaq02.write(ao1_value)
            elseif ((data(1)==0) && (data(2)>0))
                text_data='Forward \uparrow';
                if (obj.interf_plot.YData)<=1
                    set(obj.interf_plot(1),'xdata',obj.interf_plot.XData,'ydata',data(2)+obj.interf_plot.YData);
                end
%                     ao0_value = 3.77;
%                     ao1_value = 2.5;
%                     obj.mydaq01.write(ao0_value)
%                     obj.mydaq02.write(ao1_value)
            elseif ((data(1)==0) && (data(2)<0))
                text_data='Reverse \downarrow';
                if (obj.interf_plot.YData)>=-1
                    set(obj.interf_plot(1),'xdata',obj.interf_plot.XData,'ydata',data(2)+obj.interf_plot.YData);
                end
%                     ao0_value = 1.25;
%                     ao1_value = 2.5;
%                     obj.mydaq01.write(ao0_value)
%                     obj.mydaq02.write(ao1_value)
            else
                text_data='Stop\circ';
                set(obj.interf_plot(1),'xdata',obj.interf_plot.XData,'ydata',obj.interf_plot.YData)
%                    ao0_value = 2.5;
%                    ao1_value = 2.5;
%                    obj.mydaq01.write(ao0_value)   
%                    obj.mydaq02.write(ao1_value)
            end
            
            if ((lbl(1)>0) && (lbl(2)==0))
                text_lbl='Right \rightarrow';
%                 if (obj.interf_plot.XData<=1)
                set(obj.interf_plot2(1),'xdata',lbl(1)+obj.interf_plot2.XData,'ydata',obj.interf_plot2.YData);
%                 end
            elseif ((lbl(1)<0) && (lbl(2)==0))
                text_lbl='Left \leftarrow';
                set(obj.interf_plot2(1),'xdata',lbl(1)+obj.interf_plot2.XData,'ydata',obj.interf_plot.YData);

            elseif ((lbl(1)==0) && (lbl(2)>0))
                text_lbl='Forward \uparrow';
                set(obj.interf_plot2(1),'xdata',obj.interf_plot2.XData,'ydata',lbl(2)+obj.interf_plot2.YData);

            elseif ((lbl(1)==0) && (lbl(2)<0))
                text_lbl='Reverse \downarrow';
                set(obj.interf_plot2(1),'xdata',obj.interf_plot2.XData,'ydata',lbl(2)+obj.interf_plot2.YData);
            else
                text_lbl='Stop\circ';
                set(obj.interf_plot2(1),'xdata',obj.interf_plot2.XData,'ydata',obj.interf_plot2.YData);
            end
            set(obj.interf_text2,'String',text_lbl);
            set(obj.interf_text,'String',text_data);
%             set(obj.interf_plot2(1),'xdata',data(1)+obj.interf_plot2.XData,'ydata',data(2)+obj.interf_plot2.YData)
%             set(obj.interf_plot(1),'xdata',lbl(1)+obj.interf_plot.XData,'ydata',lbl(2)+obj.interf_plot.YData)
            drawnow
        end  
    end
end