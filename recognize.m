function control_signal = recognize(code, fs)
    forward_o = audioread("前进.wav",'double');
    forward_o(:,1) = forward_o(:,1)/max(abs(forward_o(:,1))); % normalization
    for i = 1:length(forward_o)
        if forward_o(i,1) > 0.2
            forward(1:3*fs) = forward_o(i:i+3*fs-1,1);
            break;
        end
    end

    backward_o = audioread("后退.wav",'double');
    backward_o(:,1) = backward_o(:,1)/max(abs(backward_o(:,1))); % normalization
    for i = 1:length(backward_o)
        if backward_o(i,1) > 0.2
            backward(1:3*fs) = backward_o(i:i+3*fs-1,1);
            break;
        end
    end

    left_o = audioread("左转.wav",'double');
    left_o(:,1) = left_o(:,1)/max(abs(left_o(:,1))); % normalization
    for i = 1:length(left_o)
        if left_o(i,1) > 0.2
            left(1:3*fs) = left_o(i:i+3*fs-1,1);
            break;
        end
    end

    right_o = audioread("右转.wav",'double');
    right_o(:,1) = right_o(:,1)/max(abs(right_o(:,1))); % normalization
    for i = 1:length(right_o)
        if right_o(i,1) > 0.2
            right(1:3*fs) = right_o(i:i+3*fs-1,1);
            break;
        end
    end

    stop_o = audioread("停止.wav",'double');
    stop_o(:,1) = stop_o(:,1)/max(abs(stop_o(:,1))); % normalization
    for i = 1:length(stop_o)
        if stop_o(i,1) > 0.2
            stop(1:3*fs) = stop_o(i:i+3*fs-1,1);
            break;
        end
    end

    % MFCC 计算
    y(:,:,1) = melcepst(forward, fs);
    y(:,:,2) = melcepst(backward, fs);
    y(:,:,3) = melcepst(left,fs);
    y(:,:,4) = melcepst(right,fs);
    y(:,:,5) = melcepst(stop, fs);
    yours = melcepst(code, fs);
    
    % 比对
    control_signal = 1;
    min_dist = dtw(y(:,:,1), yours);
    for i = 1:5
        dist = dtw(y(:,:,i), yours);
        if dist < min_dist
            min_dist = dist;
            control_signal = i;
        end
    end
end