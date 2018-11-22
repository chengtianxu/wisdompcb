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
    DBEdit2: TDBEdit;
    Label11: TLabel;
    MaskEdit1: TMaskEdit;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit7: TDBEdit;
    SpeedButton1: TSpeedButton;
    Label18: TLabel;
    DBText3: TDBText;
    procedure MaskEdit1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBEdit6Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    v_close:byte;
    price:double;
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation
 uses damo, edit_add_po, Unit_search, kucun_serach;
{$R *.dfm}

procedure TForm9.MaskEdit1Exit(Sender: TObject);
begin
 try
  strtodatetime(maskedit1.Text);
//  maskedit2.Text:=datetimetostr(strtodatetime(maskedit1.text)-dm.ADO70shipping_lead_time.Value);
 except
  messagedlg('日期格式输入不正确,请重新输入!',mtwarning,[mbok],0);
  maskedit1.SetFocus;
 end;
end;

procedure TForm9.BitBtn1Click(Sender: TObject);
begin
 try
  form_unit:=tform_unit.Create(application);
  form_unit.Edit1.Text :=trim(edit2.Text);
  if form_unit.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找符合条件的记录!',mtwarning,[mbok],0);
    edit2.SetFocus;
   end
  else
  if form_unit.ShowModal=mrok then
   begin
    edit2.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
    edit2.Font.Color := clwindowtext;
    label6.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
    dm.ADO71PURCHASE_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
    if comparetext(trim(edit1.text),trim(edit2.Text))=0 then
     begin
      dbedit1.Field.Value :=1;
      dbedit1.Enabled := false;
      dbedit6.SetFocus;
     end
    else
     begin
      dbedit1.Enabled := true;
      dbedit1.SetFocus;
     end;
   end
  else
   edit2.SetFocus;
 finally
  form_unit.free;
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

procedure TForm9.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2') then
 try
  form_unit:=tform_unit.Create(application);
  form_unit.Edit1.Text :=trim(edit2.Text);
 if comparetext(trim(edit2.text),trim(form_unit.ADOQuery1.Fieldbyname('unit_code').AsString))=0 then
   begin
    edit2.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
    edit2.Font.Color := clwindowtext;
    label6.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
    dm.ADO71PURCHASE_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
    if comparetext(trim(edit1.text),trim(edit2.Text))=0 then
     begin
      dbedit1.Field.Value :=1;
      dbedit1.Enabled := false;
     end
    else
     dbedit1.Enabled := true;
   end
  else
   begin
    messagedlg('采购单位名称不正确,请重新输入或选择',mtinformation,[mbok],0);
    label6.Caption := '';
    edit2.SetFocus;
   end;
 finally
  form_unit.free;
 end;
end;

procedure TForm9.FormActivate(Sender: TObject);
begin
 with dm.adoquery2 do
  begin                //查找存货单位
   if active=true then active:=false;
   sql.Clear;
   SQL.Add('SELECT unit_code,unit_name');
   sql.add('from data0002');
   sql.Add('where rkey='+dm.ADO71wo_PTR.AsString);
   active := true;
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
  dbedit5.Field.Alignment := taleftjustify;
  dbedit6.Field.Alignment := taleftjustify;

 with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('select PRICE_1,tax_flag from data0028');
   sql.Add('where SUPPLIER_PTR='+dm.ADO70SUPPLIER_POINTER.AsString);
   sql.Add('and INVENTORY_PTR='+dm.ADO71INVT_PTR.AsString);
   open;
   if not isempty then
     self.price := dm.ADOQuery2.FieldValues['price_1']
   else
     self.price := dm.ADO71PRICE.Value;
  end;

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
 if trim(dbedit2.Text)='' then dbedit2.Field.Value := '0';

 if (dbedit2.Field.Value>self.price) and (activecontrol.Name<>'Button2') then
  begin
   showmessage('价格只能改少,不能改大!!!');
   dbedit2.SetFocus;
  end
 else
  dbedit2.Font.Color := clwindowtext

end;

procedure TForm9.DBEdit2Click(Sender: TObject);
begin
if dbedit2.Font.Color=clwindowtext then
 begin
  dbedit2.Font.Color:=clnone;
  dbedit2.SelectAll;
 end;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dbedit1.Field.Alignment := taRightJustify;
 dbedit2.Field.Alignment := taRightJustify;

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

procedure TForm9.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then dm.ADO71.Cancel; 
end;

procedure TForm9.SpeedButton1Click(Sender: TObject);
begin

  form20:=tform20.Create(application);
  form20.ADOQuery1.Close;
  form20.ADOQuery1.Parameters[0].Value:=dm.ADO71INVT_PTR.Value;
  form20.ADOQuery1.Open;
  if not form20.ADOQuery1.IsEmpty then
   begin
    form20.ShowModal;
    form20.Free;
   end
  else
   showmessage('没有找到库存');

end;

end.
