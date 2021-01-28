k=8;
for i=k*25+1:k*25+25
subplot(5,5,mod(i,25)+1);
imshow(tiku(:,:,:,i));
end