 %交织
data_before_interwoven = datamod_temp_temp; 
for interwoven = 1:1
interwoven_temp = reshape(data_before_interwoven,160,128);
inter = interwoven_temp';
inter_data = inter(:);
data_before_interwoven = inter_data;
end
end
  %交织结束


 % 解交织
       if mingle == 0
           data_receive_eninter = data_receive_temp_temp ;
       else
data_before_eninterwoven = data_receive_temp_temp;
for eninterwoven = 1:1
eninterwoven = reshape(data_before_eninterwoven,128,160);
eninter = eninterwoven';
eninter_data = eninter(:);
data_before_eninterwoven = eninter_data;
end                         
data_receive_eninter = eninter_data;
       end
       %解交织结束    
