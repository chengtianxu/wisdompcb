unit edit_misc_po;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons;

type
  TForm10 = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    MaskEdit1: TMaskEdit;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    Button2: TButton;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit3Click(Sender: TObject);
    procedure DBEdit4Click(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit5Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation
uses damo;
{$R *.dfm}

procedure TForm10.FormActivate(Sender: TObject);
begin
 dbedit5.Field.Alignment := taleftjustify;
 dbedit3.Field.Alignment := taleftjustify;
 dbedit4.Field.Alignment := taleftjustify;

   edit2.Text := dm.ADO72unit_code.Value;
   label10.Caption := dm.ADO72unit_name.Value;

{ with dm.adoquery1 do
  begin                //查找总帐帐目
   if active=true then active:=false;
   sql.Clear;
   SQL.Add('SELECT GL_ACC_NUMBER,GL_DESCRIPTION');
   sql.add('from data0103');
   sql.Add('where rkey='+dm.ADO72gl_PTR.AsString);
   active:=true;         被取消021211
   edit1.Text := fieldbyname('GL_ACC_NUMBER').AsString;
   label3.Caption := fieldbyname('GL_DESCRIPTION').AsString;
  end;}
end;

procedure TForm10.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color = clwindowtext then
 begin
  edit2.Font.Color :=clblue;
  edit2.SelectAll;
 end;
end;

procedure TForm10.DBEdit3Exit(Sender: TObject);
begin
if trim(dbedit3.Text)='' then dbedit3.Field.Value:='0';
 dbedit3.Font.Color := clwindowtext;
end;

procedure TForm10.DBEdit3Click(Sender: TObject);
begin
if dbedit3.Font.Color=clwindowtext then
 begin
  dbedit3.Font.Color:=clnone;
  dbedit3.SelectAll;
 end;
end;

procedure TForm10.DBEdit4Click(Sender: TObject);
begin
if dbedit4.Font.Color=clwindowtext then
 begin
  dbedit4.Font.Color:=clnone;
  dbedit4.SelectAll;
 end;
end;

procedure TForm10.DBEdit4Exit(Sender: TObject);
begin
if trim(dbedit4.Text)='' then dbedit4.Field.Value:='0';
 dbedit4.Font.Color := clwindowtext;
end;

procedure TForm10.DBEdit5Click(Sender: TObject);
begin
if dbedit5.Font.Color=clwindowtext then
 begin
  dbedit5.Font.Color:=clnone;
  dbedit5.SelectAll;
 end;
end;

procedure TForm10.DBEdit5Exit(Sender: TObject);
begin
if trim(dbedit5.Text)='' then dbedit5.Field.Value:='0';
 dbedit5.Font.Color := clwindowtext;
end;

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dbedit5.Field.Alignment := taRightJustify;
 dbedit3.Field.Alignment := taRightJustify;
 dbedit4.Field.Alignment := taRightJustify;
end;

end.
