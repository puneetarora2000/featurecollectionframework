function [ boundBox ] = findBoundBox(x,y)
left=min(x);
right=max(x);
bottom=min(y);
top=max(y);
boundBox.x=left;
boundBox.y=bottom;
boundBox.width=right-left;
boundBox.height=top-bottom;


end

