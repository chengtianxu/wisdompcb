unit DirectIn;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, ComCtrls, Mask,
  Menus, DB, ADODB;

type
  TForm_DirectIn = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    BtnSave: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label12: TLabel;
    LBFac: TLabel;
    Label9: TLabel;
    LBVend: TLabel;
    Label11: TLabel;
    LBCurr: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    MaskEdit1: TMaskEdit;
    EdtFac: TEdit;
    EdtVend: TEdit;
    EdtCurr: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DataSource1: TDataSource;
    ADO133: TADOQuery;
    ADO133RKEY: TAutoIncField;
    ADO133GRN_NUMBER: TStringField;
    ADO133DELIVER_NUMBER: TStringField;
    ADO133warehouse_ptr: TIntegerField;
    ADO133SUPP_PTR: TIntegerField;
    ADO133currency_ptr: TIntegerField;
    ADO133exch_rate: TBCDField;
    ADO133PO_PTR: TIntegerField;
    ADO133TTYPE: TSmallintField;
    ADO133CREATE_DATE: TDateTimeField;
    ADO133CREATE_BY: TIntegerField;
    ADO133ship_DATE: TDateTimeField;
    ADO133ship_BY: TStringField;
    ADO133REF_NUMBER: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FCurrDate:TDatetime;
  public
    { Public declarations }
    aded_flag:byte;
    procedure initd;
  end;

var
  Form_DirectIn: TForm_DirectIn;

implementation

uses demo, PoInWh, Main,Pick_Item_Single,ConstVar,common, DeInEdit,
  form_main_in;

{$R *.dfm}
procedure TForm_DirectIn.initd;
begin
  dm.tmpt.Close;
  dm.tmpt.SQL.Text:='select getdate()';
  dm.tmpt.Open;
  FCurrDate:=dm.tmpt.Fields[0].AsDateTime;
  DateTimePicker1.DateTime:=dm.tmpt.Fields[0].AsDateTime;
  dm.ado04.Parameters[0].Value:='data0133';
  dm.ado04.Open;
  if dm.ado04SEED_FLAG.Value<>1 then
  maskedit1.Text:=dm.ado04SEED_VALUE.Value;
  if dm.ado04SEED_FLAG.Value=4 then
  maskedit1.ReadOnly:=true;
  dm.ado04.Close;
end;

procedure TForm_DirectIn.SpeedButton1Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    0:
    begin
      InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/150,WAREHOUSE_NAME/工厂名称/250';
      InputVar.Sqlstr :='SELECT RKEY, WAREHOUSE_CODE, WAREHOUSE_NAME FROM  dbo.Data0015 order by WAREHOUSE_CODE';
      inputvar.KeyField:='WAREHOUSE_CODE';
      InputVar.InPut_value:=EdtFac.Text;
    end;
    1:
    begin
      InputVar.Fields := 'CODE/供应商编码/80,SUPPLIER_NAME/供应商名称/250,ABBR_NAME/供应商简称/150';
      InputVar.Sqlstr :='SELECT RKEY, CODE, SUPPLIER_NAME, ABBR_NAME FROM dbo.Data0023 where EDI_OUT_NEW_PO=1 order by CODE';
      inputvar.KeyField:='CODE';
      InputVar.InPut_value:=EdtVend.Text;
    end;
    2:
    begin
      InputVar.Fields := 'CURR_CODE/货币代码/150,CURR_NAME/货币名称/150,,BASE_TO_OTHER/汇率/100';
      InputVar.Sqlstr :='SELECT RKEY, CURR_CODE, CURR_NAME, BASE_TO_OTHER FROM  dbo.Data0001 order by 2';
      inputvar.KeyField:='CURR_CODE';
    end;
  end;
  InputVar.AdoConn :=dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     0:begin
         EdtFac.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
         LBFac.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_NAME']);
         EdtFac.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
       end;
     1:begin
         EdtVend.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
         LBVend.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME']);
         EdtVend.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         with dm.tmpt do
         begin
         close;
         sql.Clear;
         sql.Text:='select data0001.RKEY, data0001.CURR_CODE, data0001.CURR_NAME, data0001.BASE_TO_OTHER from data0001 inner join data0023 on data0023.CURRENCY_PTR=data0001.rkey where data0023.rkey=:rkey';
         dm.tmpt.Parameters[0].Value:=edtvend.Tag;
         open;
         edtcurr.Text:=trim(dm.tmpt.FieldValues['CURR_CODE']);
         edtcurr.tag:=dm.tmpt.FieldValues['rkey'];
         lbcurr.Caption :=trim(dm.tmpt.FieldValues['curr_name']);
         edit1.Text:=trim(dm.tmpt.FieldValues['base_to_other']);
  end;
       end;
     2:begin
         EdtCurr.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CURR_CODE']);
         LBCurr.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['CURR_NAME']);
         EdtCurr.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;

         Edit1.Text:=frmPick_Item_Single.adsPick.fieldbyname('BASE_TO_OTHER').AsString;
       end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;
end;

procedure TForm_DirectIn.BtnSaveClick(Sender: TObject);
begin
if aded_flag=1 then
begin
MaskEdit1.SetFocus;

  if MaskEdit1.Text='' then
  begin
    showmessage('入库号不能为空!');
    exit;
  end;
  if EdtFac.Text='' then
  begin
    showmessage('工厂不能为空!');
    exit;
  end;
  if EdtVend.Text='' then
  begin
    showmessage('供应商不能为空!');
    exit;
  end;
  if EdtCurr.Text='' then
  begin
    showmessage('货币不能为空!');
    exit;
  end;
  if dm.ADO134_1.IsEmpty then
  begin
    showmessage('没有材料要入库!');
    exit;
  end;
    if form_poin.find_soerror(trim(maskedit1.Text)) then
  if messagedlg('入仓编号重复,可能有多台计算机同时新增,是否自动更新编号?',
     mtConfirmation,[mbYes,mbNo],0)=mrYes  then
   begin
    dm.ado04.Close;
    dm.ado04.Parameters[0].Value:='data0133';
    dm.ado04.Open;
    maskedit1.Text:=dm.ado04SEED_VALUE.Value;
   end
  else
   begin
    maskedit1.SetFocus;
    exit;
   end;
  DM.ADO133.Close;
  DM.ADO133.Open;
  DM.ADO133.Append;
  DM.ADO133.FieldByName('warehouse_ptr').AsInteger:=EdtFac.Tag;
  DM.ADO133.FieldByName('SUPP_PTR').AsInteger:=EdtVend.Tag;
  DM.ADO133.FieldByName('currency_ptr').AsInteger:=EdtCurr.Tag;
  DM.ADO133.FieldByName('exch_rate').AsFloat:=strtofloat(Edit1.Text);

  DM.ADO133.FieldByName('ship_by').AsString:=Edit2.Text;
  DM.ADO133.FieldByName('deliver_number').AsString:=Edit3.Text;
  DM.ADO133.FieldByName('ref_number').AsString:=Edit4.Text;

  DM.ADO133.FieldByName('TTYPE').AsInteger:=3;
  DM.ADO133.FieldByName('ship_DATE').AsDateTime:=DateTimePicker1.DateTime;
  DM.ADO133.FieldByName('CREATE_DATE').AsDateTime:=FCurrDate;
  DM.ADO133.FieldByName('CREATE_by').Value:=Form_Main.rkey05;
  DM.ADOConnection1.BeginTrans;
  try
    dm.update04('data0133');
    DM.ADO133.FieldByName('GRN_NUMBER').AsString:=MaskEdit1.Text;
    DM.ADO133.Post;
    DM.ADO133.UpdateBatch(arAll);

    DM.ADO134.Open;
    DM.ADO134_1.First;
    while not DM.ADO134_1.Eof do
    begin
      DM.ADO134.Append;
      DM.ADO134.FieldByName('GRN_PTR').AsInteger:=DM.ADO133.FieldByName('rkey').AsInteger;
      DM.ADO134.FieldByName('INVENTORY_PTR').AsInteger:=DM.ADO134_1.FieldByName('INVENTORY_PTR').AsInteger;
      DM.ADO134.FieldByName('LOCATION_PTR').AsInteger:=DM.ADO134_1.FieldByName('LOCATION_PTR').AsInteger;

      DM.ADO134.FieldByName('UNIT_PTR').AsInteger:=DM.ADO134_1.FieldByName('UNIT_PTR').AsInteger;
      DM.ADO134.FieldByName('QUANTITY').AsFloat:=DM.ADO134_1.FieldByName('QUANTITY').AsFloat;
      DM.ADO134.FieldByName('QUAN_ON_HAND').AsFloat:=DM.ADO134_1.FieldByName('QUANTITY').AsFloat;

      DM.ADO134.FieldByName('tax_price').AsFloat:=DM.ADO134_1.FieldByName('tax_price').AsFloat;
      DM.ADO134.FieldByName('PRICE').AsFloat:=DM.ADO134_1.FieldByName('tax_price').AsFloat/(1+DM.ADO134_1.FieldByName('TAX_2').AsFloat/100);

      DM.ADO134.FieldByName('TAX_2').AsFloat:=DM.ADO134_1.FieldByName('TAX_2').AsFloat;
      DM.ADO134.FieldByName('BARCODE_ID').asstring:=DM.ADO134_1.FieldByName('BARCODE_ID').asstring;
      DM.ADO134.FieldByName('MANU_DATE').AsDateTime:=DM.ADO134_1.FieldByName('MANU_DATE').AsDateTime;
      DM.ADO134.FieldByName('rohs').asstring:=DM.ADO134_1.FieldByName('rohs').asstring;
      
      with dm.tmpt do
      begin
      close;
      sql.Text:='select qte_price2 from data0028 where inventory_ptr='+#13+
                 DM.ADO134_1.FieldByName('INVENTORY_PTR').AsString+'and supplier_ptr='+inttostr(EdtVend.Tag);
      Open;
      end;
      if dm.tmpt.RecordCount>0 then
      begin
        if (dm.tmpt.FieldByName('qte_price2').AsInteger<>0) then
        dm.ADO134EXPIRE_DATE.Value:=DM.ADO134_1.FieldByName('manu_date').Value+dm.tmpt.FieldValues['qte_price2'];
      end
      else
      begin
      with dm.tmpt do
      begin
      close;
      sql.Text:='select shelf_life from data0017 where rkey='+DM.ADO134_1.FieldByName('INVENTORY_PTR').AsString;
      open;
      end;
        if (dm.tmpt.FieldByName('shelf_life').AsInteger<>0) then
        dm.ADO134EXPIRE_DATE.Value:=DM.ADO134_1.FieldByName('manu_date').Value+dm.tmpt.FieldValues['shelf_life'];
      end;
      DM.ADO134.Post;

      DM.ADO134_1.Next;
    end;
    DM.ADO134.UpdateBatch(arAll);
    DM.ADOConnection1.CommitTrans;
    Frkey133:=DM.ADO133.FieldByName('rkey').asinteger;
    DM.ADO133.close;
    DM.ADO134.close;
    dm.ADS133.Close;
    dm.ADS133.Open;
    showmessage('保存数据成功!');
    modalresult:=mrok;
    DM.ADO134_1.close;
  except
    on e:exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      showmessage('保存数据失败:'+e.Message);
    end;
  end;
end
else
begin
self.ADO133.Close;
self.ADO133.Parameters[0].Value:=dm.ADS133RKEY.Value;
self.ADO133.Open;
self.ADO133.Edit;
self.ADO133ship_BY.Value:=Edit2.Text;
self.ADO133DELIVER_NUMBER.Value:=Edit3.Text;
self.ADO133REF_NUMBER.Value:=Edit4.Text;
self.ADO133ship_DATE.Value:=DateTimePicker1.DateTime;
self.ADO133.Post;
showmessage('保存数据成功!');
dm.ADS133.Close;
dm.ADS133.Open;
modalresult:=mrok;
end;
end;

procedure TForm_DirectIn.N1Click(Sender: TObject);
begin
  if trim(EdtFac.Text)='' then
  begin
    showmessage('请先输入工厂!');
    exit;
  end;
  if trim(EdtVend.Text)='' then
  begin
    showmessage('请先输入供应商!');
    exit;
  end;
  if trim(EdtCurr.Text)='' then
  begin
    showmessage('请先输入货币!');
    exit;
  end;
  Form_DeInEdit:=TForm_DeInEdit.Create(nil);
  try
    Form_DeInEdit.init(EdtFac.Tag,EdtVend.Tag);
    Form_DeInEdit.ShowModal;
  finally
    Form_DeInEdit.Free;
  end;
end;

procedure TForm_DirectIn.N2Click(Sender: TObject);
begin
dm.ADO134_1.Delete;
end;

procedure TForm_DirectIn.BitBtn9Click(Sender: TObject);
begin
close;
end;

procedure TForm_DirectIn.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if self.aded_flag in [1,2] then
CanClose:=(modalresult=mrok) or (Application.MessageBox('确认不保存退出吗?', PChar('提示'),MB_YESNO)=6);
end;

procedure TForm_DirectIn.FormActivate(Sender: TObject);
begin
if self.aded_flag=1 then
begin
self.initd;
dm.ADO134_1.Close;
dm.ADO134_1.Parameters[0].Value:=null;
dm.ADO134_1.Open;
end;
if (self.aded_flag=2) or (self.aded_flag=3) then
begin
self.initd;
maskedit1.ReadOnly:=true;
maskedit1.Text:=dm.ADS133GRN_NUMBER.Value;
SpeedButton1.Enabled:=false;
SpeedButton2.Enabled:=false;
SpeedButton3.Enabled:=false;
EdtFac.Text:=dm.ADS133warehouse_code.Value;
LBFac.Caption:=dm.ADS133warehouse_name.Value;
EdtVend.Text:=dm.ADS133code.Value;
LBVend.Caption:=dm.ADS133supplier_name.Value;
EdtCurr.Text:=dm.ADS133curr_code.Value;
LBCurr.Caption:=dm.ADS133curr_name.Value;
edit1.Text:=dm.ADS133exch_rate.AsString;
DateTimePicker1.DateTime:=dm.ADS133ship_DATE.Value;
edit2.Text:=dm.ADS133ship_BY.Value;
edit3.Text:=dm.ADS133DELIVER_NUMBER.Value;
edit4.Text:=dm.ADS133REF_NUMBER.Value;
dm.ADO134_1.Close;
dm.ADO134_1.Parameters[0].Value:=dm.ADS133RKEY.Value;
dm.ADO134_1.Open;
end;
end;

end.
