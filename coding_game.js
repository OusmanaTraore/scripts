// POWER OF THOR

if (lightX > actuThorX &&  lightY< actuThorY){
        path="NE";
        actuThorX++;
        actuThorY--;

    }else if (lightX > actuThorX &&  lightY > actuThorY){
        path="SE";
        actuThorX++;
        actuThorY++;
    }else if (lightX < actuThorX &&  lightY > actuThorY){
        path="SW";
        actuThorX--;
        actuThorY++;
    }else if (lightX < actuThorX &&  lightY < actuThorY){
        path="NW";
        actuThorX--;
        actuThorY--;
    }else if (lightX > actuThorX){
        path="E";
        actuThorX++;
    }else if (lightX < actuThorX){
        path="W";
        actuThorX--;
    }else if (lightY > actuThorY){
        path="S";
        actuThorY++;
    }else if (lightY < actuThorY){
        path="N";
        actuThorY--;
    }
// PUZZLE THE RIVER I
while( r1 !== r2) {
 if( r1 < r2) {
    r1 = (''+r1).split('').map(Number).reduce( (acc, current) => acc + current, 0) + r1;
 }else{
    r2 = (''+r2).split('').map(Number).reduce( (acc, current) => acc + current, 0) + r2;
 }
}

console.log(r1);

//
