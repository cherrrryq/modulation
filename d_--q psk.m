%dqpsk
%绝对码->相对码
%调制
ds=zeros(1,num);
    if data(1) == 1 
        ds(1) = 1;
    end
    if data(2) == 1
        ds(2) = 1;
    end
       
    for index = 2:num/2
    if  xor (ds(2*(index-1)-1),ds(2*(index-1))) == 0
        if data(2*index-1) ~= ds(2*(index-1)-1)
            ds(2*index-1) = 1;
        end
        if data(2*index) ~= ds(2*(index-1))
            ds(2*index) = 1;
        end
    else
        if data(2*index) ~= ds(2*(index-1)-1)
            ds(2*index-1) = 1;
        end
        if data(2*index-1)~= ds(2*(index-1))
            ds(2*index) = 1;
        end
    
    end
    end 
%调制结束

  %相对码变绝对码
        final_data(1:4096) =zeros(1);
            if dqpskdemod(1)==1
                final_data(1) = 1;
            end
        for splice_count = 2:4096
            if dqpskdemod(splice_count) ~= dqpskdemod(splice_count-1)
                  final_data(splice_count) = 1;
            end
        end        
       %相对码变绝对码结束


  %数据解调   非相干解调 
     %      data_receivetemp(1:20480) = zeros(1);
           data_receivetemp = data_receive_eninter;                                 
           data_receive_1 = data_receivetemp(1:end-1);          
           data_receive_2 = data_receivetemp(2:end);
           data_receive_2_conj = conj(data_receive_2);
           data_receive_conj = data_receive_1.*data_receive_2_conj;
           data_receive_conj_final = data_receive_conj./abs(data_receive_conj);         
           receive_set = [1,-1,i,-i];
           receive_data_num = [0 1 1 0;0 1 0 1]
           for i_demodu = 1:20479
               for i_distance = 1:4
                   distance(i_distance) = norm(data_receive_conj_final(i_demodu) - receive_set(i_distance))^2;
               end
               min_distance = find(distance == min(distance));
               qr = receive_data_num(:,min_distance);
               data_endqpsk_temp(:,i_demodu) = qr;
           end
           data_endqpsk =  data_endqpsk_temp(:);
   %非相干解调结束





