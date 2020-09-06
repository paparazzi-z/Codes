function [ xmin, xmax, ymin, ymax] = CalculFenetre( CentreX, CentreY,taille )
    xmin = CentreX - taille;
    if xmin<1
        xmin = 1;
    end
    xmax = CentreX + taille;
    if xmax>480
        xmax = 480;
    end
    ymin = CentreY - taille;
    if ymin<1
        ymin = 1;
    end
    ymax = CentreY + taille;
    if ymax>640
        ymax = 640;
    end
    
   
end

