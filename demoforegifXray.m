close all;

Ir = double( imread(char("E:\SolidDetectorImages\musica\shutter\images\1.3.76.6.1.1.5.2.D.145580251815009.Dat.png") )) ;
Ia = Ir.^0.5;
Ia = Ia/256;
I = Ia;
p = I;
eps =0.1 ;

% imtool(Ir)
 
n=1;
for pr=7:8
    r=2.^pr;
    [q,beta] = egif(I, p, r, eps);
    I_enhanced = ( I - q ) .* beta  + q;

    IeO(:,:,n) = (I_enhanced * 256).^2;
    n=n+1;
end


lf = @(x) log(x+1)*1000;
% imtool(lf(Ir))

np=2;
imtool(lf(IeO(:,:,np)))
% imtool((IeO(:,:,np)-Ir))


% imtool(log(I*65535+1)*1000),imtool(log(I_enhanced*65535+1)*1000)
