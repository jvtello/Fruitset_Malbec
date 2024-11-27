//Modified "PollenCounter" Fiji-compatible macro tailored to Malbec pollen grains. 
//Modified from Tello et al. Plant Methods. "A new image-based tool for the high throughput phenotyping of pollen viability: evaluation of inter- and intra-cultivar diversity in grapevine"
//https://doi.org/10.1186/s13007-017-0267-2//

dir1 = getDirectory("Choose Source Directory ");
format="jpeg";
dir2=dir1;
print(dir1);
list = getFileList(dir1);
for(i=0;i<list.length;i++){ 
open(dir1+list[i]); 
run("Colour Deconvolution", "vectors=Giemsa");
wait(5000);
selectWindow(list[i] + "-(Colour_1)");
setOption("BlackBackground", false);
run("Convert to Mask");
run("Fill Holes");
run("Watershed");
run("Analyze Particles...", "size=250-1000 circularity=0.40-1.00 show=[Overlay Masks] display exclude clear include summarize");
saveAs(format, dir2+list[i] + " (all).jpg");
selectWindow(list[i] + "-(Colour_2)");
run("Convert to Mask");
run("Fill Holes");
run("Watershed");
run("Analyze Particles...", "size=250-1000 circularity=0.40-1.00 show=[Overlay Masks] display exclude clear include summarize");
saveAs(format, dir2+list[i] + " (viable).jpg");
run("Close All");
wait(250);
}


