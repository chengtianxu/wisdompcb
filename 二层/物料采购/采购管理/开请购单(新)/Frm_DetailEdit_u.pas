unit Frm_DetailEdit_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrlsEh, StdCtrls, Buttons, DB, Mask, DBCtrls, ADODB;

type
  TFrm_DetailEdit = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    BitBtn4: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    Label11: TLabel;
    Edit3: TEdit;
    Label12: TLabel;
    BtSave: TBitBtn;
    BtCan: TBitBtn;
    EdtMat: TEdit;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBText1: TDBText;
    BitBtn2: TBitBtn;
    dbchkIF_urgency: TDBCheckBox;
    lbl1: TLabel;
    dbedtreq_quantity: TDBEdit;
    BitBtn3: TBitBtn;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Button1: TButton;
    BitBtn5: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EdtMatExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    function get_invzaitu(rkey17:integer):double;
  public
    Ftag,Frkey68:integer;
    procedure initData;
  end;

var
  Frm_DetailEdit: TFrm_DetailEdit;

implementation
uses DM_u,Pick_Item_Single,ConstVar,Frm_Matstock_u,Frm_MatZT_u, historypr, supplier,common;
{$R *.dfm}

function TFrm_DetailEdit.get_invzaitu(rkey17: integer): double;
begin
  with dm.tmp do
  begin
    close;
    sql.Clear;
    sql.Add('select SUM(Data0071.QUAN_ORD - Data0071.QUAN_RECD + Data0071.QUAN_RETN) as qty_zaitu');
    sql.Add('FROM Data0071 INNER JOIN');
    sql.Add('Data0070 ON Data0071.PO_PTR = Data0070.RKEY');
    sql.Add('WHERE Data0070.STATUS = 5');
    sql.Add('and data0071.invt_ptr='+inttostr(rkey17));
    open;
    if IsEmpty then
      Result:=0
    else
      Result:=fieldbyname('qty_zaitu').AsFloat;
   end;
end;

procedure TFrm_DetailEdit.initData;
var
  stock_qty:Single;
begin
   Edit3.Text:=floattostr(get_invzaitu(DM.AQ69INVT_PTR.Value)); //当前在途
   DM.tmp.Close;
   DM.tmp.SQL.Text:='select quan_on_hand-QUAN_ASSIGN as qty from data0017 where rkey='+DM.AQ69INVT_PTR.AsString;
   DM.tmp.Open;
   stock_qty:=DM.tmp.Fields[0].AsCurrency;
   DM.tmp.Close;
   DM.tmp.SQL.Text:='select sum(quan_on_hand) as qty from data0134 where INVENTORY_PTR='+DM.AQ69INVT_PTR.AsString;
   DM.tmp.Open;

   stock_qty:=stock_qty+DM.tmp.Fields[0].AsCurrency;
   Edit2.Text:=CurrToStr(stock_qty);  //当前库存
end;

procedure TFrm_DetailEdit.BitBtn4Click(Sender: TObject);
var InputVar: PDlgInput ;
    v1: string;
begin
  v1:=DBEdit8.text;
  if not D17Ok then exit;
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(self);
    InputVar.Fields:='inv_part_number/材料编码/150,inv_description/材料规格/200,inv_name/名称/100,'+
    'unit_name/采购单位/40,CRITICAL_MATL/重要/20,CONSIGN_ONHAND_QTY/安全库存/40,REPORT_VALUE2/最高库存/40';
    inputvar.KeyField:='inv_part_number';
    inputvar.InPut_value:=EdtMat.Text;
    frmPick_Item_Single.InitForm_New(InputVar,DM.AQ17);
    frmPick_Item_Single.edtKeyValue.Text:=self.EdtMat.Text;
    if self.EdtMat.Text<>'' then
      DM.AQ17.Filter:='inv_part_number like '''+self.EdtMat.Text+'%'''
    else
      DM.AQ17.Filter:='';
    if frmPick_Item_Single.ShowModal=mrok then
    begin
//2014-11-07tang修改去掉关联工厂开单
{      DM.tmp.Close;
      DM.tmp.SQL.Text:='SELECT  dbo.Data0017.RKEY FROM dbo.Data0017 INNER JOIN '+
                       'dbo.Data0018 ON dbo.Data0017.RKEY = dbo.Data0018.INVENT_PTR INNER JOIN '+
                       'dbo.Data0015 ON dbo.Data0018.WHOUSE_PTR = dbo.Data0015.RKEY '+
                       'where dbo.Data0017.RKEY='+DM.AQ17.fieldbyname('rkey').AsString+
                       ' and dbo.Data0015.RKEY='+whs_ptr;
      DM.tmp.Open;
      if DM.tmp.IsEmpty then
      begin
        showmessage('此款材料未在此工厂定义...');
        EdtMat.SetFocus;
        exit;
      end;  }
      if not (DM.AQ69.State in [dsBrowse]) then  DM.AQ69.Cancel;
      if DM.AQ69.Locate('INVT_PTR',DM.AQ17.fieldbyname('rkey').AsInteger,[]) then
      begin
        showmessage('此款材料在本请购单中已经存在...');
        EdtMat.SetFocus;
        DM.AQ69.Append;
        exit;
      end;
      if (DM.AQ69.State in [dsBrowse]) then  DM.AQ69.Append;
      DM.AQ69.FieldByName('purch_req_ptr').AsInteger:=Frkey68;
      DM.AQ69CONVERSION_FACTOR.Value:=DM.AQ17.fieldbyname('STOCK_PURCH').AsFloat;
      EdtMat.Text:=trim(DM.AQ17.FieldValues['inv_part_number']);
      DM.AQ69INVT_PTR.Value:=DM.AQ17.fieldbyname('rkey').AsInteger;
      DM.AQ69UNIT_PTR.Value:=DM.AQ17.fieldbyname('PURCH_UNIT_PTR').AsInteger;
      DM.AQ69avl_flag.Value:=DM.AQ17.fieldbyname('inspect').AsString;
      DM.AQ69req_unit_ptr.Value:=DM.AQ17.fieldbyname('STOCK_UNIT_PTR').AsInteger;
      DM.AQ69reason.Value:=v1;
      initData;
      DBEdit6.SetFocus;
    end else
      EdtMat.SetFocus;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrm_DetailEdit.BtSaveClick(Sender: TObject);
 var s:string;
begin
  if (DBEdit1.Text='') then
  begin
    showmessage('请输入材料编码...');
    abort;
  end;
  if (DBEdit6.Field.AsFloat<=0) then
  begin
    showmessage('请输入数量...');
    abort;
  end;
  if (DBEdit8.Text='') then
  begin
    showmessage('请输入请购原因...');
    abort;
  end;
  if Ftag=0 then
  begin
    DM.AQ69.FieldByName('req_quantity').AsFloat:= DM.AQ69.FieldByName('QUANTITY').AsFloat;
    DM.AQ69.Post;
    s:=DBEdit8.Text;
    DM.AQ69.Append;
    if Frkey68<>0 then
      DM.AQ69.FieldByName('purch_req_ptr').AsInteger:=Frkey68;
    DBEdit8.Text:=s;
    Edit2.Text:='';
    Edit3.Text:='';
    EdtMat.Text:='';
    EdtMat.SetFocus;
  end else
  begin
    DM.AQ69.FieldByName('req_quantity').AsFloat:= DM.AQ69.FieldByName('QUANTITY').AsFloat;
    modalresult:=mrok;
  end;
end;

procedure TFrm_DetailEdit.BitBtn1Click(Sender: TObject);
begin
  if DM.AQ69INVT_PTR.Value>0 then
  with TFrm_Matstock.Create(nil) do
  begin
    ADOQuery1.Close;
    ADOQuery1.Parameters[0].Value:=dm.AQ69INVT_PTR.Value;
    ADOQuery1.Parameters[1].Value:=dm.AQ69INVT_PTR.Value;
    ADOQuery1.Prepared;
    ADOQuery1.Open;
    ShowModal;
    free;
  end
end;

procedure TFrm_DetailEdit.EdtMatExit(Sender: TObject);
//var i:integer;
var
  v1: string;
begin
  v1:= DBEdit8.Text;
  if ((Ftag=0) or (Ftag=1)) and (EdtMat.Text<>'') and (EdtMat.Text<>DBEdit1.Text)
  and (ActiveControl<>BitBtn4) and (ActiveControl<>BtCan) then
  begin
    DM.AQ17.Filter:='';
    if D17Ok and DM.AQ17.Locate('inv_part_number',EdtMat.Text,[]) then
    begin

      if not (DM.AQ69.State in [dsBrowse]) then  DM.AQ69.Cancel;
      if DM.AQ69.Locate('INVT_PTR',DM.AQ17.fieldbyname('rkey').AsInteger,[]) then
      begin
        showmessage('此款材料在本请购单中已经存在...');
        EdtMat.SetFocus;
        DM.AQ69.Append;
        exit;
      end;
      if (DM.AQ69.State in [dsBrowse]) then  DM.AQ69.Append;
      DM.AQ69.FieldByName('purch_req_ptr').AsInteger:=Frkey68;
      DM.AQ69CONVERSION_FACTOR.Value:=DM.AQ17.fieldbyname('STOCK_PURCH').AsFloat;
      DM.AQ69INVT_PTR.Value:=DM.AQ17.fieldbyname('rkey').AsInteger;
      DM.AQ69UNIT_PTR.Value:=DM.AQ17.fieldbyname('PURCH_UNIT_PTR').AsInteger;
      DM.AQ69req_unit_ptr.Value:=DM.AQ17.fieldbyname('STOCK_UNIT_PTR').AsInteger;
      DM.AQ69avl_flag.Value:=DM.AQ17.fieldbyname('inspect').AsString;
      DM.AQ69reason.Value:=v1;
      initData;
      DBEdit6.SetFocus;
    end
     else
     begin
      //BitBtn4Click(Sender);
      showmessage('材料编码错误...');
      EdtMat.SetFocus;
     end;

  end
   else
   if ((Ftag=0) or (Ftag=1)) and (EdtMat.Text='') then
   begin
     DM.AQ69INVT_PTR.Value:=0;
     DM.AQ69UNIT_PTR.Value:=0;
     DM.AQ69req_unit_ptr.Value:=0;
     Edit2.Text:='';
     Edit3.Text:='';
   end;
end;

procedure TFrm_DetailEdit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_return then
   self.SelectNext(self.ActiveControl,true,true);
end;

procedure TFrm_DetailEdit.BitBtn2Click(Sender: TObject);
begin
  if DM.AQ69INVT_PTR.Value>0 then
  with TFrm_MatZT.Create(nil) do
  begin
    ADO71.Close;
    ado71.Parameters[0].Value:=dm.AQ69INVT_PTR.Value;
    ado71.Prepared;
    ADO71.Open;
    ShowModal;
    free;
  end
end;

procedure TFrm_DetailEdit.BitBtn3Click(Sender: TObject);
begin
  if DM.AQ69INVT_PTR.Value>0 then
  with TFrm_historypr.Create(nil) do
  begin
    ads69.Close;
    ads69.Parameters[0].Value:=dm.AQ69INVT_PTR.Value;
    ads69.Prepared;
    ads69.Open;
    ShowModal;
    free;
  end
 else
  common.ShowMsg('请先选择材料编码！',1);
end;

procedure TFrm_DetailEdit.Button1Click(Sender: TObject);
begin
 if DM.AQ69INVT_PTR.Value>0 then
  with TFrm_supplier.Create(nil) do
  begin
    ads23.Close;
    ads23.Parameters.ParamByName('rkey17').Value:=dm.AQ69INVT_PTR.Value;
    ads23.Prepared;
    ads23.Open;
    ShowModal;
    free;
  end
 else
  common.ShowMsg('请先选择材料编码！',1);
end;

procedure TFrm_DetailEdit.BitBtn5Click(Sender: TObject);
var InputVar: PDlgInput ;
    v1,v2: string;
begin
  v1:=DBEdit8.text;
  v2:=DBEdit9.text;
  if DBEdit9.Text='' then exit;
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(self);
    InputVar.Fields:='inv_part_number/材料编码/150,inv_description/材料规格/200,inv_name/名称/100,'+
    'unit_name/采购单位/40,CRITICAL_MATL/重要/20,CONSIGN_ONHAND_QTY/安全库存/40,REPORT_VALUE2/最高库存/40';
    inputvar.KeyField:='inv_part_number';
    InputVar.AdoConn:=DM.ADOCon;
    InputVar.Sqlstr:=Format('select d17.rkey,d17.inv_part_number,d17.inv_description,d17.inv_name,d17.STOCK_PURCH,'
+ #13#10 +'       d17.PURCH_UNIT_PTR,d17.STOCK_UNIT_PTR, '
+ #13#10 +'       case d17.CRITICAL_MATL_FLAG when 0 then ''否'' when 1 then ''是'' end as CRITICAL_MATL,'
+ #13#10 +'       d2.unit_code,d2.unit_name,d2a.unit_code st_nu_code ,d2a.unit_name st_un_name,d17.inspect,d17. REPORT_VALUE2, d17.CONSIGN_ONHAND_QTY'
+ #13#10 +'       ,SUPPLIER_PART_NO' + #13#10 +'from   data0017 d17 inner join data0002  d2 on d17.PURCH_UNIT_PTR=d2.rkey inner join '
+ #13#10 +'       data0002 d2a on d17.STOCK_UNIT_PTR=d2a.rkey INNER JOIN'
+ #13#10 +'                      dbo.Data0028 d28 ON d28.INVENTORY_PTR = d17.RKEY'
+ #13#10 +'where  d17.STOP_PURCH=''N'' and (SUPPLIER_PART_NO = ''%s'' )'
+ #13#10 + 'order by d17.inv_part_number',[DBEdit9.Text]);
    frmPick_Item_Single.InitForm_New(InputVar);

    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if not (DM.AQ69.State in [dsBrowse]) then  DM.AQ69.Cancel;
      if DM.AQ69.Locate('INVT_PTR',DM.AQ17.fieldbyname('rkey').AsInteger,[]) then
      begin
        showmessage('此款材料在本请购单中已经存在...');
        EdtMat.SetFocus;
        DM.AQ69.Append;
        exit;
      end;
      if (DM.AQ69.State in [dsBrowse]) then  DM.AQ69.Append;
      DM.AQ69.FieldByName('purch_req_ptr').AsInteger:=Frkey68;
      DM.AQ69CONVERSION_FACTOR.Value:= frmPick_Item_Single.adsPick.fieldbyname('STOCK_PURCH').AsFloat;                           
      EdtMat.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['inv_part_number']);
      DM.AQ69INVT_PTR.Value:=frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
      DM.AQ69UNIT_PTR.Value:=frmPick_Item_Single.adsPick.fieldbyname('PURCH_UNIT_PTR').AsInteger;
      DM.AQ69avl_flag.Value:=frmPick_Item_Single.adsPick.fieldbyname('inspect').AsString;
      DM.AQ69req_unit_ptr.Value:=frmPick_Item_Single.adsPick.fieldbyname('STOCK_UNIT_PTR').AsInteger;
      DM.AQ69reason.Value:=v1;
      DM.AQ69extra_req.Value:=v2;
      initData;
      DBEdit6.SetFocus;
    end else
      EdtMat.SetFocus;

  finally
    frmPick_Item_Single.Free ;
  end;
end;

end.
