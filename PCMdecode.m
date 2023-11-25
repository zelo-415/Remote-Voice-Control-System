function renewal  = PCMdecode(code,max)
    %%% input
    % x: 信道译码后的结果
    % max: 语音信号量化后的最大值
    %%% output
    % renewal: PCM译码后的恢复信号

    code = reshape(code',8,length(code)/8)';
    l = size(code,1);   % length of 1 entry
    a = [0,16,32,64,128,256,512,1024];
    b = [1 1 2 4 8 16 32 64];
    c = [0 1.5:15.5];
    count = 0;
    for i = 1:l
        sign = code(i,1);
        t = bin2dec(num2str(code(i,(2:4)))) + 1;
        y = bin2dec(num2str(code(i,(5:8))));
        if y == 0
            k(i) = a(t)/2048;
        else
            k(i) = (a(t)+b(t)*c(y))/2048;
        end
        if sign == 0
            renewal(i) = -k(i);
            count = count+1;
        else
            renewal(i) = k(i);
        end
    end
    renewal = renewal*max;
end