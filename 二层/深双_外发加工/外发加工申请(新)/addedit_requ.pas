unit addedit_requ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, ADODB, ExtCtrls, ComCtrls,
  Grids, DBGridEh;

type
  TForm3 = class(TForm)
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    BitBtn3: TBitBtn;
    DBEdit1: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label15: TLabel;
    DBText4: TDBText;
    DBComboBox1: TDBComboBox;
    Label1: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    DBComboBox2: TDBComboBox;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    ADO279: TADOQuery;
    ADO279SPEC_RKEY: TStringField;
    ADO279PARAMETER_VALUE: TStringField;
    ADOMIN_aperture: TADOQuery;
    ADOMIN_aperturePARAMETER_VALUE: TStringField;
    DateTimePicker1: TDateTimePicker;
    Grd: TDBGridEh;
    DataSource1: TDataSource;
    ADOWk_sel: TADOQuery;
    ADOWk_selOUTSOURCE: TBooleanField;
    ADOWk_selWORK_ORDER_NUMBER: TStringField;
    ADOWk_selpcs: TFloatField;
    ADOWk_selPNLS: TIntegerField;
    ADOWk_selWO_PTR: TIntegerField;
    procedure BitBtn3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBComboBox2Change(Sender: TObject);
    procedure ADOWk_selOUTSOURCEChange(Sender: TField);
    procedure DBComboBox1Change(Sender: TObject);
  private
    { Private declarations }
   v_close:byte;
   Fi:integer; 
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
 uses damo, Frm_Edit_u,inv_search, main;
{$R *.dfm}

procedure TForm3.BitBtn3Click(Sender: TObject);
var
 pnl_l,pnl_w:double;
begin
 try
  form_inv := tform_inv.Create(application);
  if form_inv.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
    dbedit6.SetFocus;
   end
  else
  if form_inv.ShowModal = mrok then
  begin
    if not DBEdit1.Enabled then
    begin
      ADOWk_sel.Close;
      ADOWk_sel.Parameters[0].Value:=form_inv.ADOQuery1rkey.Value;
      ADOWk_sel.Parameters[1].Value:=dm.adowz300warehouse_ptr.Value;
      ADOWk_sel.Open;
    end;
    
    dm.ADO301CUSTPART_PTR.Value:=form_inv.ADOQuery1rkey.Value;
    dm.ADO301LAYER.Value:=form_inv.ADOQuery1LAYERS.Value; //厚数
    self.ADO279.Close;                    //打开全局参数
    self.ADO279.Parameters[0].Value:=dm.ADO301CUSTPART_PTR.Value;
    self.ADO279.Open;
    if dbcombobox2.Items.Count>0 then dbcombobox2.Items.Clear;
    if ado279.Locate('SPEC_RKEY','H',[]) then   //Ａ板尺寸
     dbcombobox2.Items.Add(trim(self.ADO279PARAMETER_VALUE.Value));
    if ado279.Locate('SPEC_RKEY','I',[]) then    //b板尺寸
     dbcombobox2.Items.Add(trim(self.ADO279PARAMETER_VALUE.Value));
    if ado279.Locate('SPEC_RKEY','S',[]) then    //c板尺寸
     dbcombobox2.Items.Add(trim(self.ADO279PARAMETER_VALUE.Value));
    if ado279.Locate('SPEC_RKEY','T',[]) then    //d板尺寸
     dbcombobox2.Items.Add(trim(self.ADO279PARAMETER_VALUE.Value));
    dbcombobox2.ItemIndex:=0;
    dm.ADO301STANDARD.Value:=dbcombobox2.Items[0];
    if ado279.Locate('SPEC_RKEY','TK',[]) then    //完成板厚
     try
      dm.ADO301THINK.Value:=strtofloat(self.ADO279PARAMETER_VALUE.Value);
     except
      dm.ADO301THINK.Value:=0;
     end;
    pnl_l:=0;
    pnl_w:=0;
    if ado279.Locate('SPEC_RKEY','6',[]) then
     try
      pnl_l:=strtofloat(self.ADO279PARAMETER_VALUE.Value);
     except
     end;
    if ado279.Locate('SPEC_RKEY','7',[]) then
     try
      pnl_w:=strtofloat(self.ADO279PARAMETER_VALUE.Value);
     except
     end;
     dm.ADO301AREA_SQM.Value := pnl_l*pnl_w/1000000;         //平方米
     dm.ADO301AREA_SQF.Value := dm.ADO301AREA_SQM.Value*10.7639; //平方英尺
     self.ADOMIN_aperture.Close;
     self.ADOMIN_aperture.Parameters[0].Value:=dm.ADO301CUSTPART_PTR.Value;
     self.ADOMIN_aperture.Open;
     if not ADOMIN_aperture.IsEmpty then
      try
       dm.ADO301MIN_aperture.Value:=strtofloat(self.ADOMIN_aperturePARAMETER_VALUE.Value);
      except
       dm.ADO301MIN_aperture.Value:=0;
      end;
     if dbedit1.Enabled then dbedit1.SetFocus;
     DM.FisC:=true;
   end;
 finally
  form_inv.free;
 end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
 dm.ADO301.Cancel;
end;

procedure TForm3.Button1Click(Sender: TObject);

begin
  if dm.ADO301QUANTITY.Value<=0 then
  begin
    showmessage('请输入正确的外发数量');
    dbedit1.SetFocus;
  end else  if dm.ADO301.State=dsinsert then
  begin
   dm.ADO301REQ_DATE.Value:=self.DateTimePicker1.Date;
   if dm.adowz300rkey.Value>0 then
    dm.ADO301EPIBOLY_PTR.Value:=dm.adowz300rkey.Value;//给主表指针赋值
   dm.ADO301REQ_DATE.Value:=form1.sys_shortdate;



  dm.ADO301.Post;
   ADOWk_sel.First;
   while not ADOWk_sel.Eof do
   begin
      if ADOWk_selOUTSOURCE.AsBoolean then
      begin
        DM.ADO305.Append;
        DM.ADO305rkey301.Value:=dm.ADO301rec.Value;
        DM.ADO305wo_ptr.Value:=ADOWk_selWO_PTR.Value;
        if DBComboBox1.ItemIndex=0 then
          DM.ADO305Quantity.Value:=ADOWk_selPNLS.AsInteger
        else
          DM.ADO305Quantity.Value:=ADOWk_selPCS.AsInteger;
        DM.ADO305.Post;
      end;
      ADOWk_sel.Next;
   end;
  // DM.FisC:=false;
   ADOWk_sel.Close;
   dm.ADO301.Append;
   dm.ADO301UNIT_NAME.Value:='PNL';
   dbedit6.SetFocus;
  end
 else
  begin
   v_close:=1;
   self.ModalResult:=mrok;
  end;
end;

procedure TForm3.DBEdit1Exit(Sender: TObject);
begin
 if trim(dbedit1.Text) = '' then dbedit1.Field.Value := 0;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  dm.ado301.Cancel;
end;

procedure TForm3.DBComboBox2Change(Sender: TObject);
var
 pnl_l,pnl_w:double;
begin
case dbcombobox2.ItemIndex of
 0:
  begin
    pnl_l:=0;
    pnl_w:=0;
    if ado279.Locate('SPEC_RKEY','6',[]) then
     try
      pnl_l:=strtofloat(self.ADO279PARAMETER_VALUE.Value);
     except
     end;
    if ado279.Locate('SPEC_RKEY','7',[]) then
     try
      pnl_w:=strtofloat(self.ADO279PARAMETER_VALUE.Value);
     except
     end;
     dm.ADO301AREA_SQM.Value := pnl_l*pnl_w/1000000;         //平方米
     dm.ADO301AREA_SQF.Value := dm.ADO301AREA_SQM.Value*10.7639; //平方英尺
  end;
 1:
  begin
    pnl_l:=0;
    pnl_w:=0;
    if ado279.Locate('SPEC_RKEY','8',[]) then
     try
      pnl_l:=strtofloat(self.ADO279PARAMETER_VALUE.Value);
     except
     end;
    if ado279.Locate('SPEC_RKEY','9',[]) then
     try
      pnl_w:=strtofloat(self.ADO279PARAMETER_VALUE.Value);
     except
     end;
     dm.ADO301AREA_SQM.Value := pnl_l*pnl_w/1000000;         //平方米
     dm.ADO301AREA_SQF.Value := dm.ADO301AREA_SQM.Value*10.7639; //平方英尺
  end;
 2:
  begin
    pnl_l:=0;
    pnl_w:=0;
    if ado279.Locate('SPEC_RKEY','14',[]) then
     try
      pnl_l:=strtofloat(self.ADO279PARAMETER_VALUE.Value);
     except
     end;
    if ado279.Locate('SPEC_RKEY','15',[]) then
     try
      pnl_w:=strtofloat(self.ADO279PARAMETER_VALUE.Value);
     except
     end;
     dm.ADO301AREA_SQM.Value := pnl_l*pnl_w/1000000;         //平方米
     dm.ADO301AREA_SQF.Value := dm.ADO301AREA_SQM.Value*10.7639; //平方英尺
  end;
 3:
  begin
    pnl_l:=0;
    pnl_w:=0;
    if ado279.Locate('SPEC_RKEY','17',[]) then
     try
      pnl_l:=strtofloat(self.ADO279PARAMETER_VALUE.Value);
     except
     end;
    if ado279.Locate('SPEC_RKEY','18',[]) then
     try
      pnl_w:=strtofloat(self.ADO279PARAMETER_VALUE.Value);
     except
     end;
     dm.ADO301AREA_SQM.Value := pnl_l*pnl_w/1000000;         //平方米
     dm.ADO301AREA_SQF.Value := dm.ADO301AREA_SQM.Value*10.7639; //平方英尺
  end;
end;
end;

procedure TForm3.ADOWk_selOUTSOURCEChange(Sender: TField);
begin
  if DBComboBox1.ItemIndex=0 then
  begin
    if Sender.AsBoolean then
      DM.ADO301.FieldByName('quantity').AsInteger:=DM.ADO301.FieldByName('quantity').AsInteger+ADOWk_selPNLS.Value
    else
      DM.ADO301.FieldByName('quantity').AsInteger:=DM.ADO301.FieldByName('quantity').AsInteger-ADOWk_selPNLS.Value;
  end else begin
    if Sender.AsBoolean then
      DM.ADO301.FieldByName('quantity').AsInteger:=DM.ADO301.FieldByName('quantity').AsInteger+ADOWk_selPCS.AsInteger
    else
      DM.ADO301.FieldByName('quantity').AsInteger:=DM.ADO301.FieldByName('quantity').AsInteger-ADOWk_selPCS.AsInteger;
  end;
end;

procedure TForm3.DBComboBox1Change(Sender: TObject);
begin
  if DBEdit6.Text='' then exit;
  ADOWk_sel.First;
  DM.ADO301.FieldByName('quantity').AsInteger:=0;
  while not ADOWk_sel.Eof do
  begin
    if DBComboBox1.ItemIndex=0 then
    begin
      if ADOWk_selOUTSOURCE.AsBoolean then
        DM.ADO301.FieldByName('quantity').AsInteger:=DM.ADO301.FieldByName('quantity').AsInteger+ADOWk_selPNLS.AsInteger
    end else begin
      if ADOWk_selOUTSOURCE.AsBoolean then
        DM.ADO301.FieldByName('quantity').AsInteger:=DM.ADO301.FieldByName('quantity').AsInteger+ADOWk_selPCS.AsInteger
    end;

   ADOWk_sel.Next;
  end;
end;

end.
