function code = PCMcoding(x)
    %%% input
    % x: 量化后的语音信号
    %%% output
    % code: PCM信源编码后的结果
    
    z = sign(x);
    max_x=max(abs(x));
    x = abs(x)/max_x;    % normalized
    Q = 2048*x;
    code = zeros(length(x),8);

    % 段落码
    for i = 1:length(x)
        if (Q(i)>=128) && (Q(i)<=2048)
            code(i,2) = 1;
        end
        if (Q(i)>=32) && (Q(i)<128) || (Q(i)>=512) && (Q(i)<=2048)
            code(i,3) = 1;
        end
        if ((Q(i)>=16) && (Q(i)<32)) || ((Q(i)>=64) && (Q(i)<128)) ||  ((Q(i)>=256) && (Q(i)<512)) || ((Q(i)>=1024) && (Q(i)<2048))
            code(i,4) = 1;
        end
    end
    
    N = zeros(length(x));
    for i = 1:length(x)
        N(i) = bin2dec(num2str(code(i,2:4)))+1; % 标记code在第几段
    end

    a = [0,16,32,64,128,256,512,1024];                 %量化间隔
    b = [1,1,2,4,8,16,32,64];                          %除以16，得到每段的最小量化间隔
    for i = 1:length(x)
        q = ceil((Q(i)-a(N(i)))/b(N(i)));
        if q == 0
            code(i,5:8) = [0,0,0,0];
        else
            k = num2str(dec2bin(q-1,4));    % 4用于控制位数
            code(i,5) = str2num(k(1));
            code(i,6) = str2num(k(2));
            code(i,7) = str2num(k(3));
            code(i,8) = str2num(k(4));
        end
        if z(i) > 0
            code(i,1) = 1;
        else
            code(i,1) = 0;
        end
    end
    code = reshape(code', 1, []);

    figure(3);
    plot(code);
end