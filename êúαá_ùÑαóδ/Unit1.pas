unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ImgList, Menus, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    haut1: TImage;
    haut2: TImage;
    haut3: TImage;
    haut4: TImage;
    haut5: TImage;
    haut6: TImage;
    haut7: TImage;
    haut8: TImage;
    haut9: TImage;
    haut10: TImage;
    haut11: TImage;
    haut12: TImage;
    haut13: TImage;
    droit1: TImage;
    droit2: TImage;
    droit3: TImage;
    droit4: TImage;
    droit5: TImage;
    droit6: TImage;
    droit7: TImage;
    droit8: TImage;
    droit9: TImage;
    droit10: TImage;
    droit11: TImage;
    droit12: TImage;
    droit13: TImage;
    gauche1: TImage;
    gauche2: TImage;
    gauche3: TImage;
    gauche4: TImage;
    gauche5: TImage;
    gauche6: TImage;
    gauche7: TImage;
    gauche8: TImage;
    gauche9: TImage;
    gauche10: TImage;
    gauche11: TImage;
    gauche12: TImage;
    gauche13: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Shape1: TShape;
    MainMenu1: TMainMenu;
    Jeu1: TMenuItem;
    Option1: TMenuItem;
    Score1: TMenuItem;
    Nouvellepartie1: TMenuItem;
    Quitter1: TMenuItem;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    ok: TButton;
    carte1: TImage;
    carte2: TImage;
    carte3: TImage;
    carte4: TImage;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure okClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Option1Click(Sender: TObject);
    procedure Quitter1Click(Sender: TObject);
    procedure Nouvellepartie1Click(Sender: TObject);
    procedure Score1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    nom_j1,nom_j2,nom_j3,nom_j4:string;
    score :integer;
    affichage:boolean;
    Manche,tour,point_joueur1,point_joueur2,point_joueur3,point_joueur4:integer;
    procedure position_haut();
    procedure position_droit();
    procedure position_gauche();
    procedure position_utilisateur();
    procedure aleatoire();
    procedure trie();
    procedure passe_carte_j1();
    procedure passe_carte_j2();
    procedure passe_carte_j3();
    procedure passe();
    procedure montrer_carte();
    procedure baisse_carte();
    procedure place_point();
    procedure cache_point();
    procedure play();
    function  play_joueur(var t:array of integer):integer;
    function  ouvre_tour(var t:array of integer):integer;
    Function Decharger(var t:array of integer):integer;
    procedure affiche_carte(i:integer);
    Procedure supprime_carte(k:integer);
    Function Verif(k:integer):boolean;
    procedure calcul_point();
    procedure initialisation();
    procedure  affiche_point();
    procedure  demasquer();
    procedure cool();

  end;

var
  Form1: TForm1;
  tab_joueur1:array[1..13] of integer; // table qui contient les cartes du joueur n°1
  tab_joueur2:array[1..13] of integer; // table qui contient les cartes du joueur n°2
  tab_joueur3:array[1..13] of integer; // table qui contient les cartes du joueur n°3
  tab_joueur4:array[1..13] of integer; // table qui contient les cartes du joueur n°4 soit l'utilsateur
  tab_carte,tab_jouer:array[1..52]of integer;   // table qui fait la correspondance qui fait la correspondance avec les images des cartes de Imagelist1
  tab_etat:array[1..13] of byte;     // table qui permet de savoir quelle carte l'utilisateur a décidé de passer et de mettre en évidence;
  NB_passe,Main,nb_jouer,couleur_jouer:integer; // Manche pour savoir dans quelle manche on se situe, tour pour savoir dans quelle tour on est
  nb_point_j1,nb_point_J2,nb_point_j3,nb_point_j4:integer;
  j1_passe:array[1..3] of integer;
  j2_passe:array[1..3] of integer;
  j3_passe:array[1..3] of integer;
  tab_tour:array[1..4] of integer;
  point_j1,point_j2,point_j3,point_j4:array[1..14]of integer;
  j4_passe,montre_carte:array[1..3] of integer;
  montre,coeur_jouer,affiche_pt:boolean;

implementation

uses Unit2, Unit3;

{$R *.DFM}
procedure TForm1.FormCreate(Sender: TObject);
var
   i:integer;
begin
for i:=1 to 12 do
tab_carte[i]:=41+i;
tab_carte[13]:=41;
for i:=14 to 25 do
tab_carte[i]:=i-11;
tab_carte[26]:=2;
for i:=27 to 38 do
 tab_carte[i]:=i+2;
 tab_carte[39]:=28;
 for i:=40 to 51 do
 tab_carte[i]:=i-24;
 tab_carte[52]:=15;
  manche:=1;
  score:=100;
  point_joueur1:=0;
  point_joueur2:=0;
  point_joueur3:=0;
  point_joueur4:=0;
  affichage:=false;
  Label1.caption:='Pierre';
  Label4.caption:='Paul';
  Label3.caption:='Jacques';
  Label2.caption:='MOI' ;
  initialisation();
end;


Procedure TForm1.initialisation();
var
   i:integer;
begin
image1.Visible:=true;
image2.Visible:=true;
image3.Visible:=true;
image4.Visible:=true;
image5.Visible:=true;
image6.Visible:=true;
image7.Visible:=true;
image8.Visible:=true;
image9.Visible:=true;
image12.Visible:=true;
image11.Visible:=true;
image10.Visible:=true;
image13.Visible:=true;
for i:=1 to 13 do
tab_etat[i]:=0;
for i:=1 to 52 do
tab_jouer[i]:=1;
for i:=1 to 14 do
begin
 point_j1[i]:=0;
 point_j2[i]:=0;
 point_j3[i]:=0;
 point_j4[i]:=0;
end;
     nb_point_j1:=0;
     nb_point_j2:=0;
     nb_point_j3:=0;
     nb_point_j4:=0;
nb_jouer:=0;
montre:=false;
aleatoire();
trie();
if not affichage then
begin
position_haut();
position_droit();
position_gauche();
end
else
    demasquer();
couleur_jouer:=0;
coeur_jouer:=false;
position_utilisateur();
passe_carte_j1();
passe_carte_j2();
passe_carte_j3();
if manche<>4 then
place_point();
Tour:=0;
ok.Enabled:=false;
NB_passe:=0;
end;


//procedure qui affiche la rangée du haut

procedure TForm1.position_haut();
var
   i,k:integer;
begin
 i:=328; k:=8;

 haut1.left:=i;
 haut1.top:=k;
 i:=i-16;
 haut1.picture.Bitmap:=nil;
 if tab_joueur2[1]<>0 then
 imagelist1.GetBitmap(0,haut1.picture.bitmap);

 haut2.left:=i;
 haut2.top:=k;
 i:=i-16;
 haut2.picture.Bitmap:=nil;
 if tab_joueur2[2]<>0 then
 imagelist1.GetBitmap(0,haut2.picture.bitmap);

 haut3.left:=i;
 haut3.top:=k;
 i:=i-16;
 haut3.picture.Bitmap:=nil;
 if tab_joueur2[3]<>0 then
 imagelist1.GetBitmap(0,haut3.picture.bitmap);

 haut4.left:=i;
 haut4.top:=k;
 i:=i-16;
 haut4.picture.Bitmap:=nil;
 if tab_joueur2[4]<>0 then
 imagelist1.GetBitmap(0,haut4.picture.bitmap);

 haut5.left:=i;
 haut5.top:=k;
 i:=i-16;
 haut5.picture.Bitmap:=nil;
 if tab_joueur2[5]<>0 then
 imagelist1.GetBitmap(0,haut5.picture.bitmap);

 haut6.left:=i;
 haut6.top:=k;
 i:=i-16;
 haut6.picture.Bitmap:=nil;
 if tab_joueur2[6]<>0 then
 imagelist1.GetBitmap(0,haut6.picture.bitmap);

 haut7.left:=i;
 haut7.top:=k;
 i:=i-16;
 haut7.picture.Bitmap:=nil;
 if tab_joueur2[7]<>0 then
 imagelist1.GetBitmap(0,haut7.picture.bitmap);

 haut8.left:=i;
 haut8.top:=k;
 i:=i-16;
 haut8.picture.Bitmap:=nil;
 if tab_joueur2[8]<>0 then
 imagelist1.GetBitmap(0,haut8.picture.bitmap);

 haut9.left:=i;
 haut9.top:=k;
 i:=i-16;
 haut9.picture.Bitmap:=nil;
 if tab_joueur2[9]<>0 then
 imagelist1.GetBitmap(0,haut9.picture.bitmap);

 haut10.left:=i;
 haut10.top:=k;
 i:=i-16;
 haut10.picture.Bitmap:=nil;
 if tab_joueur2[10]<>0 then
 imagelist1.GetBitmap(0,haut10.picture.bitmap);

 haut11.left:=i;
 haut11.top:=k;
 i:=i-16;
 haut11.picture.Bitmap:=nil;
 if tab_joueur2[11]<>0 then
 imagelist1.GetBitmap(0,haut11.picture.bitmap);

 haut12.left:=i;
 haut12.top:=k;
 i:=i-16;
 haut12.picture.Bitmap:=nil;
 if tab_joueur2[12]<>0 then
 imagelist1.GetBitmap(0,haut12.picture.bitmap);

 haut13.left:=i;
 haut13.top:=k;
 haut13.picture.Bitmap:=nil;
 if tab_joueur2[13]<>0 then
 imagelist1.GetBitmap(0,haut13.picture.bitmap);


end;

// procedure qui affiche la rangée de droite

procedure TForm1.position_droit();
var
   i,k:integer;
begin
 i:=280; k:=450;

 droit1.top:=i;
 droit1.left:=k;
 i:=i-16;
 droit1.picture.Bitmap:=nil;
 if tab_joueur3[1]<>0 then
 imagelist1.GetBitmap(0,droit1.picture.bitmap);

 droit2.top:=i;
 droit2.left:=k;
 i:=i-16;
 droit2.picture.Bitmap:=nil;
 if tab_joueur3[2]<>0 then
 imagelist1.GetBitmap(0,droit2.picture.bitmap);

 droit3.top:=i;
 droit3.left:=k;
 i:=i-16;
 droit3.picture.Bitmap:=nil;
 if tab_joueur3[3]<>0 then
 imagelist1.GetBitmap(0,droit3.picture.bitmap);

 droit4.top:=i;
 droit4.left:=k;
 i:=i-16;
 droit4.picture.Bitmap:=nil;
 if tab_joueur3[4]<>0 then
 imagelist1.GetBitmap(0,droit4.picture.bitmap);

 droit5.top:=i;
 droit5.left:=k;
 i:=i-16;
 droit5.picture.Bitmap:=nil;
 if tab_joueur3[5]<>0 then
 imagelist1.GetBitmap(0,droit5.picture.bitmap);

 droit6.top:=i;
 droit6.left:=k;
 i:=i-16;
 droit6.picture.Bitmap:=nil;
 if tab_joueur3[6]<>0 then
 imagelist1.GetBitmap(0,droit6.picture.bitmap);

 droit7.top:=i;
 droit7.left:=k;
 i:=i-16;
 droit7.picture.Bitmap:=nil;
 if tab_joueur3[7]<>0 then
 imagelist1.GetBitmap(0,droit7.picture.bitmap);

 droit8.top:=i;
 droit8.left:=k;
 i:=i-16;
 droit8.picture.Bitmap:=nil;
 if tab_joueur3[8]<>0 then
 imagelist1.GetBitmap(0,droit8.picture.bitmap);

 droit9.top:=i;
 droit9.left:=k;
 i:=i-16;
 droit9.picture.Bitmap:=nil;
 if tab_joueur3[9]<>0 then
 imagelist1.GetBitmap(0,droit9.picture.bitmap);

 droit10.top:=i;
 droit10.left:=k;
 i:=i-16;
 droit10.picture.Bitmap:=nil;
 if tab_joueur3[10]<>0 then
 imagelist1.GetBitmap(0,droit10.picture.bitmap);

 droit11.top:=i;
 droit11.left:=k;
 i:=i-16;
 droit11.picture.Bitmap:=nil;
 if tab_joueur3[11]<>0 then
 imagelist1.GetBitmap(0,droit11.picture.bitmap);

 droit12.top:=i;
 droit12.left:=k;
 i:=i-16;
 droit12.picture.Bitmap:=nil;
 if tab_joueur3[12]<>0 then
 imagelist1.GetBitmap(0,droit12.picture.bitmap);

 droit13.top:=i;
 droit13.left:=k;
 droit13.picture.Bitmap:=nil;
 if tab_joueur3[13]<>0 then
 imagelist1.GetBitmap(0,droit13.picture.bitmap);
end;

// procedure qui affiche la rangée de gauche
procedure TForm1.position_gauche();
var
   i,k:integer;
begin
 i:=80; k:=16;

 gauche1.top:=i;
 gauche1.left:=k;
 i:=i+16;
 gauche1.picture.Bitmap:=nil;
 if tab_joueur1[1]<>0 then
 imagelist1.GetBitmap(0,gauche1.picture.bitmap);

 gauche2.top:=i;
 gauche2.left:=k;
 i:=i+16;
 gauche2.picture.Bitmap:=nil;
 if tab_joueur1[2]<>0 then
 imagelist1.GetBitmap(0,gauche2.picture.bitmap);

 gauche3.top:=i;
 gauche3.left:=k;
 i:=i+16;
 gauche4.picture.Bitmap:=nil;
 if tab_joueur1[3]<>0 then
 imagelist1.GetBitmap(0,gauche3.picture.bitmap);

 gauche4.top:=i;
 gauche4.left:=k;
 i:=i+16;
 gauche4.picture.Bitmap:=nil;
 if tab_joueur1[4]<>0 then
 imagelist1.GetBitmap(0,gauche4.picture.bitmap);

 gauche5.top:=i;
 gauche5.left:=k;
 i:=i+16;
 gauche5.picture.Bitmap:=nil;
 if tab_joueur1[5]<>0 then
 imagelist1.GetBitmap(0,gauche5.picture.bitmap);

 gauche6.top:=i;
 gauche6.left:=k;
 i:=i+16;
 gauche6.picture.Bitmap:=nil;
 if tab_joueur1[6]<>0 then
 imagelist1.GetBitmap(0,gauche6.picture.bitmap);

 gauche7.top:=i;
 gauche7.left:=k;
 i:=i+16;
 gauche7.picture.Bitmap:=nil;
 if tab_joueur1[7]<>0 then
 imagelist1.GetBitmap(0,gauche7.picture.bitmap);

 gauche8.top:=i;
 gauche8.left:=k;
 i:=i+16;
 gauche8.picture.Bitmap:=nil;
 if tab_joueur1[8]<>0 then
 imagelist1.GetBitmap(0,gauche8.picture.bitmap);

 gauche9.top:=i;
 gauche9.left:=k;
 i:=i+16;
 gauche9.picture.Bitmap:=nil;
 if tab_joueur1[9]<>0 then
 imagelist1.GetBitmap(0,gauche9.picture.bitmap);

 gauche10.top:=i;
 gauche10.left:=k;
 i:=i+16;
 gauche10.picture.Bitmap:=nil;
 if tab_joueur1[10]<>0 then
 imagelist1.GetBitmap(0,gauche10.picture.bitmap);

 gauche11.top:=i;
 gauche11.left:=k;
 i:=i+16;
 gauche11.picture.Bitmap:=nil;
 if tab_joueur1[11]<>0 then
 imagelist1.GetBitmap(0,gauche11.picture.bitmap);

 gauche12.top:=i;
 gauche12.left:=k;
 i:=i+16;
 gauche12.picture.Bitmap:=nil;
 if tab_joueur1[12]<>0 then
 imagelist1.GetBitmap(0,gauche12.picture.bitmap);

 gauche13.top:=i;
 gauche13.left:=k;
 gauche13.picture.Bitmap:=nil;
 if tab_joueur1[13]<>0 then
 imagelist1.GetBitmap(0,gauche13.picture.bitmap);

end;

procedure Tform1.demasquer();
var i,k:integer;
begin

i:=80; k:=16;

 gauche1.top:=i;
 gauche1.left:=k;
 i:=i+16;
 gauche1.picture.Bitmap:=nil;
 if tab_joueur1[1]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur1[1]],gauche1.picture.bitmap);

 gauche2.top:=i;
 gauche2.left:=k;
 i:=i+16;
 gauche2.picture.Bitmap:=nil;
 if tab_joueur1[2]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur1[2]],gauche2.picture.bitmap);

 gauche3.top:=i;
 gauche3.left:=k;
 i:=i+16;
 gauche3.picture.Bitmap:=nil;
 if tab_joueur1[3]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur1[3]],gauche3.picture.bitmap);

 gauche4.top:=i;
 gauche4.left:=k;
 i:=i+16;
 gauche4.picture.Bitmap:=nil;
 if tab_joueur1[4]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur1[4]],gauche4.picture.bitmap);

 gauche5.top:=i;
 gauche5.left:=k;
 i:=i+16;
 gauche5.picture.Bitmap:=nil;
 if tab_joueur1[5]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur1[5]],gauche5.picture.bitmap);

 gauche6.top:=i;
 gauche6.left:=k;
 i:=i+16;
 gauche6.picture.Bitmap:=nil;
 if tab_joueur1[6]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur1[6]],gauche6.picture.bitmap);

 gauche7.top:=i;
 gauche7.left:=k;
 i:=i+16;
 gauche7.picture.Bitmap:=nil;
 if tab_joueur1[7]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur1[7]],gauche7.picture.bitmap);

 gauche8.top:=i;
 gauche8.left:=k;
 i:=i+16;
 gauche8.picture.Bitmap:=nil;
 if tab_joueur1[8]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur1[8]],gauche8.picture.bitmap);

 gauche9.top:=i;
 gauche9.left:=k;
 i:=i+16;
 gauche9.picture.Bitmap:=nil;
 if tab_joueur1[9]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur1[9]],gauche9.picture.bitmap);

 gauche10.top:=i;
 gauche10.left:=k;
 i:=i+16;
 gauche10.picture.Bitmap:=nil;
 if tab_joueur1[10]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur1[10]],gauche10.picture.bitmap);

 gauche11.top:=i;
 gauche11.left:=k;
 i:=i+16;
 gauche11.picture.Bitmap:=nil;
 if tab_joueur1[11]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur1[11]],gauche11.picture.bitmap);

 gauche12.top:=i;
 gauche12.left:=k;
 i:=i+16;
 gauche12.picture.Bitmap:=nil;
 if tab_joueur1[12]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur1[12]],gauche12.picture.bitmap);

 gauche13.top:=i;
 gauche13.left:=k;
 gauche13.picture.Bitmap:=nil;
 if tab_joueur1[13]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur1[13]],gauche13.picture.bitmap);


i:=280; k:=450;

 droit1.top:=i;
 droit1.left:=k;
 i:=i-16;
 droit1.picture.Bitmap:=nil;
 if tab_joueur3[1]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur3[1]],droit1.picture.bitmap);

 droit2.top:=i;
 droit2.left:=k;
 i:=i-16;
 droit2.picture.Bitmap:=nil;
 if tab_joueur3[2]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur3[2]],droit2.picture.bitmap);

 droit3.top:=i;
 droit3.left:=k;
 i:=i-16;
 droit3.picture.Bitmap:=nil;
 if tab_joueur3[3]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur3[3]],droit3.picture.bitmap);

 droit4.top:=i;
 droit4.left:=k;
 i:=i-16;
 droit4.picture.Bitmap:=nil;
 if tab_joueur3[4]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur3[4]],droit4.picture.bitmap);

 droit5.top:=i;
 droit5.left:=k;
 i:=i-16;
 droit5.picture.Bitmap:=nil;
 if tab_joueur3[5]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur3[5]],droit5.picture.bitmap);

 droit6.top:=i;
 droit6.left:=k;
 i:=i-16;
 droit6.picture.Bitmap:=nil;
 if tab_joueur3[6]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur3[6]],droit6.picture.bitmap);

 droit7.top:=i;
 droit7.left:=k;
 i:=i-16;
 droit7.picture.Bitmap:=nil;
 if tab_joueur3[7]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur3[7]],droit7.picture.bitmap);

 droit8.top:=i;
 droit8.left:=k;
 i:=i-16;
 droit8.picture.Bitmap:=nil;
 if tab_joueur3[8]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur3[8]],droit8.picture.bitmap);

 droit9.top:=i;
 droit9.left:=k;
 i:=i-16;
 droit9.picture.Bitmap:=nil;
 if tab_joueur3[9]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur3[9]],droit9.picture.bitmap);

 droit10.top:=i;
 droit10.left:=k;
 i:=i-16;
 droit10.picture.Bitmap:=nil;
 if tab_joueur3[10]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur3[10]],droit10.picture.bitmap);

 droit11.top:=i;
 droit11.left:=k;
 i:=i-16;
 droit11.picture.Bitmap:=nil;
 if tab_joueur3[11]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur3[11]],droit11.picture.bitmap);

 droit12.top:=i;
 droit12.left:=k;
 i:=i-16;
 droit12.picture.Bitmap:=nil;
 if tab_joueur3[12]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur3[12]],droit12.picture.bitmap);

 droit13.top:=i;
 droit13.left:=k;
 droit13.picture.Bitmap:=nil;
 if tab_joueur3[13]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur3[13]],droit13.picture.bitmap);


i:=328; k:=8;

 haut1.left:=i;
 haut1.top:=k;
 i:=i-16;
 haut1.picture.Bitmap:=nil;
 if tab_joueur2[1]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur2[1]],haut1.picture.bitmap);

 haut2.left:=i;
 haut2.top:=k;
 i:=i-16;
 haut2.picture.Bitmap:=nil;
 if tab_joueur2[2]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur2[2]],haut2.picture.bitmap);

 haut3.left:=i;
 haut3.top:=k;
 i:=i-16;
 haut3.picture.Bitmap:=nil;
 if tab_joueur2[3]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur2[3]],haut3.picture.bitmap);

 haut4.left:=i;
 haut4.top:=k;
 i:=i-16;
 haut4.picture.Bitmap:=nil;
 if tab_joueur2[4]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur2[4]],haut4.picture.bitmap);

 haut5.left:=i;
 haut5.top:=k;
 i:=i-16;
 haut5.picture.Bitmap:=nil;
 if tab_joueur2[5]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur2[5]],haut5.picture.bitmap);

 haut6.left:=i;
 haut6.top:=k;
 i:=i-16;
 haut6.picture.Bitmap:=nil;
 if tab_joueur2[6]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur2[6]],haut6.picture.bitmap);

 haut7.left:=i;
 haut7.top:=k;
 i:=i-16;
 haut7.picture.Bitmap:=nil;
 if tab_joueur2[7]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur2[7]],haut7.picture.bitmap);

 haut8.left:=i;
 haut8.top:=k;
 i:=i-16;
 haut8.picture.Bitmap:=nil;
 if tab_joueur2[8]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur2[8]],haut8.picture.bitmap);

 haut9.left:=i;
 haut9.top:=k;
 i:=i-16;
 haut9.picture.Bitmap:=nil;
 if tab_joueur2[9]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur2[9]],haut9.picture.bitmap);

 haut10.left:=i;
 haut10.top:=k;
 i:=i-16;
 haut10.picture.Bitmap:=nil;
 if tab_joueur2[10]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur2[10]],haut10.picture.bitmap);

 haut11.left:=i;
 haut11.top:=k;
 i:=i-16;
 haut11.picture.Bitmap:=nil;
 if tab_joueur2[11]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur2[11]],haut11.picture.bitmap);

 haut12.left:=i;
 haut12.top:=k;
 i:=i-16;
 haut12.picture.Bitmap:=nil;
 if tab_joueur2[12]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur2[12]],haut12.picture.bitmap);

 haut13.left:=i;
 haut13.top:=k;
 haut13.picture.Bitmap:=nil;
 if tab_joueur2[13]<>0 then
 imagelist1.GetBitmap(tab_carte[tab_joueur2[13]],haut13.picture.bitmap);


end;




{  *************************************************
   *  procédure qui distribue aléatoirement les    *
   *   à chaque joueurs                            *
   *************************************************
   }

procedure TForm1.aleatoire();
var
   i,z:integer;
   tab:array[1..52]of integer;
begin
    for i:=1 to 52 do
    tab[i]:=0;
    randomize;
    for i:=1 to 13 do
    begin
    repeat
    z:=random(52)+1;
    until tab[z]=0;
    tab[z]:=1;
    tab_joueur1[i]:=z;
  end;
   for i:=1 to 13 do
    begin
    repeat
    z:=random(52)+1;
    until tab[z]=0;
    tab[z]:=1;
    tab_joueur2[i]:=z;
  end;
  for i:=1 to 13 do
    begin
    repeat
    z:=random(52)+1;
    until tab[z]=0;
    tab[z]:=1;
    tab_joueur3[i]:=z;
  end;
  for i:=1 to 13 do
    begin
    repeat
    z:=random(52)+1;
    until tab[z]=0;
    tab[z]:=1;
    tab_joueur4[i]:=z;
  end;

end;

{  *************************************************
   *  procédure qui trie le jeu de chaque joueurs       *
   *************************************************
   }


procedure TForm1.trie();
var
i,j:integer;
bool:boolean;
begin
repeat
bool:=true;
      for i:=1 to 12 do
       if tab_joueur1[i]>tab_joueur1[i+1] then
       begin
       bool:=false;
       j:=tab_joueur1[i];
       tab_joueur1[i]:=tab_joueur1[i+1];
       tab_joueur1[i+1]:=j;
       end;
until bool=true;

 repeat
bool:=true;
      for i:=1 to 12 do
       if tab_joueur2[i]>tab_joueur2[i+1] then
       begin
       bool:=false;
       j:=tab_joueur2[i];
       tab_joueur2[i]:=tab_joueur2[i+1];
       tab_joueur2[i+1]:=j;
       end;
until bool=true;

repeat
bool:=true;
      for i:=1 to 12 do
       if tab_joueur3[i]>tab_joueur3[i+1] then
       begin
       bool:=false;
       j:=tab_joueur3[i];
       tab_joueur3[i]:=tab_joueur3[i+1];
       tab_joueur3[i+1]:=j;
       end;
until bool=true;

repeat
bool:=true;
      for i:=1 to 12 do
       if tab_joueur4[i]>tab_joueur4[i+1] then
       begin
       bool:=false;
       j:=tab_joueur4[i];
       tab_joueur4[i]:=tab_joueur4[i+1];
       tab_joueur4[i+1]:=j;
       end;
until bool=true;
end;



{  *************************************************
   *  procédure qui aligne le jeu de carte de      *
   *   l'utilisateur sur la ligne du bas           *
   *************************************************
   }

    procedure TForm1.position_utilisateur();
    var
   i,k:integer;
begin
 i:=144; k:=334;

 image1.left:=i;
 image1.top:=k;
 i:=i+16;
 image1.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[tab_joueur4[1]],image1.picture.bitmap);

 image2.left:=i;
 image2.top:=k;
 i:=i+16;
 image2.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[tab_joueur4[2]],image2.picture.bitmap);

 image3.left:=i;
 image3.top:=k;
 i:=i+16;
 image3.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[tab_joueur4[3]],image3.picture.bitmap);

 image4.left:=i;
 image4.top:=k;
 i:=i+16;
 image4.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[tab_joueur4[4]],image4.picture.bitmap);

 image5.left:=i;
 image5.top:=k;
 i:=i+16;
 image5.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[tab_joueur4[5]],image5.picture.bitmap);

 image6.left:=i;
 image6.top:=k;
 i:=i+16;
 image6.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[tab_joueur4[6]],image6.picture.bitmap);

 image7.left:=i;
 image7.top:=k;
 i:=i+16;
 image7.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[tab_joueur4[7]],image7.picture.bitmap);

 image8.left:=i;
 image8.top:=k;
 i:=i+16;
 image8.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[tab_joueur4[8]],image8.picture.bitmap);

 image9.left:=i;
 image9.top:=k;
 i:=i+16;
 image9.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[tab_joueur4[9]],image9.picture.bitmap);

 image10.left:=i;
 image10.top:=k;
 i:=i+16;
 image10.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[tab_joueur4[10]],image10.picture.bitmap);

 image11.left:=i;
 image11.top:=k;
 i:=i+16;
 image11.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[tab_joueur4[11]],image11.picture.bitmap);

 image12.left:=i;
 image12.top:=k;
 i:=i+16;
 image12.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[tab_joueur4[12]],image12.picture.bitmap);

 image13.left:=i;
 image13.top:=k;
 image13.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[tab_joueur4[13]],image13.picture.bitmap);


end;




procedure TForm1.Image1Click(Sender: TObject);
begin
if (tab_etat[1]=1)and (NB_passe=3) then
 begin
      image1.Top:=image1.Top+16;
      tab_etat[1]:=0;
      ok.Enabled:=false;
      dec(NB_passe);
      exit;
 end;
if (manche in [1..3]) and (tour=0)and (NB_passe<3)then
begin
     if tab_etat[1]=0 then
        begin
             inc(NB_passe);
             image1.Top:=image1.Top-16;
             tab_etat[1]:=1;
             j4_passe[NB_passe]:=1;
              if NB_passe=3 then
             ok.Enabled:=true;

         end
     else
         begin
             image1.Top:=image1.Top+16;
             tab_etat[1]:=0;
             dec(NB_passe);
         end;
end;

if (tour<>0)and(verif(1)) then
begin

                   inc(nb_jouer);
                   if (nb_jouer=1)and(tab_joueur4[1] in[1..13])then
                   couleur_jouer:=1
                   else if (nb_jouer=1)and(tab_joueur4[1] in[14..26]) then
                   couleur_jouer:=2
                   else if (nb_jouer=1)and(tab_joueur4[1] in[27..39]) then
                   couleur_jouer:=3
                   else if (nb_jouer=1)and(tab_joueur4[1] in[40..52])then
                    couleur_jouer:=4;
                   tab_tour[nb_jouer]:=tab_joueur4[1];
                   if tab_joueur4[1] in[40..52] then
                   coeur_jouer:=true;
                   affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                   supprime_carte(1);
                   tab_jouer[tab_tour[nb_jouer]]:=0;
                   tab_joueur4[1]:=0;
                   if nb_jouer<>4 then
                   main:=1;
                   play();





end;




end;




procedure TForm1.Image2Click(Sender: TObject);
begin
if (tab_etat[2]=1)and (NB_passe=3) then
 begin
      image2.Top:=image2.Top+16;
      tab_etat[2]:=0;
      ok.Enabled:=false;
      dec(NB_passe);
      exit;
 end;
if (manche in [1..3]) and (tour=0)and (NB_passe<3) then
begin
     if tab_etat[2]=0 then
        begin
             inc(NB_passe);
             image2.Top:=image2.Top-16;
             tab_etat[2]:=1;
             j4_passe[NB_passe]:=2;
              if NB_passe=3 then
             ok.Enabled:=true;

         end
     else
         begin
             image2.Top:=image2.Top+16;
             tab_etat[2]:=0;
             dec(NB_passe);
         end;
end;


if (tour<>0)and(verif(2)) then
begin

                   inc(nb_jouer);
                   if (nb_jouer=1)and(tab_joueur4[2] in[1..13])then
                   couleur_jouer:=1
                   else if (nb_jouer=1)and(tab_joueur4[2] in[14..26]) then
                   couleur_jouer:=2
                   else if (nb_jouer=1)and(tab_joueur4[2] in[27..39]) then
                   couleur_jouer:=3
                   else if (nb_jouer=1)and(tab_joueur4[2] in[40..52])then
                    couleur_jouer:=4;
                   tab_tour[nb_jouer]:=tab_joueur4[2];
                   if tab_joueur4[2] in[40..52] then
                   coeur_jouer:=true;
                   affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                   supprime_carte(2);
                   tab_jouer[tab_tour[nb_jouer]]:=0;
                   tab_joueur4[2]:=0;
                   if nb_jouer<>4 then
                   main:=1;
                   play();


end;



end;

procedure TForm1.Image9Click(Sender: TObject);
begin
if (tab_etat[9]=1)and (NB_passe=3) then
 begin
      image9.Top:=image9.Top+16;
      tab_etat[9]:=0;
      ok.Enabled:=false;
      dec(NB_passe);
      exit;
 end;
if (manche in [1..3]) and (tour=0)and (NB_passe<3) then
begin
     if tab_etat[9]=0 then
        begin
             inc(NB_passe);
             image9.Top:=image9.Top-16;
             tab_etat[9]:=1;
             j4_passe[NB_passe]:=9;
              if NB_passe=3 then
             ok.Enabled:=true;

         end
     else
         begin
             image9.Top:=image9.Top+16;
             tab_etat[9]:=0;
             dec(NB_passe);
         end;
end;

if (tour<>0)and(verif(9)) then
begin

                   inc(nb_jouer);
                   if (nb_jouer=1)and(tab_joueur4[9] in[1..13])then
                   couleur_jouer:=1
                   else if (nb_jouer=1)and(tab_joueur4[9] in[14..26]) then
                   couleur_jouer:=2
                   else if (nb_jouer=1)and(tab_joueur4[9] in[27..39]) then
                   couleur_jouer:=3
                   else if (nb_jouer=1)and(tab_joueur4[9] in[40..52])then
                    couleur_jouer:=4;
                   tab_tour[nb_jouer]:=tab_joueur4[9];
                   if tab_joueur4[9] in[40..52] then
                   coeur_jouer:=true;
                   affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                   supprime_carte(9);
                   tab_jouer[tab_tour[nb_jouer]]:=0;
                   tab_joueur4[9]:=0;
                   if nb_jouer<>4 then
                   main:=1;
                   play();





end;

end;

procedure TForm1.Image8Click(Sender: TObject);
begin
if (tab_etat[8]=1)and (NB_passe=3) then
 begin
      image8.Top:=image8.Top+16;
      tab_etat[8]:=0;
       ok.Enabled:=false;
      dec(NB_passe);
      exit;
 end;
if (manche in [1..3]) and (tour=0)and (NB_passe<3) then
begin
     if tab_etat[8]=0 then
        begin
             inc(NB_passe);
             image8.Top:=image8.Top-16;
             tab_etat[8]:=1;
             j4_passe[NB_passe]:=8;
              if NB_passe=3 then
             ok.Enabled:=true;

         end
     else
         begin
             image8.Top:=image8.Top+16;
             tab_etat[8]:=0;
             dec(NB_passe);
         end;
end;

if (tour<>0)and(verif(8)) then
begin

                   inc(nb_jouer);
                   if (nb_jouer=1)and(tab_joueur4[8] in[1..13])then
                   couleur_jouer:=1
                   else if (nb_jouer=1)and(tab_joueur4[8] in[14..26]) then
                   couleur_jouer:=2
                   else if (nb_jouer=1)and(tab_joueur4[8] in[27..39]) then
                   couleur_jouer:=3
                   else if (nb_jouer=1)and(tab_joueur4[8] in[40..52])then
                    couleur_jouer:=4;
                   tab_tour[nb_jouer]:=tab_joueur4[8];
                   affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                   supprime_carte(8);
                   tab_jouer[tab_tour[nb_jouer]]:=0;
                   if tab_joueur4[8] in[40..52] then
                   coeur_jouer:=true;
                   tab_joueur4[8]:=0;
                   if nb_jouer<>4 then
                   main:=1;
                   play();





end;

end;

procedure TForm1.Image7Click(Sender: TObject);
begin
if (tab_etat[7]=1)and (NB_passe=3) then
 begin
      image7.Top:=image7.Top+16;
      tab_etat[7]:=0;
      ok.Enabled:=false;
      dec(NB_passe);
      exit;
 end;
if (manche in [1..3]) and (tour=0)and (NB_passe<3) then
begin
     if tab_etat[7]=0 then
        begin
             inc(NB_passe);
             image7.Top:=image7.Top-16;
             tab_etat[7]:=1;
             j4_passe[NB_passe]:=7;
             if NB_passe=3 then
             ok.Enabled:=true;

         end
     else
         begin
             image7.Top:=image7.Top+16;
             tab_etat[7]:=0;
             dec(NB_passe);
         end;
end;

if (tour<>0)and(verif(7)) then
begin

                   inc(nb_jouer);
                   if (nb_jouer=1)and(tab_joueur4[7] in[1..13])then
                   couleur_jouer:=1
                   else if (nb_jouer=1)and(tab_joueur4[7] in[14..26]) then
                   couleur_jouer:=2
                   else if (nb_jouer=1)and(tab_joueur4[7] in[27..39]) then
                   couleur_jouer:=3
                   else if (nb_jouer=1)and(tab_joueur4[7] in[40..52])then
                    couleur_jouer:=4;
                   tab_tour[nb_jouer]:=tab_joueur4[7];
                   affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                   supprime_carte(7);
                   tab_jouer[tab_tour[nb_jouer]]:=0;
                   if tab_joueur4[7] in[40..52] then
                   coeur_jouer:=true;
                   tab_joueur4[7]:=0;
                   if nb_jouer<>4 then
                   main:=1;
                   play();





end;

end;




procedure TForm1.Image6Click(Sender: TObject);
begin
if (tab_etat[6]=1)and (NB_passe=3) then
 begin
      image6.Top:=image6.Top+16;
      tab_etat[6]:=0;
     ok.Enabled:=false;
      dec(NB_passe);
      exit;
 end;
if (manche in [1..3]) and (tour=0)and (NB_passe<3) then
begin
     if tab_etat[6]=0 then
        begin
             inc(NB_passe);
             image6.Top:=image6.Top-16;
             tab_etat[6]:=1;
             j4_passe[NB_passe]:=6;
             if NB_passe=3 then
             ok.Enabled:=true;

         end
     else
         begin
             image6.Top:=image6.Top+16;
             tab_etat[6]:=0;
             dec(NB_passe);
         end;
end;
if (tour<>0)and(verif(6)) then
begin

                   inc(nb_jouer);
                   if (nb_jouer=1)and(tab_joueur4[6] in[1..13])then
                   couleur_jouer:=1
                   else if (nb_jouer=1)and(tab_joueur4[6] in[14..26]) then
                   couleur_jouer:=2
                   else if (nb_jouer=1)and(tab_joueur4[6] in[27..39]) then
                   couleur_jouer:=3
                   else if (nb_jouer=1)and(tab_joueur4[6] in[40..52])then
                    couleur_jouer:=4;
                   tab_tour[nb_jouer]:=tab_joueur4[6];
                   affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                   supprime_carte(6);
                   tab_jouer[tab_tour[nb_jouer]]:=0;
                   if tab_joueur4[6] in[40..52] then
                   coeur_jouer:=true;
                   tab_joueur4[6]:=0;
                   if nb_jouer<>4 then
                   main:=1;
                   play();





end;

end;

procedure TForm1.Image5Click(Sender: TObject);
begin
if (tab_etat[5]=1)and (NB_passe=3) then
 begin
      image5.Top:=image5.Top+16;
      tab_etat[5]:=0;
      ok.Enabled:=false;
      dec(NB_passe);
      exit;
 end;
if (manche in [1..3]) and (tour=0)and (NB_passe<3) then
begin
     if tab_etat[5]=0 then
        begin
             inc(NB_passe);
             image5.Top:=image5.Top-16;
             tab_etat[5]:=1;
             j4_passe[NB_passe]:=5;
             if NB_passe=3 then
             ok.Enabled:=true;

         end
     else
         begin
             image5.Top:=image5.Top+16;
             tab_etat[5]:=0;
             dec(NB_passe);
         end;
end;
 if (tour<>0)and(verif(5)) then
begin

                   inc(nb_jouer);
                   if (nb_jouer=1)and(tab_joueur4[5] in[1..13])then
                   couleur_jouer:=1
                   else if (nb_jouer=1)and(tab_joueur4[5] in[14..26]) then
                   couleur_jouer:=2
                   else if (nb_jouer=1)and(tab_joueur4[5] in[27..39]) then
                   couleur_jouer:=3
                   else if (nb_jouer=1)and(tab_joueur4[5] in[40..52])then
                    couleur_jouer:=4;
                   tab_tour[nb_jouer]:=tab_joueur4[5];
                   affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                   supprime_carte(5);
                   tab_jouer[tab_tour[nb_jouer]]:=0;
                   if tab_joueur4[5] in[40..52] then
                   coeur_jouer:=true;
                   tab_joueur4[5]:=0;
                   if nb_jouer<>4 then
                   main:=1;
                   play();





end;

end;

procedure TForm1.Image4Click(Sender: TObject);
begin
if (tab_etat[4]=1)and (NB_passe=3) then
 begin
      image4.Top:=image4.Top+16;
      tab_etat[4]:=0;

             ok.Enabled:=false;
      dec(NB_passe);
      exit;
 end;
if (manche in [1..3]) and (tour=0)and (NB_passe<3) then
begin
     if tab_etat[4]=0 then
        begin
             inc(NB_passe);
             image4.Top:=image4.Top-16;
             tab_etat[4]:=1;
             j4_passe[NB_passe]:=4;
             if NB_passe=3 then
             ok.Enabled:=true;

         end
     else
         begin
             image4.Top:=image4.Top+16;
             tab_etat[4]:=0;
             dec(NB_passe);
         end;
end;
if (tour<>0)and(verif(4)) then
begin

                   inc(nb_jouer);
                   if (nb_jouer=1)and(tab_joueur4[4] in[1..13])then
                   couleur_jouer:=1
                   else if (nb_jouer=1)and(tab_joueur4[4] in[14..26]) then
                   couleur_jouer:=2
                   else if (nb_jouer=1)and(tab_joueur4[4] in[27..39]) then
                   couleur_jouer:=3
                   else if (nb_jouer=1)and(tab_joueur4[4] in[40..52])then
                    couleur_jouer:=4;
                   tab_tour[nb_jouer]:=tab_joueur4[4];
                   affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                   supprime_carte(4);
                   if tab_joueur4[4] in[40..52] then
                   coeur_jouer:=true;
                   tab_jouer[tab_tour[nb_jouer]]:=0;
                   tab_joueur4[4]:=0;
                   if nb_jouer<>4 then
                   main:=1;
                   play();





end;

end;

procedure TForm1.Image3Click(Sender: TObject);
begin
if (tab_etat[3]=1)and (NB_passe=3) then
 begin
      image3.Top:=image3.Top+16;
      tab_etat[3]:=0;
             ok.Enabled:=false;
      dec(NB_passe);
      exit;
 end;
if (manche in [1..3]) and (tour=0)and (NB_passe<3) then
begin
     if tab_etat[3]=0 then
        begin
             inc(NB_passe);
             image3.Top:=image3.Top-16;
             tab_etat[3]:=1;
             j4_passe[NB_passe]:=3;
             if NB_passe=3 then
             ok.Enabled:=true;

         end
     else
         begin
             image3.Top:=image3.Top+16;
             tab_etat[3]:=0;
             dec(NB_passe);
         end;
end;
if (tour<>0)and(verif(3)) then
begin

                   inc(nb_jouer);
                   if (nb_jouer=1)and(tab_joueur4[3] in[1..13])then
                   couleur_jouer:=1
                   else if (nb_jouer=1)and(tab_joueur4[3] in[14..26]) then
                   couleur_jouer:=2
                   else if (nb_jouer=1)and(tab_joueur4[3] in[27..39]) then
                   couleur_jouer:=3
                   else if (nb_jouer=1)and(tab_joueur4[3] in[40..52])then
                    couleur_jouer:=4;
                   tab_tour[nb_jouer]:=tab_joueur4[3];
                   affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                   supprime_carte(3);
                   tab_jouer[tab_tour[nb_jouer]]:=0;
                   if tab_joueur4[3] in[40..52] then
                   coeur_jouer:=true;
                   tab_joueur4[3]:=0;
                   if nb_jouer<>4 then
                   main:=1;
                   play();





end;

end;

procedure TForm1.Image13Click(Sender: TObject);
begin
if (tab_etat[13]=1)and (NB_passe=3) then
 begin
      image13.Top:=image13.Top+16;
      tab_etat[13]:=0;
      ok.Enabled:=true;
      dec(NB_passe);
      exit;
 end;
if (manche in [1..3]) and (tour=0)and (NB_passe<3) then
begin
     if tab_etat[13]=0 then
        begin
             inc(NB_passe);
             image13.Top:=image13.Top-16;
             tab_etat[13]:=1;
             j4_passe[NB_passe]:=13;
             if NB_passe=3 then
             ok.Enabled:=true;

         end
     else
         begin
             image13.Top:=image13.Top+16;
             tab_etat[13]:=0;
             dec(NB_passe);
         end;
end;

if (tour<>0)and(verif(13)) then
begin

                   inc(nb_jouer);
                   if (nb_jouer=1)and(tab_joueur4[13] in[1..13])then
                   couleur_jouer:=1
                   else if (nb_jouer=1)and(tab_joueur4[13] in[14..26]) then
                   couleur_jouer:=2
                   else if (nb_jouer=1)and(tab_joueur4[13] in[27..39]) then
                   couleur_jouer:=3
                   else if (nb_jouer=1)and(tab_joueur4[13] in[40..52])then
                    couleur_jouer:=4;
                   tab_tour[nb_jouer]:=tab_joueur4[13];
                   affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                   supprime_carte(13);
                   tab_jouer[tab_tour[nb_jouer]]:=0;
                   if tab_joueur4[13] in[40..52] then
                   coeur_jouer:=true;
                   tab_joueur4[13]:=0;
                   if nb_jouer<>4 then
                   main:=1;
                   play();

 end;



 
end;

procedure TForm1.Image12Click(Sender: TObject);
begin
if (tab_etat[12]=1)and (NB_passe=3) then
 begin
      image12.Top:=image12.Top+16;
      tab_etat[12]:=0;
             ok.Enabled:=false;
      dec(NB_passe);
      exit;
 end;
if (manche in [1..3]) and (tour=0)and (NB_passe<3) then
begin
     if tab_etat[12]=0 then
        begin
             inc(NB_passe);
             image12.Top:=image12.Top-16;
             tab_etat[12]:=1;
             j4_passe[NB_passe]:=12;
             if NB_passe=3 then
             ok.Enabled:=true;

         end
     else
         begin
             image12.Top:=image12.Top+16;
             tab_etat[12]:=0;
             dec(NB_passe);
         end;
end;
if (tour<>0)and(verif(12)) then
begin

                   inc(nb_jouer);
                   if (nb_jouer=1)and(tab_joueur4[12] in[1..13])then
                   couleur_jouer:=1
                   else if (nb_jouer=1)and(tab_joueur4[12] in[14..26]) then
                   couleur_jouer:=2
                   else if (nb_jouer=1)and(tab_joueur4[12] in[27..39]) then
                   couleur_jouer:=3
                   else if (nb_jouer=1)and(tab_joueur4[12] in[40..52])then
                    couleur_jouer:=4;
                   tab_tour[nb_jouer]:=tab_joueur4[12];
                   affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                   supprime_carte(12);
                   if tab_joueur4[12] in[40..52] then
                   coeur_jouer:=true;
                   tab_jouer[tab_tour[nb_jouer]]:=0;
                   tab_joueur4[12]:=0;
                   if nb_jouer<>4 then
                   main:=1;
                   play();





end;

end;

procedure TForm1.Image11Click(Sender: TObject);
begin
if (tab_etat[11]=1)and (NB_passe=3) then
 begin
      image11.Top:=image11.Top+16;
      tab_etat[11]:=0;
             ok.Enabled:=false;
      dec(NB_passe);
      exit;
 end;
if (manche in [1..3]) and (tour=0)and (NB_passe<3) then
begin
     if tab_etat[11]=0 then
        begin
             inc(NB_passe);
             image11.Top:=image11.Top-16;
             tab_etat[11]:=1;
             j4_passe[NB_passe]:=11;
             if NB_passe=3 then
             ok.Enabled:=true;

         end
     else
         begin
             image11.Top:=image11.Top+16;
             tab_etat[11]:=0;
             dec(NB_passe);
         end;
end;
if (tour<>0)and(verif(11)) then
begin

                   inc(nb_jouer);
                   if (nb_jouer=1)and(tab_joueur4[11] in[1..13])then
                   couleur_jouer:=1
                   else if (nb_jouer=1)and(tab_joueur4[11] in[14..26]) then
                   couleur_jouer:=2
                   else if (nb_jouer=1)and(tab_joueur4[11] in[27..39]) then
                   couleur_jouer:=3
                   else if (nb_jouer=1)and(tab_joueur4[11] in[40..52])then
                    couleur_jouer:=4;
                   tab_tour[nb_jouer]:=tab_joueur4[11];
                   affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                   supprime_carte(11);
                   if tab_joueur4[11] in[40..52] then
                   coeur_jouer:=true;
                   tab_jouer[tab_tour[nb_jouer]]:=0;
                   tab_joueur4[11]:=0;
                   if nb_jouer<>4 then
                   main:=1;
                   play();





end;

end;

procedure TForm1.Image10Click(Sender: TObject);
begin
if (tab_etat[10]=1)and (NB_passe=3) then
 begin
      image10.Top:=image10.Top+16;
      tab_etat[10]:=0;
             ok.Enabled:=false;
      dec(NB_passe);
      exit;
 end;
if (manche in [1..3]) and (tour=0)and (NB_passe<3) then
begin
     if tab_etat[10]=0 then
        begin
             inc(NB_passe);
             image10.Top:=image10.Top-16;
             tab_etat[10]:=1;
             j4_passe[NB_passe]:=10;
             if NB_passe=3 then
             ok.Enabled:=true;

         end
     else
         begin
             image10.Top:=image10.Top+16;
             tab_etat[10]:=0;
             dec(NB_passe);
         end;
end;
if (tour<>0)and(verif(10)) then
begin

                   inc(nb_jouer);
                   if (nb_jouer=1)and(tab_joueur4[10] in[1..13])then
                   couleur_jouer:=1
                   else if (nb_jouer=1)and(tab_joueur4[10] in[14..26]) then
                   couleur_jouer:=2
                   else if (nb_jouer=1)and(tab_joueur4[10] in[27..39]) then
                   couleur_jouer:=3
                   else if (nb_jouer=1)and(tab_joueur4[10] in[40..52])then
                    couleur_jouer:=4;
                   tab_tour[nb_jouer]:=tab_joueur4[10];
                   affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                   supprime_carte(10);
                   tab_jouer[tab_tour[nb_jouer]]:=0;
                   if tab_joueur4[10] in[40..52] then
                   coeur_jouer:=true;
                   tab_joueur4[10]:=0;
                   if nb_jouer<>4 then
                   main:=1;
                   play();





end;

end;



procedure TForm1.passe_carte_j1();
var
   i,j1_NB_passe:integer;


begin

  j1_NB_passe:=1;
 for i:=1 to 13 do
 begin
    if tab_joueur1[i] in [37..39] then
       begin
            j1_passe[j1_NB_passe]:=i;
            inc(j1_NB_passe);
         end;
         end;
if j1_NB_passe=4 then
exit;

for i:=13 downto 1 do
begin
     if tab_joueur1[i] in [48..52] then
        begin
             j1_passe[j1_NB_passe]:=i;
              inc(j1_NB_passe);
        end;
if j1_NB_passe=4 then
exit;
 end;



for i:=13 downto 1 do
begin
     if tab_joueur1[i] in [1..26] then
        begin
             j1_passe[j1_NB_passe]:=i;
              inc(j1_NB_passe);
        end;
if j1_NB_passe=4 then
exit;
 end;


end;


procedure TForm1.passe_carte_j2();
var
   i,j2_NB_passe:integer;


begin

  j2_NB_passe:=1;
 for i:=1 to 13 do
 begin
    if tab_joueur2[i] in [37..39] then
       begin
            j2_passe[j2_NB_passe]:=i;
            inc(j2_NB_passe);
         end;
         end;
if j2_NB_passe=4then
exit;

for i:=13 downto 1 do
begin
     if tab_joueur2[i] in [48..52] then
        begin
             j2_passe[j2_NB_passe]:=i;
              inc(j2_NB_passe);
        end;
if j2_NB_passe=4 then
exit;
 end;



for i:=13 downto 1 do
begin
     if tab_joueur2[i] in [1..26] then
        begin
             j2_passe[j2_NB_passe]:=i;
              inc(j2_NB_passe);
        end;
if j2_NB_passe=4 then
exit;
 end;


end;

procedure TForm1.passe_carte_j3();
var
   i,j3_NB_passe:integer;


begin

  j3_NB_passe:=1;
 for i:=1 to 13 do
 begin
    if tab_joueur3[i] in [37..39] then
       begin
            j3_passe[j3_NB_passe]:=i;
            inc(j3_NB_passe);
         end;
         end;
if j3_NB_passe=4 then
exit;

for i:=13 downto 1 do
begin
     if tab_joueur3[i] in [48..52] then
        begin
             j3_passe[j3_NB_passe]:=i;
              inc(j3_NB_passe);
        end;
if j3_NB_passe=4 then
exit;
 end;



for i:=13 downto 1 do
begin
     if tab_joueur3[i] in [1..26] then
        begin
             j3_passe[j3_NB_passe]:=i;
              inc(j3_NB_passe);
        end;
if j3_NB_passe=4 then
exit;
 end;


end;

// procedure qui montre par des points les cartes que les autres joueur veulent passer

procedure TForm1.place_point();
var i:integer;
begin

i:=80+j1_passe[1]*16-8;
shape1.left:=90;
shape1.top:=i;
shape1.visible:=true;

i:=80+j1_passe[2]*16-8;
shape2.left:=90;
shape2.top:=i;
shape2.visible:=true;

i:=80+j1_passe[3]*16-8;
shape3.left:=90;
shape3.top:=i;
shape3.visible:=true;

// joueur n°2
i:=328-j2_passe[1]*16+76;
shape4.left:=i;
shape4.top:=107;
shape4.visible:=true;

i:=328-j2_passe[2]*16+76;
shape5.left:=i;
shape5.top:=107;
shape5.visible:=true;

i:=328-j2_passe[3]*16+76;
shape6.left:=i;
shape6.top:=107;
shape6.visible:=true;

// joueur n°3

i:=280-j3_passe[1]*16+100;
shape7.left:=442;
shape7.top:=i;
shape7.visible:=true;

i:=280-j3_passe[2]*16+100;
shape8.left:=442;
shape8.top:=i;
shape8.visible:=true;

i:=280-j3_passe[3]*16+100;
shape9.left:=442;
shape9.top:=i;
shape9.visible:=true;

end;


procedure TForm1.passe();
var a,b,c:integer;
begin
case manche of
             1:   begin
               //joueur1 passe à joueur2 à gauche
                 for a:=1 to 3 do
                   montre_carte[a]:=tab_joueur3[j3_passe[a]];
                   a:=tab_joueur1[j1_passe[1]];
                   b:=tab_joueur2[j2_passe[1]];
                   c:=tab_joueur3[j3_passe[1]];
                   tab_joueur1[j1_passe[1]]:=tab_joueur4[j4_passe[1]];
                   tab_joueur2[j2_passe[1]]:=a;
                   tab_joueur3[j3_passe[1]]:=b;
                   tab_joueur4[j4_passe[1]]:=c;

                    a:=tab_joueur1[j1_passe[2]];
                   b:=tab_joueur2[j2_passe[2]];
                   c:=tab_joueur3[j3_passe[2]];
                   tab_joueur1[j1_passe[2]]:=tab_joueur4[j4_passe[2]];
                   tab_joueur2[j2_passe[2]]:=a;
                   tab_joueur3[j3_passe[2]]:=b;
                   tab_joueur4[j4_passe[2]]:=c;

                    a:=tab_joueur1[j1_passe[3]];
                   b:=tab_joueur2[j2_passe[3]];
                   c:=tab_joueur3[j3_passe[3]];
                   tab_joueur1[j1_passe[3]]:=tab_joueur4[j4_passe[3]];
                   tab_joueur2[j2_passe[3]]:=a;
                   tab_joueur3[j3_passe[3]]:=b;
                   tab_joueur4[j4_passe[3]]:=c;

               end;


             2:
               begin

                   for a:=1 to 3 do
                   montre_carte[a]:=tab_joueur1[j1_passe[a]];
                   a:=tab_joueur1[j1_passe[1]];
                   b:=tab_joueur2[j2_passe[1]];
                   c:=tab_joueur3[j3_passe[1]];
                   tab_joueur1[j1_passe[1]]:=b;
                   tab_joueur2[j2_passe[1]]:=c;
                   tab_joueur3[j3_passe[1]]:=tab_joueur4[j4_passe[1]];
                   tab_joueur4[j4_passe[1]]:=a;

                   a:=tab_joueur1[j1_passe[2]];
                   b:=tab_joueur2[j2_passe[2]];
                   c:=tab_joueur3[j3_passe[2]];
                   tab_joueur1[j1_passe[2]]:=b;
                   tab_joueur2[j2_passe[2]]:=c;
                   tab_joueur3[j3_passe[2]]:=tab_joueur4[j4_passe[2]];
                   tab_joueur4[j4_passe[2]]:=a;

                   a:=tab_joueur1[j1_passe[3]];
                   b:=tab_joueur2[j2_passe[3]];
                   c:=tab_joueur3[j3_passe[3]];
                   tab_joueur1[j1_passe[3]]:=b;
                   tab_joueur2[j2_passe[3]]:=c;
                   tab_joueur3[j3_passe[3]]:=tab_joueur4[j4_passe[3]];
                   tab_joueur4[j4_passe[3]]:=a;

               end;

             3:  begin
                   for a:=1 to 3 do
                   montre_carte[a]:=tab_joueur2[j2_passe[a]];
                   a:=tab_joueur1[j1_passe[1]];
                   c:=tab_joueur2[j2_passe[1]];
                   tab_joueur1[j1_passe[1]]:=tab_joueur3[j3_passe[1]];
                   tab_joueur2[j2_passe[1]]:=tab_joueur4[j4_passe[1]];
                   tab_joueur3[j3_passe[1]]:=a;
                   tab_joueur4[j4_passe[1]]:=c;

                   a:=tab_joueur1[j1_passe[2]];
                   c:=tab_joueur2[j2_passe[2]];
                   tab_joueur1[j1_passe[2]]:=tab_joueur3[j3_passe[2]];
                   tab_joueur2[j2_passe[2]]:=tab_joueur4[j4_passe[2]];
                   tab_joueur3[j3_passe[2]]:=a;
                   tab_joueur4[j4_passe[2]]:=c;

                   a:=tab_joueur1[j1_passe[3]];
                   c:=tab_joueur2[j2_passe[3]];
                   tab_joueur1[j1_passe[3]]:=tab_joueur3[j3_passe[3]];
                   tab_joueur2[j2_passe[3]]:=tab_joueur4[j4_passe[3]];
                   tab_joueur3[j3_passe[3]]:=a;
                   tab_joueur4[j4_passe[3]]:=c;


                end;


      end;
end;


procedure TForm1.okClick(Sender: TObject);
var
   i:integer;
begin
if montre=true then
                begin
                baisse_carte();
                play();
                montre:=false;
                ok.visible:=false;
                exit;
                end;

     case tour of
          0: begin
             for i:=1 to 13 do tab_etat[i]:=0;
             passe();
             trie();
             position_utilisateur();
             if affichage then
             begin
                  demasquer();
             end;
             NB_passe:=0;
             ok.enabled:=true;
             ok.Caption:='OK';
             montrer_carte();
             montre:=true;
              inc(tour);
             cache_point();
             if tour=14 then
                begin
                     tour:=0;
                     inc(manche);
                     case manche of
                                 2:ok.caption:='à droite';
                                 3:ok.caption:='en face';
                                 4:ok.caption:='Jouer';
                                 5: begin
                                         ok.caption:='à gauche';
                                         manche:=1;
                                     end;
                     end;


                end;

             end;





     end;
end;

procedure TForm1.montrer_carte();
var
   i,j:integer;
begin
     for i:=1 to 3 do
     for j:=1 to 13 do
     begin
          if montre_carte[i]=tab_joueur4[j] then
             case j of
                    1 : image1.Top:=image1.Top-16;
                    2 : image2.Top:=image2.Top-16;
                    3 : image3.Top:=image3.Top-16;
                    4 : image4.Top:=image4.Top-16;
                    5 : image5.Top:=image5.Top-16;
                    6 : image6.Top:=image6.Top-16;
                    7 : image7.Top:=image7.Top-16;
                    8 : image8.Top:=image8.Top-16;
                    9 : image9.Top:=image9.Top-16;
                    10: image10.Top:=image10.Top-16;
                    11: image11.Top:=image11.Top-16;
                    12: image12.Top:=image12.Top-16;
                    13: image13.Top:=image13.Top-16;
             end;
     end;
end;

procedure TForm1.baisse_carte();
var
   i,j:integer;
begin
     for i:=1 to 3 do
     for j:=1 to 13 do
     begin
          if montre_carte[i]=tab_joueur4[j] then
             case j of
                    1 : image1.Top:=image1.Top+16;
                    2 : image2.Top:=image2.Top+16;
                    3 : image3.Top:=image3.Top+16;
                    4 : image4.Top:=image4.Top+16;
                    5 : image5.Top:=image5.Top+16;
                    6 : image6.Top:=image6.Top+16;
                    7 : image7.Top:=image7.Top+16;
                    8 : image8.Top:=image8.Top+16;
                    9 : image9.Top:=image9.Top+16;
                    10: image10.Top:=image10.Top+16;
                    11: image11.Top:=image11.Top+16;
                    12: image12.Top:=image12.Top+16;
                    13: image13.Top:=image13.Top+16;
             end;
     end;
end;
procedure TForm1.cache_point();
begin
shape1.visible:=false;
shape2.visible:=false;
shape3.visible:=false;
shape4.visible:=false;
shape5.visible:=false;
shape6.visible:=false;
shape7.visible:=false;
shape8.visible:=false;
shape9.visible:=false;
end;

function TForm1.play_joueur(var t:array of integer):integer;
 var
    i,ret,a:integer;
    petit,get_color,point:boolean;

begin
petit:=false;
point:=false;
get_color:=false;
 ret:=0;
 a:=0;
case couleur_jouer of
                 1:begin
                      if tour=1 then
                       begin

                            for i:=12 downto 0 do
                             if (t[i]>0)and(t[i]<14) then
                             begin
                                 ret:=i+1;
                                 break;
                             end;


                       end ;

                                       for i:=1 to nb_jouer do
                                        begin
                                         if (tab_tour[i] in [1..13])and(tab_tour[i]>a) then
                                          a:=tab_tour[i];
                                         if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                           point:=true;
                                        end;

                                             for i:=12 downto 0 do
                                             begin
                                             if t[i]in[1..13] then
                                                 get_color:=true;
                                               if (t[i]<a)and(t[i]in[1..13]) then
                                               petit:=true;
                                             end;


                    if nb_jouer<4 then
                       begin
                             if (ret=0)and(petit)and(get_color) then
                                begin
                                     for i:=12 downto 0 do
                                     begin
                                          if (t[i]<a)and(t[i]in[1..13]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;

                             if (ret=0)and(not petit)and(get_color) then
                                begin
                                     for i:=0 to 12 do
                                     begin
                                          if (t[i]>a)and(t[i]in[1..13]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;

                             if (ret=0)and(not get_color) then
                                  ret:=decharger(t);


                       end;

                       if nb_jouer=4 then
                          begin
                             if (ret=0)and(get_color)and(not point) then
                                begin
                                     for i:=12 downto 0 do
                                     begin
                                          if (t[i]in[1..13]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;

                             if (ret=0)and(petit)and(get_color) then
                                begin
                                     for i:=12 downto 0 do
                                     begin
                                          if (t[i]<a)and(t[i]in[1..13]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;

                             if (ret=0)and(not petit)and(get_color) then
                                begin
                                     for i:=0 to 12 do
                                     begin
                                          if (t[i]>a)and(t[i]in[1..13]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;


                             if (ret=0)and(not get_color) then
                                  ret:=decharger(t);


                       end;



                 end;





                    2:begin


                                       for i:=1 to nb_jouer do
                                        begin
                                         if (tab_tour[i] in [14..26])and(tab_tour[i]>a) then
                                          a:=tab_tour[i];
                                         if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                           point:=true;
                                        end;

                                             for i:=12 downto 0 do
                                             begin
                                             if t[i]in[14..26] then
                                                 get_color:=true;
                                               if (t[i]<a)and(t[i]in[14..26]) then
                                               petit:=true;
                                             end;


                    if nb_jouer<4 then
                       begin
                             if (ret=0)and(petit)and(get_color) then
                                begin
                                     for i:=12 downto 0 do
                                     begin
                                          if (t[i]<a)and(t[i]in[14..26]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;

                             if (ret=0)and(not petit)and(get_color) then
                                begin
                                     for i:=0 to 12 do
                                     begin
                                          if (t[i]>a)and(t[i]in[14..26]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;

                             if (ret=0)and(not get_color) then
                                  ret:=decharger(t);


                       end;

                       if nb_jouer=4 then
                          begin
                             if (ret=0)and(get_color)and(not point) then
                                begin
                                     for i:=12 downto 0 do
                                     begin
                                          if (t[i]in[14..26]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;

                             if (ret=0)and(petit)and(get_color) then
                                begin
                                     for i:=12 downto 0 do
                                     begin
                                          if (t[i]<a)and(t[i]in[14..26]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;

                             if (ret=0)and(not petit)and(get_color) then
                                begin
                                     for i:=0 to 12 do
                                     begin
                                          if (t[i]>a)and(t[i]in[14..26]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;


                             if (ret=0)and(not get_color) then
                                  ret:=decharger(t);


                       end;



                 end;




       3: begin


                                       for i:=1 to nb_jouer do
                                        begin
                                         if (tab_tour[i] in [27..39])and(tab_tour[i]>a) then
                                          a:=tab_tour[i];
                                         if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                           point:=true;
                                        end;

                                             for i:=12 downto 0 do
                                             begin
                                             if t[i]in[27..39] then
                                                 get_color:=true;
                                               if (t[i]<a)and(t[i]in[27..39]) then
                                               petit:=true;
                                             end;


                    if nb_jouer<4 then
                       begin
                             if (ret=0)and(petit)and(get_color) then
                                begin
                                     for i:=10 downto 0 do
                                     begin
                                          if (t[i]<a)and(t[i]in[27..39]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;

                             if (ret=0)and(not petit)and(get_color) then
                                begin
                                     for i:=0 to 12 do
                                     begin
                                          if (t[i]>a)and(t[i]in[27..39]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;

                             if (ret=0)and(not get_color) then
                                  ret:=decharger(t);


                       end;

                       if nb_jouer=4 then
                          begin
                             if (ret=0)and(get_color)and(not point) then
                                begin
                                     for i:=12 downto 0 do
                                     begin
                                          if (t[i]in[27..39]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;

                             if (ret=0)and(petit)and(get_color) then
                                begin
                                     for i:=12 downto 0 do
                                     begin
                                          if (t[i]<a)and(t[i]in[27..39]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;

                             if (ret=0)and(not petit)and(get_color) then
                                begin
                                     for i:=0 to 12 do
                                     begin
                                          if (t[i]>a)and(t[i]in[27..39]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;


                             if (ret=0)and(not get_color) then
                                  ret:=decharger(t);


                       end;



                 end;




             4    :
                     begin

                                  for i:=1 to nb_jouer do
                                        begin
                                         if (tab_tour[i] in [40..52])and(tab_tour[i]>a) then
                                          a:=tab_tour[i];
                                         if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                           point:=true;
                                        end;

                                             for i:=12 downto 0 do
                                             begin
                                             if t[i]in[40..52] then
                                                 get_color:=true;
                                               if (t[i]<a)and(t[i]in[40..52]) then
                                               petit:=true;
                                             end;


                   if nb_jouer<4 then
                       begin
                             if (ret=0)and(petit)and(get_color) then
                                begin
                                     for i:=12 downto 0 do
                                     begin
                                          if (t[i]<a)and(t[i]in[40..52]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;

                             if (ret=0)and(not petit)and(get_color) then
                                begin
                                     for i:=0 to 12 do
                                     begin
                                          if (t[i]>a)and(t[i]in[40..52]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;

                             if (ret=0)and(not get_color) then
                                  ret:=decharger(t);


                       end;

                   if nb_jouer=4 then
                      begin
                              if (ret=0)and(not point)and(get_color) then
                                begin
                                     for i:=12 downto 0 do
                                     begin
                                          if (t[i]in[40..52]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;
                              if (ret=0)and(petit)and(get_color)and(point) then
                                begin
                                     for i:=12 downto 0 do
                                     begin
                                          if (t[i]<a)and(t[i]in[40..52]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;
                                if (ret=0)and(not petit)and(get_color) then
                                begin
                                     for i:=0 to 12 do
                                     begin
                                          if (t[i]>a)and(t[i]in[40..52]) then
                                          begin
                                               ret:=i+1;
                                               break;
                                          end;
                                      end;
                                end;

                             if (ret=0)and(not get_color) then
                             ret:=decharger(t);

                      end;





         end;
  end;
  Result:=ret;
end;

function TForm1.ouvre_tour(var t:array of integer):integer;
var
   nb_pic,i,ret:integer;
   get_pic:boolean;
 begin
    ret:=0;
    nb_pic:=0;
    get_pic:=false;
    if tour=1 then
    begin
         if t[1]<>1 then
          ret:=0
          else
              ret:=1;

     end
     else
         begin
              for i:=0 to 12 do
                  begin
                       if t[i]in[37..39] then
                       get_pic:=true;
                       if t[i]in[27..39] then
                       inc(nb_pic);
                  end;
              if (not get_pic)and(nb_pic<>0) then
                 begin
                      for i:=12 downto 0 do
                          begin
                               if t[i]in[27..39] then
                                  begin
                                       ret:=i+1;
                                       break;
                                  end;
                          end;
                 end;

              if (ret=0)and(coeur_jouer) then
              begin
                   for i:=0 to 12 do
                   begin
                        if (t[i] in[40..49])then
                          begin
                               ret:=i+1;
                               break;
                          end;
                   end;
              end;


              if (ret=0) then
              begin
                   for i:=0 to 12 do
                   begin
                        if (t[i] in[1..8])and(t[i]<49) then
                          begin
                               ret:=i+1;
                               break;
                          end;
                   end;
              end;

               if (ret=0) then
              begin
                   for i:=0 to 12 do
                   begin
                        if (t[i] in[14..22])and(t[i]<49) then
                          begin
                               ret:=i+1;
                               break;
                          end;
                   end;
              end;

               if (ret=0) then
              begin
                   for i:=0 to 12 do
                   begin
                        if (t[i]<>0) then
                          begin
                               ret:=i+1;
                               break;
                          end;
                   end;
              end;





         end;

  result:=ret;

 end;


Function TForm1.Decharger(var t:array of integer):integer;
var
   i,ret:integer;
begin
     ret:=0;
    if (tab_jouer[37]<>0)then
    begin
         for i:=0 to 12 do
         begin
              if t[i] in[37..39] then
              begin
                   ret:=i+1;
                   break;
              end;
         end;
    end;

    if ret=0 then
    begin
         for i:=12 downto 0 do
         begin
              if t[i]in[44..52] then
              begin
                   ret:=i+1;
                   break;
              end;
         end;
    end;

     if ret=0 then
    begin
         for i:=12 downto 0 do
         begin
              if t[i]in[33..39] then
              begin
                   ret:=i+1;
                   break;
              end;
         end;
    end;

     if ret=0 then
    begin
         for i:=12 downto 0 do
         begin
              if t[i]in[7..13] then
              begin
                   ret:=i+1;
                   break;
              end;
         end;
    end;

     if ret=0 then
    begin
         for i:=0 to 12 do
         begin
              if t[i]<>0 then
              begin
                   ret:=i+1;
                   break;
              end;
         end;
    end;


Result:=ret;

end;


procedure TForm1.Button1Click(Sender: TObject);
begin
passe_carte_j1();
passe_carte_j2();
passe_carte_j3();
place_point();
end;

procedure TForm1.play();
var
   val:integer;
begin
//if nb_jouer=4 then
//calcul_point();

 if (nb_jouer=0)and(tour=1) then
    begin
         if tab_joueur1[1]=1 then
            begin
              main:=1;
              inc(nb_jouer);
              affiche_carte(tab_carte[1]);
              supprime_carte(1);
              tab_jouer[1]:=0;
              tab_joueur1[1]:=0;
              tab_tour[nb_jouer]:=1;
              couleur_jouer:=1;
              inc(main);
            end
          else if tab_joueur2[1]=1 then
            begin
              main:=2;
              inc(nb_jouer);
              affiche_carte(tab_carte[1]);
              tab_jouer[1]:=0;
              tab_joueur2[1]:=0;
              supprime_carte(1);
              tab_tour[nb_jouer]:=1;
              couleur_jouer:=1;
              inc(main);
            end
          else if tab_joueur3[1]=1 then
            begin
              main:=3;
              inc(nb_jouer);
              affiche_carte(tab_carte[1]);
              tab_jouer[1]:=0;
              supprime_carte(1);
              tab_joueur3[1]:=0;
              tab_tour[nb_jouer]:=1;
              couleur_jouer:=1;
              inc(main);
            end
         else
         begin
         statusbar1.SimpleText:='A vous de commencer';
          main:=4;
          exit;
          end;
    end;


    if (main=1)and(nb_jouer<4) then
       begin
            if nb_jouer=0 then
             begin
                   inc(nb_jouer);
                   val:=ouvre_tour(tab_joueur1);
                   if tab_joueur1[val]in [1..13] then
                   couleur_jouer:=1
                   else if tab_joueur1[val] in[14..26] then
                   couleur_jouer:=2
                   else if tab_joueur1[val] in[27..39] then
                   couleur_jouer:=3
                   else
                    couleur_jouer:=4;
                   tab_tour[nb_jouer]:=tab_joueur1[val];
                   affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                   tab_jouer[tab_tour[nb_jouer]]:=0;
                   tab_joueur1[val]:=0;
                   supprime_carte(val);
                   if nb_jouer<4 then
                   inc(main);
             end
             else
                 begin
                       inc(nb_jouer);
                      val:=play_joueur(tab_joueur1);
                      if tab_joueur1[val]in[40..52] then
                      coeur_jouer:=true;
                      tab_tour[nb_jouer]:=tab_joueur1[val];
                      affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                      supprime_carte(val);
                      tab_jouer[tab_tour[nb_jouer]]:=0;
                      tab_joueur1[val]:=0;
                      if nb_jouer<4 then
                      inc(main);
                 end;
       end;


    if (main=2)and(nb_jouer<4) then
       begin
            if nb_jouer=0 then
             begin
                   inc(nb_jouer);
                   val:=ouvre_tour(tab_joueur2);
                   if tab_joueur2[val] in[1..13] then
                   couleur_jouer:=1
                   else if tab_joueur2[val]in[14..26] then
                   couleur_jouer:=2
                   else if tab_joueur2[val]in[27..39] then
                   couleur_jouer:=3
                   else
                    couleur_jouer:=4;
                   tab_tour[nb_jouer]:=tab_joueur2[val];
                   affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                   supprime_carte(val);
                   tab_jouer[tab_tour[nb_jouer]]:=0;
                   tab_joueur2[val]:=0;
                   if nb_jouer<4 then
                   inc(main);
             end
             else
                 begin
                      inc(nb_jouer);
                      val:=play_joueur(tab_joueur2);
                      if tab_joueur2[val]in[40..52] then
                      coeur_jouer:=true;
                      tab_tour[nb_jouer]:=tab_joueur2[val];
                      affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                      supprime_carte(val);
                      tab_jouer[tab_tour[nb_jouer]]:=0;
                      tab_joueur2[val]:=0;
                      if nb_jouer<4 then
                      inc(main);
                 end;
       end;

    if (main=3)and(nb_jouer<4) then
       begin
            if nb_jouer=0 then
             begin
                   inc(nb_jouer);
                   val:=ouvre_tour(tab_joueur3);
                   if tab_joueur3[val] in[1..13] then
                   couleur_jouer:=1
                   else if tab_joueur3[val] in[14..26] then
                   couleur_jouer:=2
                   else if tab_joueur3[val] in[27..39] then
                   couleur_jouer:=3
                   else
                    couleur_jouer:=4;
                   tab_tour[nb_jouer]:=tab_joueur3[val];
                   affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                   supprime_carte(val);
                   tab_joueur3[val]:=0;
                   tab_jouer[tab_tour[nb_jouer]]:=0;
                   if nb_jouer<4 then
                   inc(main);
             end
             else
                 begin
                      inc(nb_jouer);
                      val:=play_joueur(tab_joueur3);
                      if tab_joueur3[val]in[40..52] then
                      coeur_jouer:=true;
                      tab_tour[nb_jouer]:=tab_joueur3[val];
                      affiche_carte(tab_carte[tab_tour[nb_jouer]]);
                      supprime_carte(val);
                      tab_joueur3[val]:=0;
                      tab_jouer[tab_tour[nb_jouer]]:=0;
                      if nb_jouer<4 then
                      inc(main);
                 end;
       end;
  if nb_jouer=4 then
     calcul_point()
  else
      statusbar1.Simpletext:='A vous de jouer';


end;

procedure TForm1.affiche_carte(i:integer);
begin
case main of
            1:
              begin
                   case nb_jouer of
                                   1:begin  carte1.top:=170;
                                            carte1.left:=193;
                                            carte1.picture.Bitmap:=nil;
                                            imagelist1.GetBitmap(i,carte1.picture.bitmap);
                                     end;

                                   2:begin   carte2.top:=170;
                                             carte2.left:=193;
                                             carte2.picture.Bitmap:=nil;
                                             imagelist1.GetBitmap(i,carte2.picture.bitmap);
                                     end;

                                   3:begin   carte3.top:=170;
                                             carte3.left:=193;
                                             carte3.picture.Bitmap:=nil;
                                             imagelist1.GetBitmap(i,carte3.picture.bitmap);
                                     end;

                                   4:begin   carte4.top:=170;
                                             carte4.left:=193;
                                             carte4.picture.Bitmap:=nil;
                                             imagelist1.GetBitmap(i,carte4.picture.bitmap);
                                     end;
                   end;
              end;

            2:
              begin
                   case nb_jouer of
                                   1:begin  carte1.top:=121;
                                            carte1.left:=227;
                                            carte1.picture.Bitmap:=nil;
                                            imagelist1.GetBitmap(i,carte1.picture.bitmap);
                                     end;

                                   2:begin   carte2.top:=121;
                                             carte2.left:=227;
                                             carte2.picture.Bitmap:=nil;
                                             imagelist1.GetBitmap(i,carte2.picture.bitmap);
                                     end;

                                   3:begin   carte3.top:=121;
                                             carte3.left:=227;
                                             carte3.picture.Bitmap:=nil;
                                             imagelist1.GetBitmap(i,carte3.picture.bitmap);
                                     end;

                                   4:begin   carte4.top:=121;
                                             carte4.left:=227;
                                             carte4.picture.Bitmap:=nil;
                                             imagelist1.GetBitmap(i,carte4.picture.bitmap);
                                     end;
                   end;
              end;

            3:
              begin
                   case nb_jouer of
                                   1:begin  carte1.top:=170;
                                            carte1.left:=263;
                                            carte1.picture.Bitmap:=nil;
                                            imagelist1.GetBitmap(i,carte1.picture.bitmap);
                                     end;

                                   2:begin   carte2.top:=170;
                                             carte2.left:=263;
                                             carte2.picture.Bitmap:=nil;
                                             imagelist1.GetBitmap(i,carte2.picture.bitmap);
                                     end;

                                   3:begin   carte3.top:=170;
                                             carte3.left:=263;
                                             carte3.picture.Bitmap:=nil;
                                             imagelist1.GetBitmap(i,carte3.picture.bitmap);
                                     end;

                                   4:begin   carte4.top:=170;
                                             carte4.left:=263;
                                             carte4.picture.Bitmap:=nil;
                                             imagelist1.GetBitmap(i,carte4.picture.bitmap);
                                     end;
                   end;
              end;
            4:
              begin
                   case nb_jouer of
                                   1:begin  carte1.top:=216;
                                            carte1.left:=227;
                                            carte1.picture.Bitmap:=nil;
                                            imagelist1.GetBitmap(i,carte1.picture.bitmap);
                                     end;

                                   2:begin   carte2.top:=216;
                                             carte2.left:=227;
                                             carte2.picture.Bitmap:=nil;
                                             imagelist1.GetBitmap(i,carte2.picture.bitmap);
                                     end;

                                   3:begin   carte3.top:=216;
                                             carte3.left:=227;
                                             carte3.picture.Bitmap:=nil;
                                             imagelist1.GetBitmap(i,carte3.picture.bitmap);
                                     end;

                                   4:begin   carte4.top:=216;
                                             carte4.left:=227;
                                             carte4.picture.Bitmap:=nil;
                                             imagelist1.GetBitmap(i,carte4.picture.bitmap);
                                     end;
                   end;
              end;



 end;


end;


procedure TForm1.supprime_carte(k:integer);
begin
case main of
            1: begin
                    if k=1 then
                         gauche1.picture.Bitmap:=nil
                    else if k=2 then
                         gauche2.picture.Bitmap:=nil
                    else if k=3 then
                         gauche3.picture.Bitmap:=nil
                    else if k=4 then
                         gauche4.picture.Bitmap:=nil
                    else if k=5 then
                         gauche5.picture.Bitmap:=nil
                    else if k=6 then
                         gauche6.picture.Bitmap:=nil
                    else if k=7 then
                         gauche7.picture.Bitmap:=nil
                    else if k=8 then
                         gauche8.picture.Bitmap:=nil
                    else if k=9 then
                         gauche9.picture.Bitmap:=nil
                    else if k=10 then
                         gauche10.picture.Bitmap:=nil
                    else if k=11 then
                         gauche11.picture.Bitmap:=nil
                    else if k=12 then
                         gauche12.picture.Bitmap:=nil
                    else
                         gauche13.picture.Bitmap:=nil
              end;

            2: begin
                    if k=1 then
                         haut1.picture.Bitmap:=nil
                    else if k=2 then
                         haut2.picture.Bitmap:=nil
                    else if k=3 then
                         haut3.picture.Bitmap:=nil
                    else if k=4 then
                         haut4.picture.Bitmap:=nil
                    else if k=5 then
                         haut5.picture.Bitmap:=nil
                    else if k=6 then
                         haut6.picture.Bitmap:=nil
                    else if k=7 then
                         haut7.picture.Bitmap:=nil
                    else if k=8 then
                         haut8.picture.Bitmap:=nil
                    else if k=9 then
                         haut9.picture.Bitmap:=nil
                    else if k=10 then
                         haut10.picture.Bitmap:=nil
                    else if k=11 then
                         haut11.picture.Bitmap:=nil
                    else if k=12 then
                         haut12.picture.Bitmap:=nil
                    else
                         haut13.picture.Bitmap:=nil
              end;

            3:   begin
                    if k=1 then
                         droit1.picture.Bitmap:=nil
                    else if k=2 then
                         droit2.picture.Bitmap:=nil
                    else if k=3 then
                         droit3.picture.Bitmap:=nil
                    else if k=4 then
                         droit4.picture.Bitmap:=nil
                    else if k=5 then
                         droit5.picture.Bitmap:=nil
                    else if k=6 then
                         droit6.picture.Bitmap:=nil
                    else if k=7 then
                         droit7.picture.Bitmap:=nil
                    else if k=8 then
                         droit8.picture.Bitmap:=nil
                    else if k=9 then
                         droit9.picture.Bitmap:=nil
                    else if k=10 then
                         droit10.picture.Bitmap:=nil
                    else if k=11 then
                         droit11.picture.Bitmap:=nil
                    else if k=12 then
                         droit12.picture.Bitmap:=nil
                    else
                         droit13.picture.Bitmap:=nil
              end;

            4:   begin
                    if k=1 then
                         image1.Visible:=false
                    else if k=2 then
                         image2.Visible:=false
                    else if k=3 then
                         image3.Visible:=false
                    else if k=4 then
                         image4.Visible:=false
                    else if k=5 then
                         image5.Visible:=false
                    else if k=6 then
                         image6.Visible:=false
                    else if k=7 then
                         image7.Visible:=false
                    else if k=8 then
                         image8.Visible:=false
                    else if k=9 then
                         image9.Visible:=false
                    else if k=10 then
                         image10.Visible:=false
                    else if k=11 then
                         image11.Visible:=false
                    else if k=12 then
                         image12.Visible:=false
                    else
                         image13.Visible:=false;
              end;


     end;






end;

Function Tform1.Verif(k:integer):boolean;
var
   i:integer;
   bool,good:boolean;

begin
        good:=false;
        bool:=false;

       if (tour=1)then
          begin
          if (nb_jouer=0) then
             begin
              if (tab_joueur4[1]=1)and(k<>1) then
                 statusbar1.SimpleText:='Vous devez jouer le 2 de trèfle'
               else
                   begin
                   couleur_jouer:=1;
                   good:=true;
                   end;
               end
          else
              begin
                  for i:=1 to 13 do
                  begin
                   if tab_joueur4[i]in[1..13] then
                   bool:=true;
                  end;
                if bool then
                   begin
                        if (tab_joueur4[k]in[1..13]) then
                            good:=true
                        else
                            statusbar1.SimpleText:='Vous devez jouer du trèfle';
                   end
                else
                    begin
                         if (tab_joueur4[k]in[40..52])or(tab_joueur4[k]=37) then
                           statusbar1.SimpleText:='Vous ne pouvez pas jouer des cartes à point au premier tour'
                         else
                             good:=true;
                    end;
               end;

          end;

if (tour>1)and(nb_jouer=0) then
begin
    if (tab_joueur4[k]in[40..52])and(coeur_jouer=true) then
       good:=true
    else if tab_joueur4[k]in[1..40]then
         good:=true
    else
        statusbar1.SimpleText:='Les coeur n''ont pas encore été jouer';
end;

if (nb_jouer<>0)and(tour>1) then
   begin
        case couleur_jouer of

                             1: begin
                                      for i:=1 to 13 do
                                          begin
                                          if tab_joueur4[i]in[1..13] then
                                          bool:=true;
                                          end;

                                    if bool then
                                       begin
                                            if (tab_joueur4[k]in[1..13]) then
                                             good:=true
                                            else
                                             statusbar1.simpletext:='vous devez jouer du trèfle';
                                       end
                                    else
                                        good:=true;
                                end;

                             2: begin
                                      for i:=1 to 13 do
                                          begin
                                          if tab_joueur4[i]in[14..26] then
                                          bool:=true;
                                          end;

                                    if bool then
                                       begin
                                            if (tab_joueur4[k]in[14..26]) then
                                             good:=true
                                            else
                                             statusbar1.simpletext:='vous devez jouer du Carreau';
                                       end
                                    else
                                        good:=true;
                                end;

                             3: begin
                                      for i:=1 to 13 do
                                          begin
                                          if tab_joueur4[i]in[27..39] then
                                          bool:=true;
                                          end;

                                    if bool then
                                       begin
                                            if (tab_joueur4[k]in[27..39]) then
                                             good:=true
                                            else
                                             statusbar1.simpletext:='vous devez jouer du Pic';
                                       end
                                    else
                                        good:=true;
                                end;

                             4: begin
                                      for i:=1 to 13 do
                                          begin
                                          if tab_joueur4[i]in[40..52] then
                                          bool:=true;
                                          end;

                                    if bool then
                                       begin
                                            if (tab_joueur4[k]in[40..52]) then
                                             good:=true
                                            else
                                             statusbar1.simpletext:='vous devez jouer du Couer';
                                       end
                                    else
                                        good:=true;
                                end;





                 end;

       end;

result:=good;
end;





Procedure TForm1.calcul_point();
var
   val,i,point,j:integer;
begin
val:=1;
point:=0;
   if tab_tour[1]=37 then
      point:=13;
   if tab_tour[1]in[40..52] then
      point:=1;


     if tab_tour[1]in[1..13] then
        begin
         for i:=2 to 4 do
         begin
               if (tab_tour[val]<tab_tour[i])and(tab_tour[i]in[1..13]) then
                val:=i;
               if (tab_tour[i]in[40..52]) then
               inc(point);
               if tab_tour[i]=37 then
               point:=point+13;
         end;
        end;

     if tab_tour[1]in[14..26] then
        begin
         for i:=2 to 4 do
         begin
               if (tab_tour[val]<tab_tour[i])and(tab_tour[i]in[14..26]) then
                val:=i;
               if (tab_tour[i]in[40..52]) then
               inc(point);
               if tab_tour[i]=37 then
               point:=point+13;
         end;
        end;

     if tab_tour[1]in[27..39] then
        begin
         for i:=2 to 4 do
         begin
               if (tab_tour[val]<tab_tour[i])and(tab_tour[i]in[27..39]) then
                val:=i;
               if (tab_tour[i]in[40..52]) then
               inc(point);
               if tab_tour[i]=37 then
               point:=point+13;
         end;
        end;

     if tab_tour[1]in[40..52] then
        begin
         for i:=2 to 4 do
         begin
               if (tab_tour[val]<tab_tour[i])and(tab_tour[i]in[40..52]) then
                val:=i;
               if (tab_tour[i]in[40..52]) then
               inc(point);
               if tab_tour[i]=37 then
               point:=point+13;
         end;
        end;



     case main of
                   1: begin
                      case val of
                                 1: begin
                                        main:=2;
                                        nb_point_j2:=nb_point_j2+point;
                                          for i:=1 to 4 do
                                              begin
                                                   if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                                      begin
                                                       j:=0;
                                                         repeat
                                                               inc(j);
                                                         until(point_j2[j]=0)or(j=14);
                                                         point_j2[j]:=tab_tour[i];
                                                       end;
                                              end;
                                    end;
                                 2: begin
                                        main:=3;
                                        nb_point_j3:=nb_point_j3+point;
                                          for i:=1 to 4 do
                                              begin
                                                   if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                                      begin
                                                       j:=0;
                                                         repeat
                                                               inc(j);
                                                         until(point_j3[j]=0)or(j=14);
                                                         point_j3[j]:=tab_tour[i];
                                                       end;
                                              end;
                                    end;
                                 3: begin
                                        main:=4;
                                        nb_point_j4:=nb_point_j4+point;
                                          for i:=1 to 4 do
                                              begin
                                                   if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                                      begin
                                                       j:=0;
                                                         repeat
                                                               inc(j);
                                                         until(point_j4[j]=0)or(j=14);
                                                         point_j4[j]:=tab_tour[i];
                                                       end;
                                              end;
                                    end;

                                 4: begin
                                        main:=1;
                                        nb_point_j1:=nb_point_j1+point;
                                          for i:=1 to 4 do
                                              begin
                                                   if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                                      begin
                                                       j:=0;
                                                         repeat
                                                               inc(j);
                                                         until(point_j1[j]=0)or(j=14);
                                                         point_j1[j]:=tab_tour[i];
                                                       end;
                                              end;
                                    end;

                      end;
                      end;



                   2: begin
                      case val of
                                 1: begin
                                        main:=3;
                                        nb_point_j3:=nb_point_j3+point;
                                          for i:=1 to 4 do
                                              begin
                                                   if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                                      begin
                                                       j:=0;
                                                         repeat
                                                               inc(j);
                                                         until(point_j3[j]=0)or(j=14);
                                                         point_j3[j]:=tab_tour[i];
                                                       end;
                                              end;
                                    end;
                                 2: begin
                                        main:=4;
                                        nb_point_j4:=nb_point_j4+point;
                                          for i:=1 to 4 do
                                              begin
                                                   if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                                      begin
                                                       j:=0;
                                                         repeat
                                                               inc(j);
                                                         until(point_j4[j]=0)or(j=14);
                                                         point_j4[j]:=tab_tour[i];
                                                       end;
                                              end;
                                    end;
                                 3: begin
                                        main:=1;
                                        nb_point_j1:=nb_point_j1+point;
                                          for i:=1 to 4 do
                                              begin
                                                   if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                                      begin
                                                       j:=0;
                                                         repeat
                                                               inc(j);
                                                         until(point_j1[j]=0)or(j=14);
                                                         point_j1[j]:=tab_tour[i];
                                                       end;
                                              end;
                                    end;

                                 4: begin
                                        main:=2;
                                        nb_point_j2:=nb_point_j2+point;
                                          for i:=1 to 4 do
                                              begin
                                                   if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                                      begin
                                                       j:=0;
                                                         repeat
                                                               inc(j);
                                                         until(point_j2[j]=0)or(j=14);
                                                         point_j2[j]:=tab_tour[i];
                                                       end;
                                              end;
                                    end;

                      end;
                      end;


                   3: begin
                      case val of
                                 1: begin
                                        main:=4;
                                        nb_point_j4:=nb_point_j4+point;
                                          for i:=1 to 4 do
                                              begin
                                                   if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                                      begin
                                                       j:=0;
                                                         repeat
                                                               inc(j);
                                                         until(point_j4[j]=0)or(j=14);
                                                         point_j4[j]:=tab_tour[i];
                                                       end;
                                              end;
                                    end;
                                 2: begin
                                        main:=1;
                                        nb_point_j1:=nb_point_j1+point;
                                          for i:=1 to 4 do
                                              begin
                                                   if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                                      begin
                                                       j:=0;
                                                         repeat
                                                               inc(j);
                                                         until(point_j1[j]=0)or(j=14);
                                                         point_j1[j]:=tab_tour[i];
                                                       end;
                                              end;
                                    end;
                                 3: begin
                                        main:=2;
                                        nb_point_j2:=nb_point_j2+point;
                                          for i:=1 to 4 do
                                              begin
                                                   if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                                      begin
                                                       j:=0;
                                                         repeat
                                                               inc(j);
                                                         until(point_j2[j]=0)or(j=14);
                                                         point_j2[j]:=tab_tour[i];
                                                       end;
                                              end;
                                    end;

                                 4: begin
                                        main:=3;
                                        nb_point_j3:=nb_point_j3+point;
                                          for i:=1 to 4 do
                                              begin
                                                   if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                                      begin
                                                       j:=0;
                                                         repeat
                                                               inc(j);
                                                         until(point_j3[j]=0)or(j=14);
                                                         point_j3[j]:=tab_tour[i];
                                                       end;
                                              end;
                                    end;

                      end;
                      end;

                   4: begin
                      case val of
                                 1: begin
                                        main:=1;
                                        nb_point_j1:=nb_point_j1+point;
                                          for i:=1 to 4 do
                                              begin
                                                   if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                                      begin
                                                       j:=0;
                                                         repeat
                                                               inc(j);
                                                         until(point_j1[j]=0)or(j=14);
                                                         point_j1[j]:=tab_tour[i];
                                                       end;
                                              end;
                                    end;
                                 2: begin
                                        main:=2;
                                        nb_point_j2:=nb_point_j2+point;
                                          for i:=1 to 4 do
                                              begin
                                                   if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                                      begin
                                                       j:=0;
                                                         repeat
                                                               inc(j);
                                                         until(point_j2[j]=0)or(j=14);
                                                         point_j2[j]:=tab_tour[i];
                                                       end;
                                              end;
                                    end;
                                 3: begin
                                        main:=3;
                                        nb_point_j3:=nb_point_j3+point;
                                          for i:=1 to 4 do
                                              begin
                                                   if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                                      begin
                                                       j:=0;
                                                         repeat
                                                               inc(j);
                                                         until(point_j3[j]=0)or(j=14);
                                                         point_j3[j]:=tab_tour[i];
                                                       end;
                                              end;
                                    end;

                                 4: begin
                                        main:=4;
                                        nb_point_j4:=nb_point_j4+point;
                                          for i:=1 to 4 do
                                              begin
                                                   if (tab_tour[i]=37)or(tab_tour[i]in[40..52]) then
                                                      begin
                                                       j:=0;
                                                         repeat
                                                               inc(j);
                                                         until(point_j4[j]=0)or(j=14);
                                                         point_j4[j]:=tab_tour[i];
                                                       end;
                                              end;
                                    end;

                      end;
                      end;








    end;

timer1.Interval:=800;


end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
nb_jouer:=0;
carte1.Picture.Bitmap:=nil;
carte2.Picture.Bitmap:=nil;
carte3.Picture.Bitmap:=nil;
carte4.Picture.Bitmap:=nil;
{if (not affiche_pt)and(tour=13) then
begin
     affiche_point();
     affiche_pt:=true;
     timer1.Interval:=1000;
     exit;
end;
 if affiche_pt then
 affiche_pt:=false; }
inc(tour);
timer1.interval:=0;
if tour=14 then
   begin
         form1.Enabled:=false;
        if (nb_point_j1=26)or(nb_point_j2=26)or(nb_point_j3=26)or(nb_point_j4=26) then
        begin
             if (nb_point_j1=26) then
             begin
                  point_joueur2:=point_joueur2+26;
                  point_joueur3:=point_joueur3+26;
                  point_joueur4:=point_joueur4+26;
             end;
             if (nb_point_j2=26) then
             begin
                  point_joueur1:=point_joueur1+26;
                  point_joueur3:=point_joueur3+26;
                  point_joueur4:=point_joueur4+26;
             end;
             if (nb_point_j3=26) then
             begin
                  point_joueur1:=point_joueur1+26;
                  point_joueur3:=point_joueur3+26;
                  point_joueur4:=point_joueur4+26;
             end;
             if (nb_point_j4=26) then
             begin
                  point_joueur2:=point_joueur2+26;
                  point_joueur3:=point_joueur3+26;
                  point_joueur1:=point_joueur1+26;
             end;
             end
        else
        begin
            point_joueur1:=point_joueur1+nb_point_j1;
            point_joueur2:=point_joueur2+nb_point_j2;
            point_joueur3:=point_joueur3+nb_point_j3;
            point_joueur4:=point_joueur4+nb_point_j4;
          end;



        inc(manche);
        if manche=5 then
        manche:=1;
        affiche_point();
        form3.memo1.lines.add('  '+inttostr(form1.point_joueur4)+'            '+inttostr(form1.point_joueur1)+'            '+inttostr(form1.point_joueur2)+'            '+inttostr(form1.point_joueur3));
       form3.show;
   end
else
    play;
end;

procedure TForm1.affiche_point();
var i,j,k:integer;

begin
  i:=144; k:=334;

for j:=1 to 14 do
begin
 if point_j4[j]=0 then
 break;
 if j=1 then
 begin
 image1.left:=i;
 image1.top:=k;
 i:=i+16;
 image1.Visible:=true;
 image1.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j4[j]],image1.picture.bitmap);
 end;

 if j=2 then
 begin
 image2.left:=i;
 image2.top:=k;
 i:=i+16;
 image2.Visible:=true;
 image2.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j4[j]],image2.picture.bitmap);
  end;

  if j=3 then
  begin
 image3.left:=i;
 image3.top:=k;
 i:=i+16;
 image3.Visible:=true;
 image3.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j4[j]],image3.picture.bitmap);
  end;

  if j=4 then
  begin
 image4.left:=i;
 image4.top:=k;
 i:=i+16;
 image4.Visible:=true;
 image4.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j4[j]],image4.picture.bitmap);
  end;

  if j=5 then
  begin
 image5.left:=i;
 image5.top:=k;
 i:=i+16;
 image5.Visible:=true;
 image5.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j4[j]],image5.picture.bitmap);
 end;

  if j=6 then
  begin
 image6.left:=i;
 image6.top:=k;
 i:=i+16;
 image6.Visible:=true;
 image6.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j4[j]],image6.picture.bitmap);
  end;

  if j=7 then
  begin
 image7.left:=i;
 image7.top:=k;
 i:=i+16;
 image7.Visible:=true;
 image7.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j4[7]],image7.picture.bitmap);
  end;

  if j=8 then
  begin
 image8.left:=i;
 image8.top:=k;
 i:=i+16;
 image8.Visible:=true;
 image8.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j4[j]],image8.picture.bitmap);
  end;

  if j=9 then
  begin
 image9.left:=i;
 image9.top:=k;
 i:=i+16;
 image9.Visible:=true;
 image9.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j4[j]],image9.picture.bitmap);
  end;

  if j=10 then
  begin
 image10.left:=i;
 image10.top:=k;
 i:=i+16;
 image10.Visible:=true;
 image10.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j4[j]],image10.picture.bitmap);
  end;

  if j=11 then
  begin
 image11.left:=i;
 image11.top:=k;
 i:=i+16;
 image11.Visible:=true;
 image11.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j4[j]],image11.picture.bitmap);
 end;
 if j=12 then
 begin
 image12.left:=i;
 image12.top:=k;
 i:=i+16;
 image12.Visible:=true;
 image12.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j4[j]],image12.picture.bitmap);
 end;

 if j=13 then
 begin
 image13.left:=i;
 image13.top:=k;
 image13.Visible:=true;
 image13.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j4[j]],image13.picture.bitmap);
 i:=i+16;
  end;

  if j=14 then
  begin
       carte1.Left:=i;
       carte1.Top:=k;
       carte1.Picture.Bitmap:=nil;
       imagelist1.GetBitmap(tab_carte[point_j4[j]],carte1.picture.bitmap);
  end;

  end;


i:=80; k:=16;
 for j:=1 to 14 do
begin
 if point_j1[j]=0 then
 break;
 if j=1 then
 begin
 gauche1.left:=k;
 gauche1.top:=i;
 i:=i+16;
 gauche1.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j1[j]],gauche1.picture.bitmap);
 end;

 if j=2 then
 begin
 gauche2.left:=k;
 gauche2.top:=i;
 i:=i+16;
 gauche2.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j1[j]],gauche2.picture.bitmap);
  end;

  if j=3 then
  begin
 gauche3.left:=k;
 gauche3.top:=i;
 i:=i+16;
 gauche2.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j1[j]],gauche3.picture.bitmap);
  end;

  if j=4 then
  begin
 gauche4.left:=k;
 gauche4.top:=i;
 i:=i+16;
 gauche4.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j1[j]],gauche4.picture.bitmap);
  end;

  if j=5 then
  begin
 gauche5.left:=k;
 gauche5.top:=i;
 i:=i+16;
 gauche5.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j1[j]],gauche5.picture.bitmap);
 end;

  if j=6 then
  begin
 gauche6.left:=k;
 gauche6.top:=i;
 i:=i+16;
 gauche6.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j1[j]],gauche6.picture.bitmap);
  end;

  if j=7 then
  begin
 gauche7.left:=k;
 gauche7.top:=i;
 i:=i+16;
 gauche7.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j1[7]],gauche7.picture.bitmap);
  end;

  if j=8 then
  begin
 gauche8.left:=k;
 gauche8.top:=i;
 i:=i+16;
 gauche8.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j1[j]],gauche8.picture.bitmap);
  end;

  if j=9 then
  begin
 gauche9.left:=k;
 gauche9.top:=i;
 i:=i+16;
 gauche9.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j1[j]],gauche9.picture.bitmap);
  end;

  if j=10 then
  begin
 gauche10.left:=k;
 gauche10.top:=i;
 i:=i+16;
 gauche10.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j1[j]],gauche10.picture.bitmap);
  end;

  if j=11 then
  begin
 gauche11.left:=k;
 gauche11.top:=i;
 i:=i+16;
 gauche11.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j1[j]],gauche11.picture.bitmap);
 end;
 if j=12 then
 begin
 gauche12.left:=k;
 gauche12.top:=i;
 i:=i+16;
 gauche12.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j1[j]],gauche12.picture.bitmap);
 end;

 if j=13 then
 begin
 gauche13.left:=k;
 gauche13.top:=i;
 gauche13.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j1[j]],gauche13.picture.bitmap);
 i:=i+16;
  end;

  if j=14 then
  begin
       carte1.Left:=k;
       carte1.Top:=i;
       carte1.Picture.Bitmap:=nil;
       imagelist1.GetBitmap(tab_carte[point_j1[j]],carte1.picture.bitmap);
  end;

  end;

 i:=280; k:=450;

   for j:=1 to 14 do
begin
 if point_j3[j]=0 then
 break;
 if j=1 then
 begin
 droit1.left:=k;
 droit1.top:=i;
 i:=i-16;
 droit1.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j3[j]],droit1.picture.bitmap);
 end;

 if j=2 then
 begin
 droit2.left:=k;
 droit2.top:=i;
 i:=i-16;
 droit2.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j3[j]],droit2.picture.bitmap);
  end;

  if j=3 then
  begin
 droit3.left:=k;
 droit3.top:=i;
 i:=i-16;
 droit3.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j3[j]],droit3.picture.bitmap);
  end;

  if j=4 then
  begin
 droit4.left:=k;
 droit4.top:=i;
 i:=i-16;
 droit4.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j3[j]],droit4.picture.bitmap);
  end;

  if j=5 then
  begin
 droit5.left:=k;
 droit5.top:=i;
 i:=i-16;
 droit5.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j3[j]],droit5.picture.bitmap);
 end;

  if j=6 then
  begin
 droit6.left:=k;
 droit6.top:=i;
 i:=i-16;
 droit6.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j3[j]],droit6.picture.bitmap);
  end;

  if j=7 then
  begin
 droit7.left:=k;
 droit7.top:=i;
 i:=i-16;
 droit7.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j3[j]],droit7.picture.bitmap);
  end;

  if j=8 then
  begin
 droit8.left:=k;
 droit8.top:=i;
 i:=i-16;
 droit8.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j3[j]],droit8.picture.bitmap);
  end;

  if j=9 then
  begin
 droit9.left:=k;
 droit9.top:=i;
 i:=i-16;
 droit9.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j3[j]],droit9.picture.bitmap);
  end;

  if j=10 then
  begin
 droit10.left:=k;
 droit10.top:=i;
 i:=i-16;
 droit10.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j3[j]],droit10.picture.bitmap);
  end;

  if j=11 then
  begin
 droit11.left:=k;
 droit11.top:=i;
 i:=i-16;
 droit11.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j3[j]],droit11.picture.bitmap);
 end;
 if j=12 then
 begin
 droit12.left:=k;
 droit12.top:=i;
 i:=i-16;
 droit12.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j3[j]],droit12.picture.bitmap);
 end;

 if j=13 then
 begin
 droit13.left:=k;
 droit13.top:=i;
 droit13.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j3[j]],droit13.picture.bitmap);
 i:=i-16;
  end;

  if j=14 then
  begin
       carte1.Left:=k;
       carte1.Top:=i;
       carte1.Picture.Bitmap:=nil;
       imagelist1.GetBitmap(tab_carte[point_j3[j]],carte1.picture.bitmap);
  end;

  end;

 i:=328; k:=8;

 for j:=1 to 14 do
begin
 if point_j2[j]=0 then
 break;
 if j=1 then
 begin
 haut1.left:=i;
 haut1.top:=k;
 i:=i-16;
 haut1.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j2[j]],haut1.picture.bitmap);
 end;

 if j=2 then
 begin
 haut2.left:=i;
 haut2.top:=k;
 i:=i-16;
 haut2.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j2[j]],haut2.picture.bitmap);
  end;

  if j=3 then
  begin
 haut3.left:=i;
 haut3.top:=k;
 i:=i-16;
 haut3.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j2[j]],haut3.picture.bitmap);
  end;

  if j=4 then
  begin
 haut4.left:=i;
 haut4.top:=k;
 i:=i-16;
 haut4.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j2[j]],haut4.picture.bitmap);
  end;

  if j=5 then
  begin
 haut5.left:=i;
 haut5.top:=k;
 i:=i-16;
 haut5.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j2[j]],haut5.picture.bitmap);
 end;

  if j=6 then
  begin
 haut6.left:=i;
 haut6.top:=k;
 i:=i-16;
 haut6.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j2[j]],haut6.picture.bitmap);
  end;

  if j=7 then
  begin
 haut7.left:=i;
 haut7.top:=k;
 i:=i-16;
 haut7.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j2[7]],haut7.picture.bitmap);
  end;

  if j=8 then
  begin
 haut8.left:=i;
 haut8.top:=k;
 i:=i-16;
 haut8.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j2[j]],haut8.picture.bitmap);
  end;

  if j=9 then
  begin
 haut9.left:=i;
 haut9.top:=k;
 i:=i-16;
 haut9.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j2[j]],haut9.picture.bitmap);
  end;

  if j=10 then
  begin
 haut10.left:=i;
 haut10.top:=k;
 i:=i-16;
 haut10.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j2[j]],haut10.picture.bitmap);
  end;

  if j=11 then
  begin
 haut11.left:=i;
 haut11.top:=k;
 i:=i-16;
 haut11.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j2[j]],haut11.picture.bitmap);
 end;
 if j=12 then
 begin
 haut12.left:=i;
 haut12.top:=k;
 i:=i-16;
 haut12.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j2[j]],haut12.picture.bitmap);
 end;

 if j=13 then
 begin
 haut13.left:=i;
 haut13.top:=k;
 haut13.picture.Bitmap:=nil;
 imagelist1.GetBitmap(tab_carte[point_j2[j]],haut13.picture.bitmap);
 i:=i-16;
  end;

  if j=14 then
  begin
       carte1.Left:=i;
       carte1.Top:=k;
       carte1.Picture.Bitmap:=nil;
       imagelist1.GetBitmap(tab_carte[point_j2[j]],carte1.picture.bitmap);
  end;

  end;


 end;


 
procedure TForm1.Option1Click(Sender: TObject);
begin
form1.Enabled:=false;
form2.show;
end;

procedure TForm1.Quitter1Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.Nouvellepartie1Click(Sender: TObject);
begin
if messagedlg('Vous êtes sûr de vouloir commencer une nouvelle partie',mtconfirmation,[mbYes, mbNo],0)=mryes then
begin
    initialisation();
    main:=1;
    tour:=0;
    point_joueur1:=0;
    point_joueur2:=0;
    point_joueur3:=0;
    point_joueur4:=0;
    if affichage then
    begin
    aleatoire();
    trie();
    demasquer();
    position_utilisateur();
    end
    else
    begin
    aleatoire();
    trie();
    position_utilisateur();
    position_haut();
    position_droit();
    position_gauche();
    end;
    form3.Memo1.Clear;
form3.memo1.lines.add(Form1.label2.caption+'        '+Form1.label1.caption+'     '+Form1.label4.caption+'         '+Form1.label3.caption );

end;

end;

procedure TForm1.Score1Click(Sender: TObject);
begin
form1.Enabled:=false;
form3.show;
end;

procedure Tform1.cool();
begin
  initialisation();
    main:=1;
    tour:=0;
    point_joueur1:=0;
    point_joueur2:=0;
    point_joueur3:=0;
    point_joueur4:=0;
    if affichage then
    begin
    aleatoire();
    trie();
    demasquer();
    position_utilisateur();
    end
    else
    begin
    aleatoire();
    trie();
    position_utilisateur();
    position_haut();
    position_droit();
    position_gauche();
    end;
    form3.Memo1.Clear;
form3.memo1.lines.add(Form1.label2.caption+'        '+Form1.label1.caption+'     '+Form1.label4.caption+'         '+Form1.label3.caption );

end;

end.
