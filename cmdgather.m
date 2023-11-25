function [cmdrecord,fs] = cmdgather()
    %%% input

    %%% output
    % cmd: 麦克风输入/直接读取的语音命令
    % fs: 采样频率

    Fs = 8000;
    myVoice = audiorecorder(Fs,8,1);
    
%     Define callbacks to show when
%     recording starts and completes.
    myVoice.StartFcn = 'disp(''Start speaking.'')';
    recordblocking(myVoice, 3);
    disp('End of recording.');
    play(myVoice);
%     get the command record
    cmdrecord = getaudiodata(myVoice);
    audiowrite('cmd.wav', cmdrecord, Fs);
    [cmdrecord, fs] = audioread('cmd.wav');
end