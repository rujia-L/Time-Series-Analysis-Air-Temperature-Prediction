function [acf_est,pacf_est] = acfs(data, noLags, titleStr, signLvl)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if nargin<4
    signLvl = 0.05;
end

figure
subplot(311)
acf_est = acf( data, noLags, signLvl, 1 );
title( sprintf('ACF (%s)',titleStr))
subplot(312)
pacf_est = pacf( data, noLags, signLvl, 1 );
title( sprintf('PACF (%s)',titleStr))
subplot(313)
normplot(data)
title(sprintf('NORMPLOT(%s)',titleStr))
end