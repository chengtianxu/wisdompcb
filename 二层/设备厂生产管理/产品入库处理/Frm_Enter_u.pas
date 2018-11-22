unit Frm_Enter_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, Buttons, DB, ComCtrls,
  ADODB, Menus, Mask, Provider, DBClient, DBCtrls;

type
  TFrm_Enter = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    BtSave: TBitBtn;
    BtClose: TBitBtn;
    Label1: TLabel;
    EdtStore: TEdit;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    DS: TDataSource;
    Label5: TLabel;
    Edit4: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Grd1: TDBGridEh;
    CheckBox1: TCheckBox;
    Label6: TLabel;
    Edit1: TEdit;
    Label7: TLabel;
    EdtSum: TEdit;
    Label9: TLabel;
    MaskEdit1: TMaskEdit;
    Label10: TLabel;
    EdtDept: TEdit;
    BitBtn1: TBitBtn;
    EdtFac: TEdit;
    BitBtn2: TBitBtn;
    LBFac: TLabel;
    LBDept: TLabel;
    LBStore: TLabel;
    CDS: TClientDataSet;
    DSP: TDataSetProvider;
    Label4: TLabel;
    dbmmo1: TDBMemo;
    procedure BtSaveClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure EdtStoreExit(Sender: TObject);
    procedure EdtFacEnter(Sender: TObject);
    procedure EdtDeptEnter(Sender: TObject);
    procedure EdtStoreEnter(Sender: TObject);
    procedure EdtDeptExit(Sender: TObject);
    procedure EdtFacExit(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtStoreKeyPress(Sender: TObject; var Key: Char);
    procedure CDSFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    Ffac,Fdept,Fstore:string;
    FinValid:boolean;

    field_name:string;
    PreColumn: TColumnEh;
    procedure getdata;
    Procedure QtyChange(Sender: TField);
  public
    procedure initd;
  end;


implementation
uses DM_u,common,Pick_Item_Single,ConstVar, Frm_main_u;

{$R *.dfm}

procedure TFrm_Enter.initd;
begin
  DM.Tmp.Close;
  DM.Tmp.SQL.Text:='select RKEY, WAREHOUSE_CODE, ABBR_NAME  from data0015 order by 1';
  DM.Tmp.Open;
  if DM.Tmp.RecordCount=1 then
  begin
    EdtFac.Text:=DM.Tmp.Fields[1].asstring;
    EdtFac.Tag:=DM.Tmp.Fields[0].AsInteger;
    LBFac.Caption:=DM.Tmp.Fields[2].asstring;
  end;
  field_name:='PROD_CODE' ;
  PreColumn:=Grd1.Columns[1];
  PreColumn.Title.Color := clred ;


  DM.GetNo(MaskEdit1,'5',0);
end;

procedure TFrm_Enter.BtSaveClick(Sender: TObject);
begin
  if   Frm_main.ExistInventory(Self.Handle,DM.Tmp) then
    Exit;

  if trim(EdtFac.Text) = '' then
  begin
    EdtFac.SetFocus ;
    showmessage('工厂不允许为空!');
    exit;
  end;
  if trim(EdtDept.Text) = '' then
  begin
    EdtDept.SetFocus ;
    showmessage('生产部门不允许为空!');
    exit;
  end;
  if trim(EdtStore.Text) = '' then
  begin
    EdtStore.SetFocus ;
    showmessage('仓库不允许为空!');
    exit;
  end;
  if EdtSum.Text='0' then
  begin
    showmessage('没有记录被选中');
    exit;
  end;


  DM.Tmp.Close;
  DM.Tmp.SQL.Text:='select getdate()';// from data0214 where status=''0''';
  DM.Tmp.Open;
  {if not DM.Tmp.IsEmpty then
  begin
    showmessage('当前正在盘点中,不能进行入库....');
    exit;
  end; }
  if FinValid then exit;

  DM.ADO416_1.Open;
  DM.ADO416_1.Append;
  DM.ADO53_1.Open;

  DM.ADO416_1.FieldByName('type').AsInteger:=2;
  DM.ADO416_1.FieldByName('empl_ptr').AsString:=user_ptr;
  DM.ADO416_1.FieldByName('sys_date').AsDateTime:=DM.Tmp.Fields[0].AsDateTime;
  DM.ADO416_1.FieldByName('warehouse_ptr').AsInteger:=EdtFac.Tag;
  DM.ADO416_1.FieldByName('dept_ptr').AsInteger:=EdtDept.Tag;
  DM.ADO416_1.FieldByName('Quantity').AsString:=EdtSum.Text;
  DM.ADO416_1.FieldByName('reference').AsString:=Edit4.Text;

  DM.ADOCon.BeginTrans;
  try
    if  not DM.GetNo(MaskEdit1,'5',1) then abort;
    DM.ADO416_1.FieldByName('number').AsString:=MaskEdit1.Text;
    DM.ADO416_1.Post;
    DM.ADO416_1.UpdateBatch(arAll);
    
    CDS.DisableControls;
    CDS.OnFilterRecord:=nil;
    CDS.Filter:='isSel=1';
    CDS.Filtered:=true;
    CDS.First;
    while not CDS.Eof do
    begin
      DM.ADO53_1.Append;
      DM.ADO53_1.FieldByName('npad_ptr').AsInteger:=DM.ADO416_1.FieldByName('rkey').AsInteger;
      DM.ADO53_1.FieldByName('loc_ptr').AsInteger:=EdtStore.Tag;
      DM.ADO53_1.FieldByName('cust_part_ptr').AsInteger:=CDS.fieldbyname('rkey08').AsInteger;
      DM.ADO53_1.FieldByName('mo_ptr').AsInteger:=CDS.fieldbyname('rkey492').AsInteger;
      DM.ADO53_1.FieldByName('quantity').AsInteger:=CDS.fieldbyname('ORD_REQ_QTY').AsInteger;
      DM.ADO53_1.FieldByName('reference_number').AsString:=CDS.fieldbyname('remark').AsString;
      DM.ADO53_1.Post;
      CDS.Next;
    end;
    dm.ADO53_1.UpdateBatch;
    DM.Tmp.Close;
    DM.Tmp.SQL.Text:='update data0492 set FG_Qty=isnull(FG_Qty,0)+B.quantity,ORD_REQ_QTY=0, '+
                     'tstatus=case when A.wip_qty=0 then 4 else A.tstatus end '+
                     'from data0492 A inner join data0053 B on  A.rkey=B.mo_ptr and A.ORD_REQ_QTY=B.quantity '+
                     'where B.npad_ptr='+DM.ADO416_1.FieldByName('rkey').AsString;
    if DM.Tmp.ExecSQL<>CDS.RecordCount then
    begin
      dm.ADOCon.RollbackTrans ;
      DM.ADO53_1.Close;
      DM.ADO416_1.Close;
      showmessage('待入库记录状态发生变化,保存失败,请重新入库操作');
      self.Close;
     // getdata;
      exit;
    end;

    DM.Tmp.SQL.Text:='update data0008 set qty_onhand=qty_onhand+B.quantity '+
                     'from data0008 A inner join (select cust_part_ptr,sum(quantity) quantity '+
                     'from data0053 where npad_ptr='+DM.ADO416_1.FieldByName('rkey').AsString+' group by cust_part_ptr) B '+
                     'on A.rkey=B.cust_part_ptr and A.dept_ptr='+DM.ADO416_1.FieldByName('dept_ptr').AsString;
    DM.Tmp.ExecSQL;

    DM.Tmp.SQL.Text:='update WZCP0001 set qty_on_hand=qty_on_hand+B.quantity '+
                     'from WZCP0001 A inner join (select cust_part_ptr,loc_ptr,sum(quantity) quantity '+
                     'from data0053 where npad_ptr='+DM.ADO416_1.FieldByName('rkey').AsString+' group by cust_part_ptr,loc_ptr) B '+
                     'on A.proc_ptr=B.cust_part_ptr and A.location_ptr=B.loc_ptr';
    DM.Tmp.ExecSQL;

    DM.Tmp.SQL.Text:='insert into WZCP0001 (proc_ptr,location_ptr,qty_on_hand) '+
                     'select cust_part_ptr,loc_ptr,sum(quantity) from data0053 '+
                     'where npad_ptr='+DM.ADO416_1.FieldByName('rkey').AsString+
                     ' and not (cast(cust_part_ptr as varchar(8))+''&''+cast(loc_ptr as varchar(8)) in '+
                     '(select cast(proc_ptr as varchar(8))+''&''+cast(location_ptr as varchar(8)) from WZCP0001)) group by cust_part_ptr,loc_ptr';
    DM.Tmp.ExecSQL;

    dm.ADOCon.CommitTrans ;
    Modalresult := mrok;
    DM.ADOQ416.Close;
    DM.ADOQ416.Open;
    DM.ADOQ416.Locate('rkey',DM.ADO416_1.FieldByName('rkey').AsInteger,[]);
  except
    on E: Exception do
    begin
      dm.ADOCon.RollbackTrans ;
      CDS.EnableControls;
      MessageDlg(E.Message,mtError, [mbOk], 0);
    end;
  end;

end;

procedure TFrm_Enter.BitBtn3Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 if (Tcomponent(Sender).Tag=2) and (EdtFac.Text='') then
 begin
   showmessage('请先选择工厂...');
   EdtFac.SetFocus;
   exit;
 end;
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    0:
    begin
      InputVar.Fields := 'WAREHOUSE_CODE/工厂编码/200,WAREHOUSE_NAME/工厂名称/250';
      InputVar.Sqlstr :='SELECT RKEY, WAREHOUSE_CODE, WAREHOUSE_NAME FROM Data0015';
      inputvar.KeyField:='WAREHOUSE_CODE';
    end;
    1:
    begin
      InputVar.Fields := 'Dept_code/部门编码/200,dept_name/部门名称/250';
      InputVar.Sqlstr :='select rkey,dept_code,dept_name '+
                        'from data0034 where (ttype in (4,5) or is_cost_dept=1)'+
                        'and (ACTIVE_FLAG=0) order by 2';
      inputvar.KeyField:='Dept_code';
      InputVar.InPut_value:=EdtDept.Text;      
    end;
    2:
    begin
      InputVar.Fields := 'CODE/仓库编码/200,LOCATION/仓库名称/250';
      InputVar.Sqlstr :='SELECT RKEY, CODE, LOCATION, LOCATION_TYPE,whouse_ptr FROM Data0016 where location_type=1 and whouse_ptr='+inttostr(EdtFac.Tag)+' order by 2';
      inputvar.KeyField:='CODE';
    end;
  end;
  InputVar.AdoConn := DM.ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     0:begin
         EdtFac.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
         LBFac.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_NAME']);
         EdtFac.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         EdtStore.Text:='';
         getdata;
         EdtDept.SetFocus;
       end;
     1:begin
         EdtDept.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_code']);
         LBDept.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_name']);
         EdtDept.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         getdata;
         Edtstore.SetFocus;
       end;
     2:begin
         Edtstore.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
         LBstore.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['LOCATION']);
         Edtstore.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         Edit4.SetFocus;
       end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;

end;

procedure TFrm_Enter.CheckBox1Click(Sender: TObject);
var iSum:integer;
begin
  if not CDS.Active then exit;
  iSum:=strtoint(EdtSum.Text);
  CDS.First ;
  while not CDS.Eof do
  begin
    CDS.Edit ;
    if CheckBox1.Checked and not CDS.FieldByName('isSel') .AsBoolean then
      iSum:=iSum+CDS.FieldByName('ORD_REQ_QTY').AsInteger
    else if not CheckBox1.Checked and CDS.FieldByName('isSel').AsBoolean then
      iSum:=iSum-CDS.FieldByName('ORD_REQ_QTY').AsInteger ;
    CDS.FieldByName('isSel').AsBoolean := CheckBox1.Checked ;

    CDS.Next ;
  end;
  CDS.First ;
  EdtSum.Text:=inttostr(iSum);
end;


procedure TFrm_Enter.Edit1Change(Sender: TObject);
begin
  CDS.Filtered:=false;
  CDS.Filtered:=true;
end;

procedure TFrm_Enter.Grd1TitleClick(Column: TColumnEh);
begin
  if (field_name <> column.FieldName) then
  begin
    Label6.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_Enter.EdtFacEnter(Sender: TObject);
begin
  FFac:=EdtFac.Text;
end;

procedure TFrm_Enter.EdtDeptEnter(Sender: TObject);
begin
 Fdept:=EdtDept.Text;
end;

procedure TFrm_Enter.EdtStoreEnter(Sender: TObject);
begin
 Fstore:=Edtstore.Text;
end;

procedure TFrm_Enter.EdtDeptExit(Sender: TObject);
begin
  if (Fdept<>EdtDept.Text) and (EdtDept.Text<>'') then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select rkey,dept_code,dept_name from data0034 where (ttype in (4,5) or is_cost_dept=1) '+
                     'and dept_code='''+EdtDept.Text+'''';
    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      messagedlg('部门代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      EdtDept.SetFocus;
      Fdept:='';
      FinValid:=true;
      abort;
    end else begin
      EdtDept.Text:=DM.tmp.FieldValues['dept_code'];
      LBDept.Caption:=DM.tmp.FieldValues['dept_name'];
      EdtDept.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
      getdata;
      FinValid:=false;
    end;
  end;
end;

procedure TFrm_Enter.EdtFacExit(Sender: TObject);
begin
  if (FFac<>EdtFac.Text) and (EdtFac.Text<>'') then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='SELECT RKEY, WAREHOUSE_CODE, WAREHOUSE_NAME FROM Data0015 where WAREHOUSE_CODE='''+EdtFac.Text+'''';
    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      messagedlg('工厂代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      EdtFac.SetFocus;
      FFac:='';
      FinValid:=true;
      abort;
    end else begin
      EdtFac.Text:=DM.tmp.FieldValues['WAREHOUSE_CODE'];
      LBFac.Caption:=DM.tmp.FieldValues['WAREHOUSE_NAME'];
      EdtFac.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
      EdtStore.Text:='';
      getdata;
      FinValid:=false;
    end;
  end;
end;

procedure TFrm_Enter.EdtStoreExit(Sender: TObject);
begin
  if (Fstore<>Edtstore.Text) and (Edtstore.Text<>'') then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='SELECT RKEY, CODE, LOCATION FROM Data0016 where location_type=1 and whouse_ptr='+inttostr(EdtFac.Tag)+' and CODE='''+Edtstore.Text+'''';
    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      messagedlg('仓库代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      Edtstore.SetFocus;
      Fstore:='';
      FinValid:=true;
      abort;
    end else begin
      Edtstore.Text:=DM.tmp.FieldValues['CODE'];
      LBstore.Caption:=DM.tmp.FieldValues['LOCATION'];
      Edtstore.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
      FinValid:=false;
    end;
  end;
end;


procedure TFrm_Enter.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.tmp.SQL.Text);
end;

procedure TFrm_Enter.getdata;
var i:integer;
begin
  if (EdtFac.Text<>'') and (EdtDept.Text<>'') then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='SELECT cast(0 as bit )isSel,dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, dbo.Data0008.PRODUCT_DESC, dbo.data0492.CUT_NO,'+
                     'dbo.data0492.ORD_REQ_QTY,dbo.Data0005.EMPLOYEE_NAME, dbo.data0492.tobestock_date, dbo.data0492.REMARK,  dbo.Data0034.DEPT_CODE,'+
                     'dbo.Data0034.DEPT_NAME,dbo.Data0008.RKEY rkey08,data0492.rkey rkey492, dbo.Data0008.REMARK REMARK8 '+
                     'FROM dbo.data0492 INNER JOIN '+
                     'dbo.Data0008 ON dbo.data0492.BOM_PTR = dbo.Data0008.RKEY INNER JOIN '+
                     'dbo.Data0034 ON dbo.data0492.mrb_ptr = dbo.Data0034.RKEY INNER JOIN '+
                     'dbo.Data0005 ON dbo.data0492.COMPLETED = dbo.Data0005.RKEY '+
                     'where data0492.WHOUSE_PTR='+inttostr(EdtFac.Tag)+' and data0492.mrb_ptr='+inttostr(EdtDept.Tag)+
                     ' and data0492.ORD_REQ_QTY>0 order by Data0008.PROD_CODE ';

    DM.tmp.Open;
    for i:=0 to DM.tmp.Fields.Count-1 do DM.tmp.Fields[i].ReadOnly:=not (i in [0,8]);
    CDS.Filter:='';
    DSP.DataSet:=DM.tmp;
    CDS.Data:=DSP.Data;
    CDS.FieldByName('isSel').OnChange:=QtyChange;
  end else
    CDS.Close;
  EdtSum.Text:='0';
  CheckBox1.Checked:=false;
end;

procedure TFrm_Enter.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_return) then
    self.SelectNext(self.ActiveControl,true,true)
end;

procedure TFrm_Enter.QtyChange(Sender: TField);
begin
  if Sender.AsBoolean then
    EdtSum.Text:=inttostr(strtoint(EdtSum.Text)+CDS.FieldByName('ORD_REQ_QTY').AsInteger)
  else
    EdtSum.Text:=inttostr(strtoint(EdtSum.Text)-CDS.FieldByName('ORD_REQ_QTY').AsInteger);
end;

procedure TFrm_Enter.EdtStoreKeyPress(Sender: TObject; var Key: Char);
begin
  if (key<>#13) and (EdtFac.Text='') then
  begin
    key:=#0;
    showmessage('请先输入工厂');
    EdtFac.SetFocus;
    abort;
  end;
end;

procedure TFrm_Enter.CDSFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Edit1.Text<>'' then
    Accept:=(Pos(uppercase(Edit1.Text),uppercase(CDS.FieldByName(field_name).AsString))>0)
  else
   Accept:=true;
end;

end.
