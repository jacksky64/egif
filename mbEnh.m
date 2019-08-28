Isrc = double( imread(char("E:\SolidDetectorImages\musica\shutter\images\1.3.76.6.1.1.5.2.D.145580251815009.Dat.png") )) ;

Is = log(Isrc+1)/log(65535);

Ilf(:,:,1)=imgaussfilt(Il,256);
Ilf(:,:,2)=imgaussfilt(Il,16);
Ilf(:,:,3)=imgaussfilt(Il,2);
Ilf(:,:,4)=imgaussfilt(Il,0.5);

Bpf(:,:,1) = Ilf(:,:,2) - Ilf(:,:,1);
Bpf(:,:,2) = Ilf(:,:,3) - Ilf(:,:,2);
Bpf(:,:,3) = Ilf(:,:,4) - Ilf(:,:,3);
Bpf(:,:,4) = Is -         Ilf(:,:,1);

Gk = [ 0.9, 1.001, 1.001, 1, 0.5];

Ir = Bpf(:,:,4) * Gk(5) + Bpf(:,:,3) * Gk(4) +  Bpf(:,:,2) *  Gk(3) + Bpf(:,:,1) * Gk(2) + Ilf(:,:,1)* Gk(1);

imtool(Ir)
imtool(Is)

f= [1 2 1];
fb = conv2(f',conv2(f',conv2(f,f)));
fb=fb/sum(fb(:));

fbb{1}=fb;
for n=2:9
    fbb{n}=conv2(fbb{n-1},fbb{n-1});
end

for n=1:12
    Imf(:,:,n) = conv2(Is,fbb{n},'same');
end




