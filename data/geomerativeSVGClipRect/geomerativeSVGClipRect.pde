import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

void setup(){

size(500,500);
background(255);
RG.init(this);

// charge le fichier SVG
RShape sampleLetter =  RG.loadShape("A-3-01.svg");
// deplace le trace du fichier SVG
sampleLetter.translate(-333,-379);
// nouveau rectangle de 140px carre (x:140,y:0)
RShape rectangle = RShape.createRectangle(140,0,140,140);
// intersection du rectangle et du SVG source
RShape intersection = sampleLetter.intersection(rectangle);
//
// on ignore la couleur initiale du SVG
RG.ignoreStyles();
// remplissage noir
fill(0);
// pas de contour
noStroke();
// on dessine l'intersection
intersection.draw(this);
//sampleLetter.draw(this);

}

void draw(){
  background(255);
  RShape sampleLetter =  RG.loadShape("A-2-01.svg");
  sampleLetter.translate(mouseX,mouseY);
}

