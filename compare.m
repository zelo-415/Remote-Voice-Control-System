function compare(original, transmitted, fs)
    figure;
    subplot(2,1,1);
    plot(original, 'b');
    title('原始语音信号幅度谱');
    xlabel('t');ylabel('amplitude');
    subplot(2,1,2);
    plot(transmitted, 'r');
    title('传输后语音信号幅度谱');
    xlabel('t');ylabel('amplitude');

    figure;
    fft_cmd = fft(original, fs);
    f = fs*(0:fs/2-1)/fs;
    subplot(2,1,1);
    plot(f, abs(fft_cmd(1:fs/2)), 'b');
    title('原始语音信号频谱');
    xlabel('frequency(Hz)');ylabel('amplitude');
    fft_signal = fft(transmitted, fs);
    f = fs*(0:fs/2-1)/fs;
    subplot(2,1,2);
    plot(f, abs(fft_signal(1:fs/2)), 'r');
    title('传输后语音信号频谱');
    xlabel('frequency(Hz)');ylabel('amplitude');
end