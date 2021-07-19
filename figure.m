 figure(1);
 semilogy(横坐标,纵坐标,'o（线型）','LineWidth',2线宽);
 legend('图上的字');
 hold on;

scatterplot(一个复数量) 

%画图注字
 if 条件
scatterplot(cos_map);
str_fre_offset=['频偏量=',num2str(frequency_deviation),'的情况下，发送信号的图','载波每一个周期产生的相位差=',num2str(ang*180/pi),'角度'];
title(str_fre_offset)
scatterplot(constellation_map_modulation_data)
str=['发送信号与噪声信号的比值=',num2str(snr),'输入信号的散点图'];
title(str)
end






