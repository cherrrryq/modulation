fc = 7*10^7;
fs= 7*10^8; %fs ==20 *fc（波形为好看正弦余弦）
t= 0:1/fs:1/6;

sin_2 = sin(2*pi*(fc)*t);


%%%%%%%%%%%加频偏部分%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%加频偏%%%%%%%%%%%%%%%%%%
if use_deviation == 0   %不加频偏的载波
    if  use_rayleigh == 1  %加瑞利信道的载波
      for count_rayleigh =  1:length(t_data)
                  if mod(count_rayleigh,num)==0  %产生的原始数据为32000个，分成iq两列/2，在经过插值*8，一路为128000个
                          rayleigh_data = rand(1);  % 总数据32000个的每 1/4 处的sin 加一个sin（  +θ）
                   if rayleigh_data > 0.4           
                      rayleigh_data = rayleigh_data/2;
                   end 
                  end
         f0_i(count_rayleigh)= 2*rayleigh_data*sin(2*pi*fc*t_data(count_rayleigh)  + rayleigh_data*2*pi); %i支路载波  
         f0_q(count_rayleigh)= 2*rayleigh_data*cos(2*pi*fc*t_data(count_rayleigh) + rayleigh_data*2*pi); %q支路载波  
     
      end
    else if  use_rayleigh == 0  %不加频偏 不瑞利信道
         f0_i=sin(2*pi*fc*t_data );
         f0_q=cos(2*pi*fc*t_data );
        end
    end
end  %不加频偏的载波

if use_deviation == 1   %加频偏的载波
    fkm =1;    %每个数据变化 1hz
    if  use_rayleigh == 1    %加频偏 加瑞利信道
        for count_deviation = 1:length(t_data)   %产生的原始数据为32000个，分成iq两列/2，在经过插值*8，一路为128000个
                  if mod(count_deviation,num)==0      % 总数据32000个的每 1/4 处的sin 加一个sin（  +θ）
                          rayleigh_data = rand(1);
                   if rayleigh_data > 0.5
                      rayleigh_data = rayleigh_data/2;
                   end 
                  end
           if  count_deviation < point_of_frequency_offset            % 加频偏，前5000个数据每个点移动 1hz， 3000个点后保持之前的移动  
         f0_i(count_deviation)=2*rayleigh_data*sin(2*pi*fc*t_data(count_deviation)  + rayleigh_data*2*pi);   
         f0_q(count_deviation)=2*rayleigh_data*cos(2*pi*fc*t_data(count_deviation)  + rayleigh_data*2*pi);   
           else                
         f0_i(count_deviation)=sin(2*pi*(fc+ frequency_deviation)*t_data(count_deviation)+ rayleigh_data*2*pi);
         f0_q(count_deviation)=cos(2*pi*(fc+ frequency_deviation)*t_data(count_deviation) + rayleigh_data*2*pi);
           end
        end
    else if  use_rayleigh == 0    %加频偏 不加瑞利信道
         for count_deviation = 1:length(t_data)
           if count_deviation < point_of_frequency_offset          % 加频偏，前5000个数据每个点移动 1hz， 3000个点后保持之前的移动  
         f0_i(count_deviation)=sin(2*pi*fc*t_data(count_deviation) );  
         f0_q(count_deviation)=cos(2*pi*fc*t_data(count_deviation)  ); 

           else 
         f0_i(count_deviation)=sin(2*pi*(fc+frequency_deviation)*t_data(count_deviation));  
         f0_q(count_deviation)=cos(2*pi*(fc+frequency_deviation)*t_data(count_deviation));
         %f0_i(count_deviation) = sin(2*pi*fc*t_data(count_deviation) +pi/12);
         %f0_q(count_deviation) = cos(2*pi*fc*t_data(count_deviation) )*exp(j*165*t_data(count_deviation));
           end
        end
        end
    end
end
%%%%%%%%%%% 加频偏结束 %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
