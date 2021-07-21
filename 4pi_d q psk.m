%调制
dqpsk_code = [exp(1i*0) exp(1i*pi/2) exp(1i*3*pi/2) exp(1i*pi)];
dqpsk_send(1) = sym * dqpsk_code(2*dataenc(1)+dataenc(2)+1);
for i = 2:(num) 
   dqpsk_send(i) = dqpsk_send(i-1)* dqpsk_code( 2*dataenc(2*i-1)+dataenc(2*i)+1);
end

%解调
comp_mat = zeros(4,num-1);
comp_mat(1,1:2:end) = real( conj(data_receive(1:2:end-1)).* data_receive(2:2:end)*exp(-1i*0));
comp_mat(2,1:2:end) = real( conj(data_receive(1:2:end-1)).* data_receive(2:2:end)*exp(-1i*pi/2));
comp_mat(3,1:2:end) = real( conj(data_receive(1:2:end-1)).* data_receive(2:2:end)*exp(-1i*3*pi/2));
comp_mat(4,1:2:end) = real( conj(data_receive(1:2:end-1)).* data_receive(2:2:end)*exp(-1i*pi));   
    
comp_mat(1,2:2:end) = real( conj(data_receive(2:2:end-1)).* data_receive(3:2:end)*exp(-1i*0));
comp_mat(2,2:2:end) = real( conj(data_receive(2:2:end-1)).* data_receive(3:2:end)*exp(-1i*pi/2));
comp_mat(3,2:2:end) = real( conj(data_receive(2:2:end-1)).* data_receive(3:2:end)*exp(-1i*3*pi/2));
comp_mat(4,2:2:end) = real( conj(data_receive(2:2:end-1)).* data_receive(3:2:end)*exp(-1i*pi));

[~,indices] = max(comp_mat,[],1);
