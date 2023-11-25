function [decData] = channel_decode(encData, genpoly, trt, n, k)
    %%% input
    % encData: 通过信道后的信号
    % genpoly: 生成多项式
    % trt: syndrome decoding table
    % n: 编码长度
    % k: 信息长度
    %%% output:
    % decData: 循环码译码结果

    decData = decode(encData,n,k,'cyclic/binary',genpoly,trt);
    decData = reshape(decData, 1, []);
end