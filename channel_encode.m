function [encData,genpoly,trt] = channel_encode(cmd,n,k)
    %%% input
    % cmd: 信源编码后的结果
    % n: 编码长度
    % k: 信息长度
    %%% output:
    % encData: 线性分组码编码结果
    % genpoly: 生成多项式
    % trt: syndrome decoding table

    cmd = reshape(cmd,length(cmd)/k,k);
    genpoly = cyclpoly(n,k);
    parmat = cyclgen(n,genpoly);
    trt = syndtable(parmat);
    encData = encode(cmd,n,k,'cyclic/binary',genpoly);
end