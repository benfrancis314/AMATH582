% Change from _car to _ski and v.v. if switch vids
% vidObj = VideoReader('ski_drop_low.mp4');
vidObj = VideoReader('monte_carlo_low.mp4');

video = read(vidObj);
numFrames = get(vidObj,'NumFrames');
duration = get(vidObj,'Duration');

vid_mat = [];
for j=1:numFrames
    vid_mat(:,j) = double(reshape(rgb2gray(video(:,:,:,j)), [], 1));
end
