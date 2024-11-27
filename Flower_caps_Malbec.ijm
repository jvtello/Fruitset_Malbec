//Modified Fiji-compatible macro tailored to Malbec flower caps. 
//Modified from Ibañez et al. Crop Breeding, Genetics and Genomics. "Cultivated Grapevine Displays a Great Diversity for Reproductive Performance Variables"
//https://doi.org/10.20900/cbgg20200003


dir1 = getDirectory("Choose Source Directory ");
//format = getFormat();
format="jpeg";
dir2 = getDirectory("Choose Destination Directory ");
list = getFileList(dir1);
setBatchMode(true);
for (i=0; i<list.length; i++) {
showProgress(i+1, list.length);
open(dir1+list[i]);
//Batch: Macro for counting calyptras//
//print (list[i]);//
run("Enhance Contrast...", "saturated=0.65");
run("Split Channels");
selectWindow(list[i] + " (red)");
setAutoThreshold("Yen");
//setThreshold(0, 133);
run("Convert to Mask");
run("Convert to Mask");
run("Fill Holes");
run("Watershed");
run("Erode");
run("Analyze Particles...", "size=200-1000 show=[Overlay Masks] display exclude clear include summarize");
saveAs(format, dir2+list[i] + " (red).jpg");
//run("Close All");//
}