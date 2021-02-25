load cam1_1.mat; load cam1_2.mat; load cam1_3.mat; load cam1_4.mat; 
load cam2_1.mat; load cam2_2.mat; load cam2_3.mat; load cam2_4.mat; 
load cam3_1.mat; load cam3_2.mat; load cam3_3.mat; load cam3_4.mat;
left_edge = 200; right_edge = 525; top_edge = 450; bottom_edge = 25; filter = 230; % Default unless specified
[height, width, rgb, num_frames] = size(vidFrames1_1);
coord_list_x_1_1 = []; coord_list_x_1_2 = []; coord_list_x_1_3 = []; coord_list_x_1_4 = [];  
coord_list_y_1_1 = []; coord_list_y_1_2 = []; coord_list_y_1_3 = []; coord_list_y_1_4 = []; 
coord_list_x_2_1 = []; coord_list_x_2_2 = []; coord_list_x_2_3 = []; coord_list_x_2_4 = []; 
coord_list_y_2_1 = []; coord_list_y_2_2 = []; coord_list_y_2_3 = []; coord_list_y_2_4 = []; 
coord_list_x_3_1 = []; coord_list_x_3_2 = []; coord_list_x_3_3 = []; coord_list_x_3_4 = []; 
coord_list_y_3_1 = []; coord_list_y_3_2 = []; coord_list_y_3_3 = []; coord_list_y_3_4 = []; 
for t=1:num_frames
    % VID 1_1
    raw_vid=vidFrames1_1(:,:,:,t); proc_vid = flipud(double(rgb2gray(raw_vid)));
    coord_pool_x = []; coord_pool_y = [];
    for h=1:height
        for w=1:width
            if (proc_vid(h,w) < filter) || (w  < left_edge) ||...
                    (w  > right_edge) || (h  > top_edge) || (h  < bottom_edge)
                proc_vid(h,w) = 0;
            else coord_pool_x = [coord_pool_x; w];coord_pool_y = [coord_pool_y; h]; 
            end
        end
    end
    coord_list_x_1_1 = [coord_list_x_1_1, mean(coord_pool_x)];
    coord_list_y_1_1 = [coord_list_y_1_1, mean(coord_pool_y)];
    % VID 1_2
    left_edge = 250; right_edge = 500; filter = 230; top_edge = 275; bottom_edge = 25;
    raw_vid=vidFrames1_2(:,:,:,t); proc_vid = flipud(double(rgb2gray(raw_vid)));
    coord_pool_x = []; coord_pool_y = [];
    for h=1:height
        for w=1:width
            if (proc_vid(h,w) < filter) || (w  < left_edge) ||...
                    (w  > right_edge) || (h  > top_edge) || (h  < bottom_edge)
                proc_vid(h,w) = 0;
            else 
                coord_pool_x = [coord_pool_x; w];coord_pool_y = [coord_pool_y; h];
            end
        end
    end
    coord_list_x_1_2 = [coord_list_x_1_2, mean(coord_pool_x)];
    coord_list_y_1_2 = [coord_list_y_1_2, mean(coord_pool_y)];
    % VID 1_3
    top_edge = 280;
    raw_vid=vidFrames1_3(:,:,:,t); proc_vid = flipud(double(rgb2gray(raw_vid))); coord_pool_x = []; coord_pool_y = [];
    for h=1:height
        for w=1:width
            if (proc_vid(h,w) < filter) || (w  < left_edge) ||...
                    (w  > right_edge) || (h  > top_edge) || (h  < bottom_edge)
                proc_vid(h,w) = 0;
            else 
                coord_pool_x = [coord_pool_x; w];coord_pool_y = [coord_pool_y; h];
            end
        end
    end
    coord_list_x_1_3 = [coord_list_x_1_3, mean(coord_pool_x)];
    coord_list_y_1_3 = [coord_list_y_1_3, mean(coord_pool_y)];
    % VID 1_4
    top_edge = 300;
    raw_vid=vidFrames1_4(:,:,:,t); proc_vid = flipud(double(rgb2gray(raw_vid))); coord_pool_x = []; coord_pool_y = [];
    for h=1:height
        for w=1:width
            if (proc_vid(h,w) < filter) || (w  < left_edge) ||...
                    (w  > right_edge) || (h  > top_edge) || (h  < bottom_edge)
                proc_vid(h,w) = 0;
            else 
                coord_pool_x = [coord_pool_x; w];
                coord_pool_y = [coord_pool_y; h];
            end
        end
    end
    coord_list_x_1_4 = [coord_list_x_1_4, mean(coord_pool_x)];
    coord_list_y_1_4 = [coord_list_y_1_4, mean(coord_pool_y)];
    % VID 2_1
    filter = 250;
    raw_vid=vidFrames2_1(:,:,:,t); proc_vid = flipud(double(rgb2gray(raw_vid)));
    coord_pool_x = []; coord_pool_y = [];
    for h=1:height
        for w=1:width
            if (proc_vid(h,w) < filter) || (w  < left_edge) ||...
                    (w  > right_edge) || (h  > top_edge) || (h  < bottom_edge)
                proc_vid(h,w) = 0;
            else 
                coord_pool_x = [coord_pool_x; w];
                coord_pool_y = [coord_pool_y; h];
            end
        end
    end
    coord_list_x_2_1 = [coord_list_x_2_1, mean(coord_pool_x)];
    coord_list_y_2_1 = [coord_list_y_2_1, mean(coord_pool_y)];
    % VID 2_2
    filter = 240;
    raw_vid=vidFrames2_2(:,:,:,t); proc_vid = flipud(double(rgb2gray(raw_vid))); 
    coord_pool_x = []; coord_pool_y = [];
    for h=1:height
        for w=1:width
            if (proc_vid(h,w) < filter) || (w  < left_edge) ||...
                    (w  > right_edge) || (h  > top_edge) || (h  < bottom_edge)
                proc_vid(h,w) = 0;
            else 
                coord_pool_x = [coord_pool_x; w];
                coord_pool_y = [coord_pool_y; h];
            end
        end
    end
    coord_list_x_2_2 = [coord_list_x_2_2, mean(coord_pool_x)];coord_list_y_2_2 = [coord_list_y_2_2, mean(coord_pool_y)];
    % VID 2_3
    top_edge = 300; filter = 240;
    raw_vid=vidFrames2_3(:,:,:,t); proc_vid = flipud(double(rgb2gray(raw_vid))); coord_pool_x = []; coord_pool_y = [];
    for h=1:height
        for w=1:width
            if (proc_vid(h,w) < filter) || (w  < left_edge) ||...
                    (w  > right_edge) || (h  > top_edge) || (h  < bottom_edge)
                proc_vid(h,w) = 0;
            else 
                coord_pool_x = [coord_pool_x; w];
                coord_pool_y = [coord_pool_y; h];
            end
        end
    end
    coord_list_x_2_3 = [coord_list_x_2_3, mean(coord_pool_x)];coord_list_y_2_3 = [coord_list_y_2_3, mean(coord_pool_y)];
    % VID 2_4
    filter = 245; top_edge = 400; left_edge = 210; bottom_edge = 100;
    raw_vid=vidFrames2_4(:,:,:,t); proc_vid = flipud(double(rgb2gray(raw_vid))); coord_pool_x = []; coord_pool_y = [];
    for h=1:height
        for w=1:width
            if (proc_vid(h,w) < filter) || (w  < left_edge) ||...
                    (w  > right_edge) || (h  > top_edge) || (h  < bottom_edge)
                proc_vid(h,w) = 0;
            else 
                coord_pool_x = [coord_pool_x; w];
                coord_pool_y = [coord_pool_y; h];
            end
        end
    end
    coord_list_x_2_4 = [coord_list_x_2_4, mean(coord_pool_x)];coord_list_y_2_4 = [coord_list_y_2_4, mean(coord_pool_y)];
    % VID 3_1
    raw_vid=vidFrames3_1(:,:,:,t); proc_vid = flipud(double(rgb2gray(raw_vid))); coord_pool_x = []; coord_pool_y = [];
    for h=1:height
        for w=1:width
            if (proc_vid(h,w) < filter) || (w  < left_edge) ||...
                    (w  > right_edge) || (h  > top_edge) || (h  < bottom_edge)
                proc_vid(h,w) = 0;
            else 
                coord_pool_x = [coord_pool_x; w];
                coord_pool_y = [coord_pool_y; h];
            end
        end
    end
    coord_list_x_3_1 = [coord_list_x_3_1, mean(coord_pool_x)];coord_list_y_3_1 = [coord_list_y_3_1, mean(coord_pool_y)];
    % VID 3_2
    filter = 230; left_edge = 250;
    raw_vid=vidFrames3_2(:,:,:,t); proc_vid = flipud(double(rgb2gray(raw_vid))); coord_pool_x = []; coord_pool_y = [];
    for h=1:height
        for w=1:width
            if (proc_vid(h,w) < filter) || (w  < left_edge) ||...
                    (w  > right_edge) || (h  > top_edge) || (h  < bottom_edge)
                proc_vid(h,w) = 0;
            else 
                coord_pool_x = [coord_pool_x; w];
                coord_pool_y = [coord_pool_y; h];
            end
        end
    end
    coord_list_x_3_2 = [coord_list_x_3_2, mean(coord_pool_x)];coord_list_y_3_2 = [coord_list_y_3_2, mean(coord_pool_y)];
    % VID 3_3
    raw_vid=vidFrames3_3(:,:,:,t); proc_vid = flipud(double(rgb2gray(raw_vid))); coord_pool_x = []; coord_pool_y = [];
    for h=1:height
        for w=1:width
            if (proc_vid(h,w) < filter) || (w  < left_edge) ||...
                    (w  > right_edge) || (h  > top_edge) || (h  < bottom_edge)
                proc_vid(h,w) = 0;
            else 
                coord_pool_x = [coord_pool_x; w];
                coord_pool_y = [coord_pool_y; h];
            end
        end
    end
    coord_list_x_3_3 = [coord_list_x_3_3, mean(coord_pool_x)];
    coord_list_y_3_3 = [coord_list_y_3_3, mean(coord_pool_y)];
    % VID 3_4
    bottom_edge = 115;
    raw_vid=vidFrames3_4(:,:,:,t); proc_vid = flipud(double(rgb2gray(raw_vid))); coord_pool_x = []; coord_pool_y = [];
    for h=1:height
        for w=1:width
            if (proc_vid(h,w) < filter) || (w  < left_edge) ||...
                    (w  > right_edge) || (h  > top_edge) || (h  < bottom_edge)
                proc_vid(h,w) = 0;
            else 
                coord_pool_x = [coord_pool_x; w];coord_pool_y = [coord_pool_y; h];
            end
        end
    end
    coord_list_x_3_4 = [coord_list_x_3_4, mean(coord_pool_x)];
    coord_list_y_3_4 = [coord_list_y_3_4, mean(coord_pool_y)];

    pcolor(proc_vid), shading interp, colormap(gray);
    yline(top_edge,'r','LineWidth',2); yline(bottom_edge,'r','LineWidth',2);
    xline(left_edge,'r','LineWidth',2); xline(right_edge,'r','LineWidth',2);hold on;
    plot(mean(coord_pool_x),mean(coord_pool_y),'c*','LineWidth',150);
    title('Video Coordinate Extraction, Experiment 1, t=1','FontSize',24);
    xlabel('Width','FontSize',16); ylabel('Height','FontSize',16); drawnow   
end
X1 = [smoothdata(coord_list_x_1_1); smoothdata(coord_list_y_1_1); ...
        smoothdata(coord_list_x_2_1); smoothdata(coord_list_y_2_1); ... 
        smoothdata(coord_list_x_3_1); smoothdata(coord_list_y_3_1)];
X2 = [smoothdata(coord_list_x_1_2); smoothdata(coord_list_y_1_2); ...
        smoothdata(coord_list_x_2_2); smoothdata(coord_list_y_2_2); ... 
        smoothdata(coord_list_x_3_2); smoothdata(coord_list_y_3_2)];
X3 = [smoothdata(coord_list_x_1_3); smoothdata(coord_list_y_1_3); ...
        smoothdata(coord_list_x_2_3); smoothdata(coord_list_y_2_3); ... 
        smoothdata(coord_list_x_3_3); smoothdata(coord_list_y_3_3)];
X4 = [smoothdata(coord_list_x_1_4); smoothdata(coord_list_y_1_4); ...
        smoothdata(coord_list_x_2_4); smoothdata(coord_list_y_2_4); ... 
        smoothdata(coord_list_x_3_4); smoothdata(coord_list_y_3_4)];
