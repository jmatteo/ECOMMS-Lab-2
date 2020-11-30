%%Lab 2 by Jacob Matteo, Jack Henley, and TIm Catrino

%In this project, you will model AM and DSB-SC communications
%   systems using the Matlab Simulink Communications Systems Toolbox.
%In both parts, you will test the system with single-tone AM (w
%   and w/o added Gaussian noise) and multi-tone AM signals (w/o added noise).


%The objective is to observe (in time and spectral domains) &
%   listen as audio tones progresses along a modulation-demodulation
%   system, both in the presence and absence of added Gaussian
%   noise (+/- 3dB).
%Develop a Matlab Simulink simulation of an AM system that includes
%   a source, modulator, channel, demodulator and sink. Test the
%   system with single and multi-tone audio frequency message inputs.
%Note down observations in the time and spectral domains, and listen
%   to the audio signals and the input and output.
%Repeat the exercise for a DSB-SC system.
%Bonus: Demonstrate the Quadrature-Null effect.

%% FM Modulation - Modulate

%scale
x = [0.001:0.001:1];

%frequency to modulate       / source
fSour = 43;
sigIn = cos(2*pi*fSour.*x);

%modulation frequency        / channel
fChan = 200;
sigChan = cos(2*pi*fChan.*x);

%modulate                    / modulator
out = sim('L3P1.slx');
output1 = out.sigOut;

figure(1)
hold on

subplot(2,1,1);
plot(sigIn.*sigChan)

subplot(2,1,2);
plot(output1)

subplot(2,2,3);
plot(fft(output1))
hold off

%% FM Modulation - Add Noise

%% FM Mdulation - Demodulate

%demodulate                  / demodulator
demP1 = output1.*(output1 > 0);