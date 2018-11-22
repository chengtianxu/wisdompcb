unit edit_std_inv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons;

type
  TForm9 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
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
    Label9: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBEdit6Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit2Click(Sender: TObject);
    procedure DBEdit3Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    v_close:byte; 
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation
 uses damo;
{$R *.dfm}

procedure TForm9.MaskEdit1Exit(Sender: TObject);
begin
 try
  strtodate(maskedit1.Text);
  maskedit2.Text:=datetostr(strtodate(maskedit1.text)-dm.ADO70shipping_lead_time.Value);
 except
  messagedlg('日期格式输入不正确,请重新输入!',mtwarning,[mbok],0);
  maskedit1.SetFocus;
 end;

end;

procedure TForm9.MaskEdit2Exit(Sender: TObject);
begin

 try
  strtodate(maskedit2.Text);
 if strtodate(maskedit2.Text)>strtodate(maskedit1.Text) then
  begin
   messagedlg('装运日期不能大于出货日期',mtWarning,[mbok],0);
   maskedit2.SetFocus;
  end;
 except
  messagedlg('日期格式输入不正确,请重新输入!',mtwarning,[mbok],0);
  maskedit2.SetFocus;
 end;

end;

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
 with dm.adoquery2 do
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
 with dm.adoquery2 do
  begin                //查找采购单位
   if active=true then active:=false;
   sql.Clear;
   SQL.Add('SELECT unit_code,unit_name');
   sql.add('from data0002');
   sql.Add('where rkey='+dm.ADO71PURCHASE_UNIT_PTR.AsString);
   active:=true;
   edit2.Text := fieldbyname('unit_code').AsString;
   edit2.Font.Color := clwindowtext;
   label6.Caption := fieldbyname('unit_name').AsString;
  end;
 if comparetext(trim(edit1.text),trim(edit2.Text))=0 then
  dbedit1.Enabled := false
 else
  dbedit1.Enabled := true;
  dbedit1.Field.Alignment := taleftjustify;
  dbedit2.Field.Alignment := taleftjustify;
  dbedit3.Field.Alignment := taleftjustify;
  dbedit4.Field.Alignment := taleftjustify;
  dbedit5.Field.Alignment := taleftjustify;
  dbedit6.Field.Alignment := taleftjustify;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
 v_close:=1;
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

procedure TForm9.DBEdit3Click(Sender: TObject);
begin
if dbedit3.Font.Color=clwindowtext then
 begin
  dbedit3.Font.Color:=clnone;
  dbedit3.SelectAll;
 end;
end;

procedure TForm9.DBEdit3Exit(Sender: TObject);
begin
if trim(dbedit3.Text)='' then dbedit3.Field.Value:='0';
 dbedit3.Font.Color := clwindowtext;
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
 dbedit3.Field.Alignment := taRightJustify;
 dbedit4.Field.Alignment := taRightJustify;
 dbedit5.Field.Alignment := taRightJustify;
 dbedit6.Field.Alignment := taRightJustify;
end;

procedure TForm9.Button1Click(Sender: TObject);
begin
 if dm.ADO71QUAN_ORD.Value<dm.ADO71QUAN_RECD.Value then
  begin
   messagedlg('数量不能少于已接收的数量',mtinformation,[mbok],0);
   dbedit6.SetFocus;
  end
 else
  begin
   v_close:=1;
   ModalResult:=mrok;
  end;
end;

procedure TForm9.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tdbedit).Text)>0
    then abort;
end;

procedure TForm9.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then
 dm.ADO71.Cancel; 
end;

end.
