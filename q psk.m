  %qpsk调制
    splice_temp = zeros(num,2);
    splicedata_out(1:num) = zeros(1); 
    for index_splice = 1:20480
    temp = [ds(2*index_splice-1),ds(2*index_splice)];
    splice_temp (index_splice,:) = temp;
    if temp(1) == 0 &&temp(2) ==0
        qs = 1+i;
    else if  temp(1) == 0 &&temp(2) ==1
        qs = -1+i;
    else if  temp(1) == 1 &&temp(2) ==0
        qs = 1-i;
    else qs = -1-i;
        end
    end
    end
    splice(:,index_splice) = qs;
end 
  %qpsk调制结束

