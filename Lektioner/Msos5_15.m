T = 4;
a = 2;
i = 0;

% Välj ett lämpligt intervall för tiden t
for t1 = 0:0.01:10
    i=i+1;
    t(i)=t1; %Spara tiden i vektorn t
    x1=0; %Nollställ summeringen
    
    %Välj ett lämpligt intervall för k, stegintervall 1
    for k=-100:1:100
        if k==0;
            c0=0.25;
        else
            ck=(-1/(j*k*2*pi))*(exp(-j*k*2*pi*a/T)-1);
            x1=x1+ck*exp(j*k*2*pi*t1/T); %Summera F.serien
        end
    end
    x(i)=c0+x1; %Här får vi hela F.serien inkl. c0
end

%Rita ut F.serien
plot(t,abs(x)); grid;

% a) Fungerar programmet bra med k = 0->50?
% Det fungerar, men värdena blir konstiga
% b) Ja! Mycket bättre!.