clc;
clear;

% part1：语音信号采集
[cmdrecord,fs] = cmdgather();
figure(1);
plot(cmdrecord);
title("原始语音信号采样");
grid on;

% part2：ADC & 信源编码
% PCM: A律13折线
max_ori = max(abs(cmdrecord));
pcm_encode = PCMcoding(cmdrecord);
figure(3);
plot(pcm_encode);
title("PCM信源编码序列");
grid on;

% part3：信道编码
% 循环码
n = 7;
k = 4;
[channel_in, genpoly, trt] = channel_encode(pcm_encode, n, k);

% part4: BPSK调制
% qpsk_in = bi2de((reshape(channel_in, 2, []))');
awgn_in = pskmod(channel_in, 2);

% part5: 高斯白噪声信道
SNR = 3;
awgn_out = awgn(awgn_in, SNR);

% part6: BPSK解调
channel_out = pskdemod(awgn_out, 2);
% channel_out = reshape(de2bi(qpsk_out,2), 1, []);
% channel_out=reshape(de2bi(qpsk_out,2)',1,length(qpsk_out)*2);

% part7: 信道译码
[cyc_decode] = channel_decode(channel_out, genpoly, trt, n, k);
numerr = biterr(pcm_encode,cyc_decode); % 验证循环码失真

% part8: PCM译码 & DAC
pcm_decode = PCMdecode(cyc_decode,max_ori);
figure(4);
plot(pcm_decode);
title("PCM译码后序列");
grid on;
% 计算失真度
da=0; 
for i=1:fs
    dc=(cmdrecord(i)-pcm_decode(i))^2/fs;
    da=da+dc;
end
fprintf('失真度是：%.6f\n',da);
% 时域和频域的比较
compare(cmdrecord, pcm_decode', fs);

% part9: 语音识别
control_signal = recognize(pcm_decode, fs);

% part10: 控制系统
test_control_sig = [1, 2, 3, 3, 4, 1, 5, 3, 2, 1, 3, 1, 1, 4];
start_point = [0 0];    % 初始位置为原点
start_direction = 1;    % 初始方向为向上
mov(test_control_sig, start_point, start_direction);