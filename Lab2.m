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

%% AM Modulation - 1 signal

%scale
x = [0:0.001:2*pi];

%frequency to modulate       / source
fSour = 5000;
sigIn = cos(2*pi*fSour*x);

%modulation frequency        / channel
fChan = 640000;
sigChan = cos(2.*pi.*fChan.*x);

%modulate                    / modulator
output1 = sigIn .* sigChan;

figure(1)
hold on
subplot(2,1,1);
plot(output1)

subplot(2,1,2);
plot(fft(output1))
hold off

%% AM Modulation - 2 signal

%scale
x = [0:0.001:2*pi];

%frequencies to modulate
fSourA = 5000;
fSourB = 6250;

sigIn = cos(2*pi*fSourA*x)+cos(2*pi*fSourB*x);

%modulation frequency
fChan = 640000;
sigMod = cos(2.*pi.*fChan.*x);

%modulate
output2 = sigIn .* sigMod;


figure(2)
hold on
subplot(2,1,1);
plot(output2)

subplot(2,1,2);
plot(fft(output2))
hold off

%% DSB-SC Modulation - 1 signal

%scale
x = [0:0.001:2*pi];

%frequency to modulate       / source
fsour = 5000;
sigIn = cos(2*pi*fsour*x);

%modulation frequency        / channel
fchan = 640000;
sigModA = cos(2.*pi.*fchan.*x);
sigModB = -sigModA;

%modulate                    / modulator
mod1 = sigIn .* sigModA;
mod2 = sigIn .* sigModB;
output1 = mod1-mod2;

figure(3)
hold on
subplot(2,1,1);
plot(output1)

subplot(2,1,2);
plot(fft(output1))
hold off

%% DSB-SC Modulation - 2 signal

%scale
x = [0:0.001:2*pi];

%frequencies to modulate
finA = 5000;
finB = 6250;

sigIn = cos(2*pi*finA*x)+cos(2*pi*finB*x);

%modulation frequency        / channel
fchan = 640000;
sigModA = cos(2.*pi.*fchan.*x);
sigModB = -sigModA;

%modulate                    / modulator
mod1 = sigIn .* sigModA;
mod2 = sigIn .* sigModB;
output1 = mod1-mod2;

figure(4)
hold on
subplot(2,1,1);
plot(output1)

subplot(2,1,2);
plot(fft(output1))
hold off