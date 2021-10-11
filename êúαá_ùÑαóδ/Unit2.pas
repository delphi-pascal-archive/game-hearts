unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ComCtrls, StdCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupBox2: TGroupBox;
    Edit5: TEdit;
    UpDown1: TUpDown;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.DFM}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form1.enabled:=true;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
updown1.Position:=Form1.Score;
end;

procedure TForm2.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
Edit5.text:=inttostr(updown1.position);
Form1.Score:=updown1.position;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
edit5.Text:=inttostr(form1.score);
Edit1.text:=Form1.Label1.caption;
Edit2.text:=Form1.Label4.caption;
Edit3.text:=Form1.Label3.caption;
Edit4.text:=Form1.Label2.caption;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
Form1.score:=updown1.Position;
Form1.Label1.caption:=Edit1.text;
Form1.Label4.caption:=Edit2.text;
Form1.Label3.caption:=Edit3.text;
Form1.Label2.caption:=Edit4.text;

form2.Close;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
Form2.Close;
end;

procedure TForm2.RadioButton1Click(Sender: TObject);
begin
Form1.affichage:=false;
Form1.position_haut();
Form1.position_gauche();
Form1.position_droit();
end;

procedure TForm2.RadioButton2Click(Sender: TObject);
begin
Form1.affichage:=true;
Form1.demasquer();
end;

end.
