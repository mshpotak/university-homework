initial_conditions;

s_bit = 16; %samples per bit
Fs = s_bit/t_bit;
T = t_bit * n_bit;
t = 0 : 1/Fs : T - 1/Fs;

m = zeros( size(t) );
pulse_rate = t_bit * Fs;

for i = 1 : n_bit
    if byte_le(i) == 0
        m( (1 + ((i-1)*pulse_rate)) : (i*pulse_rate) ) = -1;
    else
        m( (1 + ((i-1)*pulse_rate)) : (i*pulse_rate) ) = 1;
    end
end

s1 = signalAmpModulation(1, Ma, m, 0, w, t);
%plot( t, s1, '-ro' )

[G1, F1] = myFourier( s1, Fs );

save('task4.mat')