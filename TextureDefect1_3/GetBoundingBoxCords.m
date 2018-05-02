function [d1 d2 d3 d4] = GetBoundingBoxCords(Box)

 x1 = Box(1);
 y1 = Box(2);
 x2 = Box(2);
 y2 = Box(2);
 x3 = Box(3);
 y3 = Box(4);
 x4 = Box(4);
 y4 = Box(4);
 
 
d1 = sqrt((x1-x2)^2*(y1-y2)^2);
d2 = sqrt((x3-x4)^2*(y3-y4)^2);
d3 = sqrt((x4-x2)^2*(y4-y2)^2);
d4 = sqrt((x1-x3)^2*(y1-y3)^2);


end 