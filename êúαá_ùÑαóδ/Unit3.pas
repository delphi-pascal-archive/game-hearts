unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm3 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form3: TForm3;
   bool:boolean;
implementation

uses Unit1;

{$R *.DFM}

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
         form1.Enabled:=true; 
        if form1.manche=5 then
        form1.manche:=1;
        if form1.manche=1 then
        form1.ok.Caption:='A gauche';
        if form1.manche=2 then
        form1.ok.Caption:='A droite';
        if form1.manche=3 then
        form1.ok.Caption:='En face';
        if form1.manche=4 then
        begin
             form1.initialisation();
             form1.tour:=1;
             form1.play();
        end
        else
            begin
            form1.initialisation();
            form1.ok.Visible:=true;
            end;
       if bool then
       begin
            bool:=false;
            form1.cool();
       end;

end;

procedure TForm3.FormCreate(Sender: TObject);
begin
bool:=false;
memo1.lines.add(Form1.label2.caption+'        '+Form1.label1.caption+'     '+Form1.label4.caption+'         '+Form1.label3.caption );
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
form3.Close;
end;

procedure TForm3.FormShow(Sender: TObject);
var
   i:integer;
begin
i:=0;
if (form1.point_joueur1>(form1.score-1))or(form1.point_joueur2>(form1.score-1))or(form1.point_joueur3>(form1.score-1))or(form1.point_joueur4>(form1.score-1))then
begin
caption:=caption+' - '+'partie terminée';
bool:=true;
 end;
if form1.point_joueur4>form1.point_joueur1 then
inc(i);
if form1.point_joueur4>form1.point_joueur2 then
inc(i);
if form1.point_joueur4>form1.point_joueur3 then
inc(i);
if i=0 then
caption:=caption+' - '+'Vous êtes premier';
if i=1 then
caption:=caption+' - '+'Vous êtes deuxième';
if i=2 then
caption:=caption+' - '+'Vous êtes troisième';
if i=3 then
caption:=caption+' - '+'Vous êtes dernier';
end;

end.
