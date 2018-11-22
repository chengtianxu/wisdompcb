unit edit_std_inv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons;

type
  TForm9 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    DBText1: TDBText;
    DBText2: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    Label6: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label11: TLabel;
    MaskEdit1: TMaskEdit;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label14: TLabel;
    Label16: TLabel;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label17: TLabel;
    DBText3: TDBText;
    Label18: TLabel;
    DBEdit8: TDBEdit;
    Label19: TLabel;
    DBEdit9: TDBEdit;
    DBText4: TDBText;
    Label9: TLabel;
    Label10: TLabel;
    DBText5: TDBText;
    Label15: TLabel;
    DBEdit3: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit4: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    DBText6: TDBText;
    DBEdit10: TDBEdit;
    Label22: TLabel;
    DBEdit11: TDBEdit;
    Label23: TLabel;
    DBEdit12: TDBEdit;
    Label24: TLabel;
    procedure Edit2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBEdit6Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit2Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation
 uses damo;
{$R *.dfm}

procedure TForm9.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color = clwindowtext then
 begin
  edit2.Font.Color :=clblue;
  edit2.SelectAll;
 end;
end;

procedure TForm9.FormActivate(Sender: TObject);
begin
 with dm.adoquery1 do
  begin                //查找存货单位
   if active=true then active:=false;
   sql.Clear;
   SQL.Add('SELECT unit_code,unit_name');
   sql.add('from data0002,data0017');
   sql.Add('where data0017.stock_unit_ptr=data0002.rkey');
   sql.Add('and data0017.rkey='+dm.ADO71INVT_PTR.AsString);
   active:=true;
   edit1.Text := fieldbyname('unit_code').AsString;
   label5.Caption := fieldbyname('unit_name').AsString;
  end;

   edit2.Text := dm.ADO71unit_code.Value;
   edit2.Font.Color := clwindowtext;
   label6.Caption := dm.ADO71unit_name.Value;

 if comparetext(trim(edit1.text),trim(edit2.Text))=0 then
  dbedit1.Enabled := false
 else
  dbedit1.Enabled := true;
  dbedit1.Field.Alignment := taleftjustify;
  dbedit2.Field.Alignment := taleftjustify;

  dbedit5.Field.Alignment := taleftjustify;
  dbedit6.Field.Alignment := taleftjustify;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
 dm.ADO71.Cancel;
end;

procedure TForm9.DBEdit6Click(Sender: TObject);
begin
if dbedit6.Font.Color=clwindowtext then
 begin
  dbedit6.Font.Color:=clnone;
  dbedit6.SelectAll;
 end;
end;

procedure TForm9.DBEdit6Exit(Sender: TObject);
begin
if trim(dbedit6.Text)='' then dbedit6.Field.Value:='0';
 dbedit6.Font.Color := clwindowtext;
end;

procedure TForm9.DBEdit2Exit(Sender: TObject);
begin
 if trim(dbedit2.Text)='' then dbedit2.Field.Value:='0';
 dbedit2.Font.Color := clwindowtext;
end;

procedure TForm9.DBEdit2Click(Sender: TObject);
begin
if dbedit2.Font.Color=clwindowtext then
 begin
  dbedit2.Font.Color:=clnone;
  dbedit2.SelectAll;
 end;
end;

procedure TForm9.DBEdit5Exit(Sender: TObject);
begin
if trim(dbedit5.Text)='' then dbedit5.Field.Value:='0';
 dbedit5.Font.Color := clwindowtext;
end;

procedure TForm9.DBEdit5Click(Sender: TObject);
begin
if dbedit5.Font.Color=clwindowtext then
 begin
  dbedit5.Font.Color:=clnone;
  dbedit5.SelectAll;
 end;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dbedit1.Field.Alignment := taRightJustify;
 dbedit2.Field.Alignment := taRightJustify;

 dbedit5.Field.Alignment := taRightJustify;
 dbedit6.Field.Alignment := taRightJustify;
end;

end.
