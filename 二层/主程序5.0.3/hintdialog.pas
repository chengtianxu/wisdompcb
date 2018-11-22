unit hintdialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ShellAPI, jpeg, ExtCtrls, StdCtrls;

type
  Tform_dialog = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Timer1: TTimer;
    Label2: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
   ontime:byte;
   form_left:integer;
  public
    { Public declarations }
  end;

var
  form_dialog: Tform_dialog;

implementation

uses main,common;

{$R *.dfm}

procedure Tform_dialog.Timer1Timer(Sender: TObject);
begin
inc(ontime);
self.Left:=self.Left+ontime;
case ontime of
1:self.Image1.BringToFront;
2:self.Image2.BringToFront;
3:self.Image3.BringToFront;
4:self.Image4.BringToFront;
5:self.Image5.BringToFront;
end;
if ontime>5 then
 begin
  ontime:=0;
  self.Left:=self.form_left;
 end;
end;

procedure Tform_dialog.FormCreate(Sender: TObject);
begin
self.Brush.style:=bsclear;
ontime:=0;
end;

procedure Tform_dialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:= caFree;
end;

procedure Tform_dialog.FormShow(Sender: TObject);
begin
form_left:=self.Left-3;
end;

procedure Tform_dialog.Image1Click(Sender: TObject);
begin
 dialog:=0;
 close;
end;

end.
