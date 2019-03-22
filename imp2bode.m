function [mag,phs] = imp2bode(imp,Fs)

N = length(imp);
f = (0:N-1)/N*Fs;
IMP = fft(imp);

if nargout == 0
    mag_tmp = 20*log10(abs(IMP));
    phs_tmp = unwrap(angle(IMP)).*180./pi;
    figure;
    subplot(2,1,1);
    semilogx(f,mag_tmp,'LineWidth',3);
    grid on;
    xlabel('Frequency [Hz]','FontSize',30);
    ylabel('Gain [dB]','FontSize',30);
    set(gca,'FontSize',30);
    subplot(2,1,2);
    semilogx(f,phs_tmp,'LineWidth',3);
    grid on;
    xlabel('Frequency [Hz]','FontSize',30);
    ylabel('Phase [deg]','FontSize',30);
    set(gca,'FontSize',30);
elseif nargout == 2
    mag = 20*log10(abs(IMP));
    phs = unwrap(angle(IMP)).*180./pi;
else
    disp('error');
end