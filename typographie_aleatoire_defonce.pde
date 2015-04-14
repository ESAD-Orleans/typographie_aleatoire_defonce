//
// Typographie Aleatoire Defonce
// Audrey Pucinelli
// 3DVG
// 2015/04
//

// utiliser la librairie geomerative
// http://www.ricardmarxer.com/geomerative/
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

// largeur d'un quartier de lettre
int largeur=141;
// nombre de variante de lettre
int nbPossibilites=11;
// palette de couleur
color[] palette= new color[4];
// couleur de remplissage
color couleurAleatoire;

// demarrage
void setup () {
  // taille de la fenetre, en pixels
  size(1000, 800);
  // couleur d'arriere-plan, blanc
  background(255);
  // initialisation de la librairie Geomerative
  RG.init(this);

  // desactivation du dessin des contours
  noStroke();
  // definitions des 4 couleurs de la palette
  // au format Rouge Vert Bleur
  palette[0]= color(255, 0, 0);
  palette[1]= color(0, 0, 255);
  palette[2]= color(0, 255, 0);
  palette[3]= color(255, 255, 255);

  // simulation d'une premiere touche au clavier
  keyPressed();
}
// 
void draw () {
  // rien !
}

// fonction qui utilise une nouvelle couleur pour le remplissage
void NouvelleCouleurAleatoire() {
  fill(couleurAleatoire=palette[round(random(0, palette.length-1))]);
}

// fonction qui se declenche quand on appuie sur une touche
void keyPressed () {
  // arriere-plan transparent
  background(255);
  // on execute la fonction de dessin d'image d'arriere-plan
  dessinePoster();
  // on execure la fonction qui change de couleur de remplissage
  NouvelleCouleurAleatoire();

  // on dessine les lettres a differentes positions
  dessineUneLettre("A", largeur, largeur*2);
  dessineUneLettre("B", largeur*3, largeur*2);
  dessineUneLettre("C", largeur*5, largeur*2);
}

// fonction qui dessine une lettre, a une position x,y
void dessineUneLettre (String lettre, float x, float y) {
  translate(x, y);
  
  // dessine les 4 morceaux
  dessineUnMorceau(lettre, 1);
  dessineUnMorceau(lettre, 2);
  dessineUnMorceau(lettre, 3);
  dessineUnMorceau(lettre, 4);
  
  // replace le dessin a son origine
  resetMatrix();
}

// fonction qui dessine un morceau de lettre a son emplacement, en fonction de son identifiant
void dessineUnMorceau (String lettre, int identifiant) {  
  // position initiale a 0,0
  int decalageX=0;
  int decalageY=0;
  // si on est superieur a 2
  if (identifiant>2) {
    // on descend d'un rang
    decalageY=largeur;
  }
  // si on est ou 2 ou 4
  if (identifiant%2==0) {
    // on decalle d'un rang vers la droite
    decalageX=largeur;
  }
  // on selectionne une lettre parmis le nombre de possibilites (11)
  String randomLetterNumber = (round(random(1, nbPossibilites)))+"-01";
  // on fabrique le nom de fichier
  String fichier=lettre+"-"+randomLetterNumber+".svg";
  // on charge le fichier SVG
  RShape svg=RG.loadShape(fichier);
  // on ignore les styles (couleurs et remplissage du SVG)
  RG.ignoreStyles();
  // on cree un rectangle, masque d'ecretage pour la lettre
  // en utilisant les decalages
  RShape rectangle = RShape.createRectangle(decalageX, decalageY, largeur, largeur);
  // on applique le masque rectangulaire au svg
  RShape intersection = svg.intersection(rectangle);
  // on dessine le tout
  intersection.draw(this);
}

// fonction qui dessine une image d'arriere-plan au hasard
void dessinePoster () {
  PImage poster= loadImage("numeriser-"+round(random(1, 11))+"-01.jpg");
  image(poster, 0, 0);
}

