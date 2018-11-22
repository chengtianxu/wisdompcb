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
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label18: TLabel;
    DBText3: TDBText;
    Label19: TLabel;
    DBEdit9: TDBEdit;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBText4: TDBText;
    Label15: TLabel;
    DBEdit4: TDBEdit;
    DBText5: TDBText;
    Label20: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBCheckBox1: TDBCheckBox;
    Edit3: TEdit;
    Edit4: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Edit5: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBEdit12: TDBEdit;
    Label26: TLabel;
    BitBtn5: TBitBtn;
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
    procedure DBEdit8Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBEdit12DblClick(Sender: TObject);
  private
    { Private declarations }
    v_close:byte;
    price:double;
    tax_flag:string; 
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation
 uses damo, edit_add_po, Unit_search, kucun_serach, zaitu_invt,Pick_Item_Single,ConstVar,
  stdhistory_price;
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
   sql.Add('where data0002.rkey='+dm.ADO71WO_PTR.AsString);
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
  dbedit8.Field.Alignment := taleftjustify;

 with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('select PRICE_1,tax_flag from data0028');
   sql.Add('where SUPPLIER_PTR='+dm.ADO70SUPPLIER_POINTER.AsString);
   sql.Add('and INVENTORY_PTR='+dm.ADO71INVT_PTR.AsString);
   open;
   if not isempty then
    begin
     self.price := dm.ADOQuery2.FieldValues['price_1'];
     self.tax_flag := dm.ADOQuery2.FieldValues['tax_flag'];
    end
   else
    begin
     self.price := dm.ADO71PRICE.Value;
     self.tax_flag := 'N';
    end;
  end;

if DM.ADO71rkey69.Value>0 then
with DM.ADOQuery2 do
 begin
  Close;
  SQL.Text:=
  'SELECT  dbo.Data0068.PO_REQ_NUMBER, dbo.Data0005.EMPLOYEE_NAME, dbo.Data0034.DEPT_NAME '+
  'FROM    dbo.Data0068 INNER JOIN '+
  '  dbo.Data0069 ON dbo.Data0068.RKEY = dbo.data0069.PURCH_REQ_PTR INNER JOIN'+
  '  dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY INNER JOIN'+
  '  dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Data0034.DEPT_CODE'+
  ' where data0069.rkey='+dm.ADO71rkey69.AsString;
  Open;
  Edit3.Text:=fieldbyname('PO_REQ_NUMBER').AsString;
  Edit4.Text:=fieldbyname('DEPT_NAME').AsString;
  Edit5.Text:=fieldbyname('EMPLOYEE_NAME').AsString;
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
 if trim(dbedit2.Text)='' then dbedit2.Field.Value:='0';

dm.ADO71tax_price.Value:=strtofloat(
formatfloat('0.0000',dm.ADO71PRICE.Value*(1+dm.ADO71TAX_2.Value*0.01)));

if self.tax_flag='N' then //如何供应商价格不含税，拿不含税价比较
 if (dbedit2.Field.Value-self.price>0.01) and (activecontrol.Name<>'Button2') then
  begin
   showmessage('价格只能改少,不能改大!!!');
   dbedit2.SetFocus;
  end
 else
  dbedit2.Font.Color := clwindowtext
else
 if (dm.ADO71tax_price.Value-self.price>0.01) and (activecontrol.Name<>'Button2') then
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

procedure TForm9.DBEdit8Exit(Sender: TObject);
begin
if trim(dbedit8.Text)='' then dbedit8.Field.Value:='0';

dm.ADO71PRICE.Value:=strtofloat(
formatfloat('0.000000',dm.ADO71tax_price.Value/(1+dm.ADO71TAX_2.Value*0.01)));

if self.tax_flag='N' then //如何供应商价格不含税，拿不含税价比较
 if (dbedit2.Field.Value-self.price>0.01) and (activecontrol.Name<>'Button2') then
  begin
   showmessage('价格只能改少,不能改大!!!');
   dbedit8.SetFocus;
  end
 else
else
 if (dm.ADO71tax_price.Value-self.price>0.01) and (activecontrol.Name<>'Button2') then
  begin
   showmessage('价格只能改少,不能改大!!!');
   dbedit8.SetFocus;
  end;
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

procedure TForm9.SpeedButton2Click(Sender: TObject);
begin
if dm.ADO71INVT_PTR.Value>0 then
 begin
  form_zaitu:=tform_zaitu.Create(application);
  form_zaitu.ADODataSet1.Close;
  form_zaitu.ADODataSet1.Parameters[0].Value:=dm.ADO71INVT_PTR.Value;
  form_zaitu.ADODataSet1.Open;
  if not form_zaitu.ADODataSet1.IsEmpty then
   begin
    form_zaitu.ShowModal;
    form_zaitu.Free;
   end
  else
   showmessage('没有找到在途材料');
 end
else
 showmessage('请先选择材料!');
end;

procedure TForm9.SpeedButton3Click(Sender: TObject);
begin
  Form_stdprice:=tForm_stdprice.Create(application);
  Form_stdprice.ADOstdprice.Close;
  Form_stdprice.ADOstdprice.Parameters[0].Value:=dm.ADO71INVT_PTR.Value;
  Form_stdprice.ADOstdprice.Open;
  if not Form_stdprice.ADOstdprice.IsEmpty then
   begin
    Form_stdprice.ShowModal;
    Form_stdprice.Free;
   end
  else
   showmessage('没有找到该材料历史单价');
end;

procedure TForm9.BitBtn5Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try
    InputVar.Fields := 'CODE/供应商代码/50,SUPPLIER_NAME/供应商名称/200,abbr_name/供应商简称/200';
    InputVar.Sqlstr := 'SELECT CODE,SUPPLIER_NAME,abbr_name FROM data0023';
    InputVar.AdoConn :=DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
     dbEdit12.Field.Value := frmPick_Item_Single.adsPick.FieldValues['abbr_name'];
    end;
   finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
   end;
end;

procedure TForm9.DBEdit12DblClick(Sender: TObject);
begin
 dbEdit12.Field.Value :=null;
end;

end.
