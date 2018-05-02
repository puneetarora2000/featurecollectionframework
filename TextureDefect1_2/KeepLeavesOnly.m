 
function [keeperBlobsImage blobMeasurements]= KeepLeavesOnly(binaryImage, numberToKeep)
try
 	[labeledImage numberOfBlobs] = bwlabel(binaryImage, 8);   
    
    if numberToKeep > numberOfBlobs
		numberToKeep = numberOfBlobs;
	end
	
	% Make the area measurements.
	blobMeasurements = regionprops(labeledImage, 'Area');   % Get the blob properties of 'Area'
	allAreas = [blobMeasurements.Area];
	% Get a list of the blobs that meet our criteria and we need to keep. 
	[sortedAreas sortedIndices] = sort(allAreas, 'ascend');
	keeperIndexes = sortedIndices(1 : numberToKeep); 
 	keeperBlobsImage = ismember(labeledImage, keeperIndexes); 
catch ME
		errorMessage = sprintf('Error in function Smaller.\n\nError Message:\n%s', ME.message);
		WarnUser(errorMessage);
end
return; % from Smaller
