unit OrderVerEditFrm_mod284;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm,uCommFunc, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Data.DB, Datasnap.DBClient,
  Data.Win.ADODB, Vcl.ImgList,System.StrUtils;

type
 PTreeValue=^TTreeValue;
  TTreeValue=record
  rkey25:integer;
  custProdNO:string;
 end;

type
  TfrmOrderVerEdit_mod284 = class(TfrmBaseEdit)
    lblFilter: TLabel;
    edtFliter: TEdit;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    ts4: TTabSheet;
    pnl3: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    eh2: TDBGridEh;
    eh3: TDBGridEh;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl10: TPanel;
    pnl11: TPanel;
    pnl12: TPanel;
    pnl13: TPanel;
    pnl14: TPanel;
    btn_replace: TButton;
    btn_CReplace: TButton;
    eh1: TDBGridEh;
    tv1: TTreeView;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edt_SALES_ORDER: TRKeyRzBtnEdit;
    edt_custNo: TRKeyRzBtnEdit;
    edt_ProdNO: TRKeyRzBtnEdit;
    edt_CustProdNo: TRKeyRzBtnEdit;
    edt_address: TRKeyRzBtnEdit;
    edt_creditGrade: TRKeyRzBtnEdit;
    edt_creditAmount: TRKeyRzBtnEdit;
    edt_OweAmount: TRKeyRzBtnEdit;
    pnl15: TPanel;
    tv2: TTreeView;
    btn_add: TBitBtn;
    btn_allAdd: TBitBtn;
    btn_del: TBitBtn;
    btn_allDel: TBitBtn;
    cds60: TClientDataSet;
    cds06: TClientDataSet;
    cds492: TClientDataSet;
    cds25: TClientDataSet;
    ds25: TDataSource;
    ds06: TDataSource;
    ds60: TDataSource;
    ds492: TDataSource;
    ds06_2: TDataSource;
    cds06_2: TClientDataSet;
    qrytemp: TADOQuery;
    strngfldCUT_NO: TStringField;
    strngfldSO_NO: TStringField;
    strngfldEMPLOYEE_NAME: TStringField;
    strngfldMANU_PART_NUMBER: TStringField;
    strngfldMANU_PART_DESC: TStringField;
    intgrfldPLANNED_QTY: TIntegerField;
    intgrfldISSUED_QTY: TIntegerField;
    dtmfldISSUE_DATE: TDateTimeField;
    strngfldqrytemp确认状态: TStringField;
    strngfldqrytemp投产性质: TStringField;
    strngfldqrytemp产品属性: TStringField;
    strngfldqrytemp审核状态: TStringField;
    eh492: TDBGridEh;
    cdsTemp: TClientDataSet;
    edt_CustName: TRKeyRzBtnEdit;
    il1: TImageList;
    chk1: TCheckBox;
    procedure edt_addressButtonClick(Sender: TObject);
    procedure btn_CReplaceClick(Sender: TObject);
    procedure btn_replaceClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure btn_delClick(Sender: TObject);
    procedure btn_allAddClick(Sender: TObject);
    procedure btn_allDelClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eh492KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eh2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);

  private
    { Private declarations }
       procedure GetProdTree(ARKey25:integer; Atv:TTreeview);
       function  GetOweAmount(arkey10:integer):Currency;

       function  FindNrkey25ForDS(Acds:TClientDataSet;AfName:string):Boolean;
       function GetRkeyStr(Acds: TClientDataSet; Afield: string): string;
  public
    { Public declarations }
    Frkey60,Frkey10,Frkey12,FOrkey25,FNrkey25:Integer;
    FOprodNo,FNProdNo :string;
     function  FindNrkey25(arkey25:integer): integer;
    procedure GetData( AOrderNO:string );
  end;

var
  frmOrderVerEdit_mod284: TfrmOrderVerEdit_mod284;

implementation
  uses SelShipAddrFrm_mod284;
{$R *.dfm}

{ TfrmOrderVerEdit_mod284 }

procedure TfrmOrderVerEdit_mod284.btn_replaceClick(Sender: TObject);
var
 Lnode:ttreenode;
begin
 inherited;
  Lnode:=tv1.Selected;

 if FindNrkey25(PTreeValue(Lnode.data)^.rkey25)=0 then
 begin
   //Lnode:=tv1.Selected;
   cds25.Append;
   cds25.FieldByName('OProdNO').Value:=Lnode.Text;
   cds25.FieldByName('OCustProdNo').Value:=PTreeValue(Lnode.data)^.custProdNO;
   cds25.FieldByName('Orkey25').Value:=PTreeValue(Lnode.data)^.rkey25;     //原25.rkey
   Lnode:=tv2.Selected;
   cds25.FieldByName('NProdNO').Value:=Lnode.Text;
   cds25.FieldByName('NCustProdNo').Value:=PTreeValue(Lnode.data)^.custProdNO;
   cds25.FieldByName('Nrkey25').Value:=PTreeValue(Lnode.data)^.rkey25; //新25.rkey
   cds25.Post;
   btn_CReplace.Enabled:=true;
 end
 else
  messagedlg('需要更换的线路层已经有对应目标线路层',MTERROR,[mbcancel],0);
end;

procedure TfrmOrderVerEdit_mod284.btnCloseClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmOrderVerEdit_mod284.btnSaveClick(Sender: TObject);
var
 v_credit:double;
 i:integer;
 Lcds60,Lcds492,Lcds06,Lcds25,Lcds117,Lcds318,Lcds56:TClientDataSet;
 Lsql:String;
  LPostData,AParamArr06,AParamArr56:OleVariant;
 s:string;
begin
 inherited;
  if Frkey12=0 then
  begin
   showmessage('请确认装运地点!');
   exit;
  end;
                                        //没的找目标值
 if (chk1.Checked) and (not FindNrkey25ForDS(cds492,'BOM_ptr')) then
 begin
  messagedlg('请首先进行线路层,本厂编号对应!',mterror,[mbcancel],0);
  Exit;
 end;
     Lcds60:=TClientDataSet.Create(nil);
     Lcds06:=TClientDataSet.Create(nil);
     Lcds492:=TClientDataSet.Create(nil);
     Lcds25:=TClientDataSet.Create(nil);
     Lcds117:=TClientDataSet.Create(nil);
     Lcds318:=TClientDataSet.Create(nil);
     Lcds56:=TClientDataSet.Create(nil);

  try
     try
      if (chk1.Checked) and (not cds492.isempty) then    //更新配料单
      begin
        Lsql:='select * From data0492  where rkey in '+self.GetRkeyStr(cds492,'rkey');
        gSvrintf.IntfGetDataBySql(Lsql, Lcds492);

        cds492.First;
        while not cds492.Eof do
        begin
         if Lcds492.Locate('rkey',cds492.FieldByName('rkey').AsInteger,[]) then
         begin
         Lcds492.Edit;
         Lcds492.FieldByName('BOM_ptr').Value:=findnrkey25(cds492.FieldByName('BOM_ptr').value);
         Lcds492.Post;
         end;
        cds492.Next;
        end;
      end;

      //更新作业单 里面物料编号
      if not cds06_2.isempty then
      begin
        Lsql:='select * From data0117  where 1=2';
        gSvrintf.IntfGetDataBySql(Lsql, Lcds117);

       AParamArr06 := varArrayCreate([0, 2], varVariant);
       AParamArr06[0]:= GetRkeyStr(cds06_2,'rkey06');
       AParamArr06[1]:='data0006';
       AParamArr06[2]:='release_date';
       gSvrIntf.IntfspGetData('UpdateDate', AParamArr06, Lcds06);

       AParamArr56 := varArrayCreate([0, 2], varVariant);
       AParamArr56[0]:= GetRkeyStr(cds06_2,'rkey06');
       AParamArr56[1]:='data0056';
       AParamArr56[2]:='InTime';
       gSvrIntf.IntfspGetData('UpdateDate', AParamArr56, Lcds56);

        cds06_2.First;
        while not cds06_2.eof do
        begin
        if Lcds06.Locate('rkey',cds06_2.FieldByName('rkey06').AsInteger,[]) then
        begin

          Lcds06.Edit;
          Lcds06.FieldByName('BOM_ptr').Value:=cds06_2.FieldByName('Nrkey25').Value;
          //Lcds06.FieldByName('RELEASE_DATE').Value:=FormatDateTime('yyyy-MM-dd hh:mm:dd',Lcds06.FieldByName('RELEASE_DATE').asdatetime);
          Lcds06.Post;

          //117:
          Lcds117.Append;
          Lcds117.FieldByName('Source_ptr').Value:=cds06_2.FieldByName('rkey06').AsInteger ;
          Lcds117.FieldByName('Source_Type').Value:=2;
          Lcds117.FieldByName('Empl_ptr').Value:=StrToInt(gvar.rkey05);
          Lcds117.FieldByName('Tdate').Value:= now;
          Lcds117.FieldByName('Action').Value:= 7 ;
          Lcds117.FieldByName('Remark').Value:='订单更改升级作业单版本'+FOprodNo+':'+FNProdNo;
          Lcds117.Post;

         if Lcds56.Locate('wo_ptr',cds06_2.FieldByName('rkey06').AsInteger,[]) then
         begin
          LSql:='select STEP_NUMBER from data0038 where SOURCE_PTR='+cds06_2.FieldByName('BOM_ptr').asstring+
                ' and dept_ptr='+Lcds56.FieldByName('Dept_ptr').asstring;
          gSvrintf.IntfGetDataBySql(Lsql, cdsTemp);
           if Lcds56.FieldByName('STEP').Value<>cdstemp.FieldByName('STEP_NUMBER').Value then
           begin
           Lcds56.Edit;
           Lcds56.FieldByName('step').Value:=cdstemp.FieldByName('STEP_NUMBER').Value;
           //Lcds06.FieldByName('inTime').Value:=FormatDateTime('yyyy-MM-dd hh:mm:dd',Lcds06.FieldByName('inTime').asdatetime);
           Lcds56.Post;
           end;
         end;
        end;
        cds06_2.Next;
        end;
      end;


      Lsql:='select * From data0060 where rkey='+inttostr(Frkey60);
      gSvrintf.IntfGetDataBySql(Lsql, Lcds60);
      Lcds60.Edit;
      Lcds60.FieldByName('CUST_PART_PTR').Value:= self.FNrkey25;
      Lcds60.Post;

      //part_cpv:=dm.ADO60MANU_PART_NUMBER.Value;
      Lsql:='select * From data0318 where 1=2' ;
      gSvrintf.IntfGetDataBySql(Lsql, Lcds318);
      Lcds318.Edit;
      Lcds318.FieldByName('SALES_ORDER_PTR').Value:=Frkey60;
      Lcds318.FieldByName('TRANS_TYPE').Value:=9;
      Lcds318.FieldByName('TRANS_DESCRIPTION').Value:= '更改销售订单不同客户产品版本';
      Lcds318.FieldByName('FROM_string').Value:= self.FOprodNo;
      Lcds318.FieldByName('TO_string').Value:= self.FNProdNo;
      Lcds318.FieldByName('USER_PTR').Value:= StrToInt(gVar.rkey73);
      Lcds318.FieldByName('TRANS_DATE').Value:=Now;
      Lcds318.FieldByName('PROGRAM_SOURCE').Value:=109;
      Lcds318.Post;

      if Lcds60.FieldByName('part_price').Value<>0 then   //part_price
      begin

      Lsql:=' select * from data0025 where rkey='+Lcds60.FieldByName('CUST_PART_PTR').AsString;
       gSvrintf.IntfGetDataBySql(Lsql, Lcds25);
       Lcds25.edit;
       if Lcds60.FieldByName('tax_in_price').Value='N' then    //tax_in_price
       Lcds25.FieldByName('latest_price').Value:=
         formatfloat('0.0000',Lcds60.FieldByName('part_price').Value/Lcds60.FieldByName('EXCH_RATE').Value)
       else
       Lcds25.FieldByName('latest_price').Value:=
          formatfloat('0.0000',Lcds60.FieldByName('part_price').Value/Lcds60.FieldByName('EXCH_RATE').Value/
                              (1+Lcds60.FieldByName('RUSH_CHARGE').Value*0.01));
       Lcds25.Post;
      end;

       LPostData := varArrayCreate([0, 6], varVariant);
      if Lcds492.ChangeCount>0 then
       LPostData[0] := Lcds492.Delta;
      if Lcds06.ChangeCount>0 then
       LPostData[1] := Lcds06.Delta;
      if Lcds117.ChangeCount>0 then
       LPostData[2] := Lcds117.Delta;
      if Lcds56.ChangeCount>0 then
       LPostData[3] := Lcds56.Delta;
      if Lcds60.ChangeCount>0 then
       LPostData[4] := Lcds60.Delta;
      if Lcds318.ChangeCount>0 then
       LPostData[5] := Lcds318.Delta;
      if Lcds25.ChangeCount>0 then
       LPostData[6] := Lcds25.Delta;

      if gSvrIntf.IntfPostModData('公共基础', 284, LPostData,2) then
      begin
        showmessage('修改成功!');
        self.ModalResult:=mrok;
      end;

     except
     on E: Exception do
      begin
       messagedlg(E.Message,mterror,[mbcancel],0);
      end;
     end;
  finally
   Lcds60.free;
   Lcds492.free;
   lcds06.free;
   Lcds25.free;
   Lcds117.free;
   Lcds318.free;
   Lcds56.free;
  end;
end;

procedure TfrmOrderVerEdit_mod284.btn_addClick(Sender: TObject);
var
 i:integer;
 LField:Tfield;
begin
inherited;
  if cds06.IsEmpty  then exit;

  if  FindNrkey25(cds06.FieldByName('BOM_ptr').AsInteger)>0 then
  begin
     cds06_2.fieldbyname('wip_qty').readonly:=false;
     cds06_2.fieldbyname('rkey06').readonly:=false;
      cds06_2.Append;
      for LField in cds06_2.Fields do
      begin
        if (IndexText(LField.FieldName, ['Nrkey25']) <> -1)  then  //Nrkey25
          Continue;
        if cds06.FindField(LField.FieldName) <> nil then
        begin
          LField.value := cds06.FindField(LField.FieldName).value;
        end;
      end;
      cds06_2.FieldByName('Nrkey25').Value:=FindNrkey25(cds06.FieldByName('BOM_ptr').AsInteger) ;
      cds06_2.Post;

      cds06.Delete;
  end
  else
   messagedlg('请首先进行线路层,本厂编号对应!',mterror,[mbcancel],0);
end;

procedure TfrmOrderVerEdit_mod284.btn_allAddClick(Sender: TObject);
var
 i:integer;
 LField:Tfield;
begin
inherited;
  if cds06.IsEmpty  then exit;

  if  FindNrkey25fords(cds06,'BOM_ptr')then
  begin
      cds06.First;
      cds06_2.fieldbyname('wip_qty').readonly:=false;
      cds06_2.fieldbyname('rkey06').readonly:=false;
    while not cds06.Eof do
    begin
      cds06_2.Append;
      for LField in cds06_2.Fields do
      begin
        if  (IndexText(LField.FieldName, ['Nrkey25']) <> -1) then
          Continue;
        if cds06.FindField(LField.FieldName) <> nil then
        begin
          LField.value := cds06.FindField(LField.FieldName).value;
        end;
      end;
      cds06_2.FieldByName('Nrkey25').Value:=FindNrkey25(cds06.FieldByName('BOM_ptr').AsInteger) ;
      cds06_2.Post;

     cds06.Delete;
    end;
  end
end;

procedure TfrmOrderVerEdit_mod284.btn_allDelClick(Sender: TObject);
var
 i:integer;
 LField:Tfield;
begin
inherited;
   if cds06_2.IsEmpty  then exit;
   cds06.fieldbyname('wip_qty').readonly:=false;
   cds06.fieldbyname('rkey06').readonly:=false;
   cds06_2.First;
   while not cds06_2.eof do
   begin
    cds06.Append;
    for LField in cds06.Fields do
    begin
       if (IndexText(LField.FieldName, ['Nrkey25']) <> -1) then
        Continue;
      if cds06_2.FindField(LField.FieldName) <> nil then
      begin
        LField.value := cds06_2.FindField(LField.FieldName).value;
      end;
    end;
    cds06.Post;
    cds06_2.Delete;
   end;
end;

procedure TfrmOrderVerEdit_mod284.btn_CReplaceClick(Sender: TObject);
begin
  inherited;
  if cds25.IsEmpty  then exit;

   cds25.First;
   while not cds25.Eof  do
   begin
     cds25.Delete;
   end;
end;

procedure TfrmOrderVerEdit_mod284.btn_delClick(Sender: TObject);
var
 i:integer;
 LField:Tfield;
begin
inherited;
   if cds06_2.IsEmpty  then exit;
     cds06.fieldbyname('wip_qty').readonly:=false;
     cds06.fieldbyname('rkey06').readonly:=false;
    cds06.Append;
    for LField in cds06.Fields do
    begin
       if   (IndexText(LField.FieldName, ['Nrkey25']) <> -1) then
        Continue;
      if cds06_2.FindField(LField.FieldName) <> nil then
      begin
        LField.value := cds06_2.FindField(LField.FieldName).value;
      end;
    end;
    cds06.Post;
    cds06_2.Delete;
end;



procedure TfrmOrderVerEdit_mod284.edt_addressButtonClick(Sender: TObject);
var
LFrm:TfrmSelShipAddr_mod284;
begin
  inherited;
   LFrm:=TfrmSelShipAddr_mod284.create(nil);
   Lfrm.GetData(IntToStr(Frkey10));
   try
    if LFrm.ShowModal=mrok then
    edt_address.Text:=LFrm.cds1.FieldByName('location').AsString;

   finally
     LFrm.free;
   end;
end;

procedure TfrmOrderVerEdit_mod284.eh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(cds06.CommandText);
end;

procedure TfrmOrderVerEdit_mod284.eh492KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(cds492.CommandText);
end;

function TfrmOrderVerEdit_mod284.FindNrkey25ForDS(Acds: TClientDataSet;
  AfName: string): Boolean;
begin
  result:=true;
  Acds.First;
  while not Acds.Eof  do
  begin
  if FindNrkey25(Acds.FieldByName(AfName).AsInteger)=0 then
   begin
   result:=false;
   Break;
   end;
   Acds.Next;
  end;
end;



procedure TfrmOrderVerEdit_mod284.FormShow(Sender: TObject);
begin
  inherited;
 chk1.Checked:=true;
  tv1.Items[0].Selected:=true;
  tv2.Items[0].Selected:=true;
end;

function TfrmOrderVerEdit_mod284.FindNrkey25(arkey25:integer): integer;
begin
   result:=0;
   if cds25.IsEmpty  then exit;
   cds25.First;
   while not cds25.Eof do
   begin
   if cds25.FieldByName('Orkey25').AsInteger=arkey25 then
   begin
   result:=cds25.FieldByName('Nrkey25').asinteger;
   break;
   end;
   cds25.Next;
   end;

end;

procedure TfrmOrderVerEdit_mod284.GetData( AOrderNO:string);
var
Lsql60,Lsql06,Lsql06_2,Lsql492,Lsql25,Lsql:string;
begin
 LSql60:= ' SELECT data0060.rkey,Data0060.SALES_ORDER,Data0010.CUST_CODE as CUST_CODE, '+
        ' Data0025.MANU_PART_NUMBER,data0060.part_price,data0060.tax_in_price,data0010.cust_code as custcode,'+
        '  Data0097.PO_NUMBER,Data0005.EMPLOYEE_NAME,data0060.to_be_planned,data0010.CREDIT_RATING,'+
        '  Data0060.DUE_DATE,Data0060.SCH_DATE,Data0060.CUSTOMER_PTR,data0060.RUSH_CHARGE,'+
        '  Data0060.PARTS_ORDERED,Data0060.PARTS_SHIPPED,data0060.qty_plannned,data0010.credit_limit,'+
        '  data0060.status,data0060.prod_rel,Data0060.CUST_PART_PTR,RUSH_CHARGE_PCT_USED,'+
        '  data0025.set_qty,set_ordered,set_price,data0025.MFG_LEAD_TIME,data0010.DAYS_EARLY_SCHEDULE,'+
        '  data0060.ORIG_REQUEST_DATE,data0060.ORIG_SCHED_SHIP_DATE,TOTAL_ADD_L_PRICE,'+
        '  Data0060.PURCHASE_ORDER_PTR,data0097.po_date,data0060.EXCH_RATE,data0010.customer_name,'+
        '  data0060.REFERENCE_NUMBER,data0025.MANU_PART_DESC,CUST_SHIP_ADDR_PTR,data0060.ISSUED_QTY '+
        ' ,case when data0060.Status=1  then ''有效的''   when data0060.Status=2  then ''暂缓''    '+
        ' when data0060.Status=5  then ''已取消''   when data0060.Status=6  then ''未提交''  else '''' end as v_status '+
        ' FROM Data0005 INNER JOIN Data0097 '+
        ' INNER JOIN Data0060 '+
        ' INNER JOIN Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER JOIN '+
        ' Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY ON '+
        ' Data0097.RKEY = Data0060.PURCHASE_ORDER_PTR ON '+
        ' Data0005.RKEY = Data0060.ENTERED_BY_EMPL_PTR '+
        ' where (Data0060.STATUS <> 3) and (Data0060.STATUS <> 4)  and data0060.rkey='+inttostr(Frkey60);

   Lsql06:=' declare @Temp25 table( Nrkey25 varchar(30))  insert into  @Temp25(Nrkey25) values(0) '+
        ' SELECT dbo.Data0006.RKEY  as rkey06, dbo.Data0006.WORK_ORDER_NUMBER, '+
        ' dbo.data0492.CUT_NO, dbo.Data0025.MANU_PART_NUMBER, '+
        ' dbo.Data0025.MANU_PART_DESC, dbo.Data0006.pnl_size, '+
        ' dbo.Data0006.PROD_STATUS, dbo.Data0006.QUAN_SCH, dbo.Data0006.QUAN_REJ, '+
        ' dbo.Data0006.QUAN_PROD, dbo.Data0006.BOM_PTR,data0006.ENGG_STATUS, '+
        ' dbo.Data0006.QUAN_SCH - dbo.Data0006.QUAN_REJ - dbo.Data0006.QUAN_PROD AS wip_qty,b.Nrkey25 '+
        ' FROM dbo.Data0006 INNER JOIN '+
        ' dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO INNER JOIN '+
        ' dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY '+
         ' join @Temp25 b  on 1=1 '+
        ' WHERE    (Data0006.PROD_STATUS <> 9) and data0492.so_no = '''+AOrderNO+''' ';

     Lsql06_2:=  ' declare @Temp25 table( Nrkey25 varchar(30)) insert into  @Temp25(Nrkey25) values(0) '+
        ' SELECT dbo.Data0006.RKEY  as rkey06, dbo.Data0006.WORK_ORDER_NUMBER, '+
        ' dbo.data0492.CUT_NO, dbo.Data0025.MANU_PART_NUMBER, '+
        ' dbo.Data0025.MANU_PART_DESC, dbo.Data0006.pnl_size, '+
        ' dbo.Data0006.PROD_STATUS, dbo.Data0006.QUAN_SCH, dbo.Data0006.QUAN_REJ, '+
        ' dbo.Data0006.QUAN_PROD, dbo.Data0006.BOM_PTR,data0006.ENGG_STATUS, '+
        ' dbo.Data0006.QUAN_SCH - dbo.Data0006.QUAN_REJ - dbo.Data0006.QUAN_PROD AS wip_qty ,b.Nrkey25 '+
        ' FROM dbo.Data0006 INNER JOIN '+
        ' dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO INNER JOIN '+
        ' dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY '+
        ' join @Temp25  b on 1=1 '+
        ' WHERE data0492.so_no = ''-1'' ';

//        ' declare @Temp25 table( Nrkey25 varchar(30)) insert into  @Temp25(Nrkey25) values(16278) '+
//        ' SELECT dbo.Data0006.RKEY  as rkey06, dbo.Data0006.WORK_ORDER_NUMBER, '+
//        ' dbo.data0492.CUT_NO, dbo.Data0025.MANU_PART_NUMBER, '+
//        ' dbo.Data0025.MANU_PART_DESC, dbo.Data0006.pnl_size, '+
//        ' dbo.Data0006.PROD_STATUS, dbo.Data0006.QUAN_SCH, dbo.Data0006.QUAN_REJ, '+
//        ' dbo.Data0006.QUAN_PROD, dbo.Data0006.BOM_PTR,data0006.ENGG_STATUS, '+
//        ' dbo.Data0006.QUAN_SCH - dbo.Data0006.QUAN_REJ - dbo.Data0006.QUAN_PROD AS wip_qty ,b.Nrkey25 '+
//        ' FROM dbo.Data0006 INNER JOIN '+
//        ' dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO INNER JOIN '+
//        ' dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY '+
//        ' join @Temp25  b on 1=1 '+
//        ' WHERE  data0006.rkey in (1034197,1034199,1034200,-1) ';


   Lsql492:=                                            // (1034197,1034199,1034200,-1)
      ' SELECT dbo.data0492.rkey, data0492.CUT_NO, dbo.data0492.SO_NO, '+
      ' Data0005.EMPLOYEE_NAME,data0492.BOM_PTR, '+
      ' Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC, '+
      ' data0492.PLANNED_QTY,data0492.ISSUED_QTY,data0492.ISSUE_DATE, '+
      ' data0492.pnl1_size, data0492.PANEL_1_QTY, data0492.UPANEL1, '+
      ' data0492.pnl2_size, data0492.PANEL_2_QTY, data0492.UPANEL2, '+
      ' case data0492.Con_Flag when 0 then ''未确认''  when 2 then ''已确认'' end as 确认状态, '+
      ' case data0492.TTYPE when 0 then ''正常''  WHEN 1 THEN ''补料''  end AS 投产性质, '+
      ' case  when Data0025.PARENT_PTR is null then ''外层'' '+
      ' else ''内层'' end as 产品属性, '+
      ' case data0492.tstatus when 0 then ''已审核'' '+
      ' when 1 then ''未审核'' when 2 then ''不审核'' '+
      ' when 3 then ''已取消'' end as 审核状态 '+
      ' FROM dbo.data0492 INNER JOIN  dbo.Data0005 ON '+
      ' dbo.data0492.CREATED_BY_PTR = dbo.Data0005.RKEY INNER JOIN '+
      ' dbo.Data0025 ON dbo.data0492.BOM_PTR = dbo.Data0025.RKEY '+
      ' where data0492.so_no = '''+AOrderNO+''' ';

  Lsql25:= 'declare @Temp25 table(  '+
  ' OProdNO varchar(30),    '+
  ' OCustProdNo varchar(30),'+
  ' NProdNO varchar(30),'+
  ' NCustProdNo varchar(30),'+
  ' Orkey25 int,'+
  ' Nrkey25 int) '+
  ' select * from   @Temp25  ';


    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql60, Lsql06, Lsql06_2,
    Lsql492,Lsql25]), [cds60, cds06, cds06_2, cds492,cds25]) then    exit;

//    cds06_2.First;
//    while not cds06_2.eof do
//    begin
//    cds06_2.Edit;
//    if cds06_2.FieldByName('rkey06').value=1034199 then
//    cds06_2.FieldByName('nrkey25').value:= 16280
//    else if cds06_2.FieldByName('rkey06').value=1034200 then
//    cds06_2.FieldByName('nrkey25').value:= 16281;
//    cds06_2.Post;
//    cds06_2.Next;
//    end;

    //2替换前后的树：
    GetProdTree(cds60.FieldByName('CUST_PART_PTR').AsInteger,tv1);
    GetProdTree(FNrkey25,tv2);

   //装运地点；
  LSql:='select data0012.rkey,location,ship_to_address_1,state,zip,SHIP_CTAX_PTR,'+
     'SHIP_TO_CONTACT,SHIP_TO_PHONE,SHIP_SHIPPING_METHOD,SHIP_FOB,'+
     'STATE_SHIP_TAX_FLAG,STATE_PROD_TAX_FLAG,STATE_TOOL_TAX_FLAG '+
     'from data0012 '+
     'where data0012.rkey='+inttostr(frkey12);
   gSvrIntf.IntfGetDataBySql(Lsql,cdsTemp);
   if not cdsTemp.IsEmpty then
    begin
     frkey12:=cdsTemp.fieldvalues['rkey'];
     edt_address.Text:=cdsTemp.fieldbyname('location').AsString;
    end
   else
    frkey12:=0;

   //信用等级：
  case cds60.fieldbyname('CREDIT_RATING').Value of   //CREDIT_RATING
    1:edt_creditGrade.Text:='优';
    2:edt_creditGrade.Text:='良';
    3:edt_creditGrade.Text:='差';
  end;

  //所久金额： CUSTOMER_PTR
  GetOweAmount(cds60.fieldbyname('CUSTOMER_PTR').asinteger);

  end;

function TfrmOrderVerEdit_mod284.GetOweAmount(arkey10: integer): Currency;
var
 LBillAmount:currency;
 Lsql:string;
begin
  //计算用户所开出发票的所欠金额
  Lsql:= 'SELECT SUM((INVOICE_TOTAL - amount_paid - CASH_DISC)*EXCHANGE_RATE) '+
  ' AS total_amount FROM dbo.Data0112'+
  ' where customer_ptr='+inttostr(arkey10)+
  ' and invoice_status=1'+
  ' group by customer_ptr';
    gSvrIntf.IntfGetDataBySql(Lsql,cdsTemp);
   if not cdsTemp.isempty then
    LBillAmount:= cdsTemp.fieldvalues['total_amount']
   else
    LBillAmount:=0;

  //计算用户贷项备忘
   Lsql:='SELECT SUM(AVL_AMT * EX_RATE)'+
    ' AS total_amount FROM dbo.Data0116'+
    ' where CUST_PTR='+inttostr(arkey10)+
    ' and memo_status=1'+
    ' group by CUST_PTR';
    gSvrIntf.IntfGetDataBySql(Lsql,cdsTemp);

   if not cdsTemp.isempty then
    result:=LBillAmount-cdsTemp.fieldvalues['total_amount']
   else
    result:=LBillAmount;
end;



procedure TfrmOrderVerEdit_mod284.GetProdTree(ARKey25:integer; Atv:TTreeview);
var
 Ltv:PTreeValue;
 LNode:Ttreenode;
 LNodeArr:array of TTreeNode;
 i:Integer;
 Lsql:string;
begin

 Lsql:=' ;with CTE(rkey,PARENT_PTR,MANU_PART_NUMBER,manu_part_desc,lv) as    ' + #13+
              '(    ' + #13+
              '  select rkey,PARENT_PTR,MANU_PART_NUMBER,manu_part_desc,0  '+ #13+
              '  from data0025 where rkey='+inttostr(ARKey25) + #13+
              '  UNION ALL  '+ #13+
              '  select d25.rkey,d25.PARENT_PTR,d25.MANU_PART_NUMBER,d25.manu_part_desc,cte.lv+1 ' + #13+
              '  from data0025 d25 INNER JOIN CTE on	d25.parent_ptr=CTE.rkey ' + #13+
              ')  ' + #13+
              ' select * from CTE order by lv ';
 //    ShowMessage(SQL.Text);
    gSvrIntf.IntfGetDataBySql(Lsql,cdsTemp);

    if not cdsTemp.IsEmpty then
    begin
      cdsTemp.First;
      while not cdsTemp.Eof do
      begin
       New(Ltv);
       Ltv.rkey25:= cdsTemp.fieldbyname('rkey').AsInteger;
       Ltv.custProdNO:=cdsTemp.fieldbyname('manu_part_desc').asstring;
       Text:= cdsTemp.fieldbyname('MANU_PART_NUMBER').AsString ;

        if cdsTemp.fieldbyname('lv').AsInteger = 0 then
        begin
          LNode := Atv.Items.AddObject(nil,text,Ltv);
        end
        else
        begin
          for i:=0 to Length(LNodeArr)-1 do
          begin
            if PTreeValue(LNodeArr[i].data)^.rkey25 = cdsTemp.fieldbyname('PARENT_PTR').AsInteger  then   //
            begin
              LNode:= atv.Items.AddChildObject(LNodeArr[i],Text,Ltv);
              Break;
            end;
          end;
        end;

          SetLength(LNodeArr,Length(LNodeArr)+1);
          LNodeArr[High(LNodeArr)] := LNode;
          Lnode.ImageIndex:= cdsTemp.fieldbyname('lv').AsInteger;
        cdsTemp.Next;
      end;
       atv.FullExpand;

      if tv1.Items.Count=tv2.Items.Count then
      begin
      for i:=0 to tv1.Items.Count-1 do
      begin
      tv1.Items[i].Selected:=true;
      tv2.Items[i].Selected:=true;
      btn_replaceClick(nil);
      end;
      end;

      //tv1.Items[0].Selected:=true;
     // tv2.Items[0].Selected:=true;


    end;


 end;




function TfrmOrderVerEdit_mod284.GetRkeyStr(Acds: TClientDataSet;
  Afield: string): string;
begin
  result := '';
  if Acds.IsEmpty then
    exit;

  Acds.First;
  while not Acds.Eof do
  begin
    result := result + Acds.FieldByName(Afield).asstring + ',';
    Acds.next;
  end;

  result := '(' + result + '-1)';
end;

procedure TfrmOrderVerEdit_mod284.btn_OKClick(Sender: TObject);
var
 v_credit:double;
 i:integer;
 Lcds60,Lcds492,Lcds06,Lcds25,Lcds117,Lcds318,Lcds56:TClientDataSet;
 Lsql:String;
LPostData:OleVariant;
begin
 inherited;
 if Frkey12=0 then
  begin
   showmessage('请确认装运地点!');
   exit;
  end;
                                        //没的找目标值
 if (chk1.Checked) and (not FindNrkey25ForDS(cds492,'BOM_ptr')) then
 begin
  messagedlg('请首先进行线路层,本厂编号对应!',mterror,[mbcancel],0);
  Exit;
 end;
     Lcds60:=TClientDataSet.Create(nil);
     Lcds06:=TClientDataSet.Create(nil);
     Lcds492:=TClientDataSet.Create(nil);
     Lcds25:=TClientDataSet.Create(nil);
     Lcds117:=TClientDataSet.Create(nil);
     Lcds318:=TClientDataSet.Create(nil);
     Lcds56:=TClientDataSet.Create(nil);

  try
     try
      if (chk1.Checked) and (not cds492.isempty) then    //更新配料单
      begin
        cds492.First;
        while not cds492.Eof do
        begin
         Lsql:='select *  from data0492'+
               ' WHERE data0492.CUT_NO ='''+cds492.FieldByName('cut_no').asstring+''' ';
        gSvrintf.IntfGetDataBySql(Lsql, Lcds492);
        if not Lcds492.IsEmpty  then
        begin
         Lcds492.Edit;
         Lcds492.FieldByName('BOM_ptr').Value:=findnrkey25(cds492.FieldByName('BOM_ptr').value);
         Lcds492.Post;
        end;
        cds492.Next;
        end;
      end;

      //更新作业单 里面物料编号

      if not cds06_2.isempty then
      begin
        Lsql:='select * From data0117  where 1=2';
        gSvrintf.IntfGetDataBySql(Lsql, Lcds117);

        Lsql:='select * From data0006  where rkey in '+self.GetRkeyStr(cds06_2,'rkey');
        gSvrintf.IntfGetDataBySql(Lsql, Lcds06);

        Lsql:='select DEPT_PTR,STEP from data0056 where WO_PTR in '+self.GetRkeyStr(cds06_2,'rkey');
        gSvrintf.IntfGetDataBySql(Lsql, Lcds56);

        cds06_2.First;
        while not cds06_2.eof do
        begin
        if Lcds06.Locate('rkey',cds06_2.FieldByName('rkey').AsInteger,[]) then
        begin
          Lcds06.Edit;
          Lcds06.FieldByName('BOM_ptr').Value:=cds06_2.FieldByName('Nrkey25').Value;
          Lcds06.Post;
          //117:
          Lcds117.Append;
          Lcds117.FieldByName('Source_ptr').Value:=cds06_2.FieldByName('rkey').AsInteger ;
          Lcds117.FieldByName('Source_Type').Value:=2;
          Lcds117.FieldByName('Empl_ptr').Value:=StrToInt(gvar.rkey05);
          Lcds117.FieldByName('Tdate').Value:= now;
          Lcds117.FieldByName('Action').Value:= 7 ;
          Lcds117.FieldByName('Remark').Value:='订单更改升级作业单版本'+FOprodNo+':'+FNProdNo;
          Lcds117.Post;

         if Lcds56.Locate('wo_ptr',cds06_2.FieldByName('rkey').AsInteger,[]) then
         begin
          LSql:='select STEP_NUMBER from data0038 where SOURCE_PTR='+cds06_2.FieldByName('BOM_ptr').asstring+
                ' and dept_ptr='+Lcds56.FieldByName('Dept_ptr').asstring;
          gSvrintf.IntfGetDataBySql(Lsql, cdsTemp);
          if Lcds56.FieldByName('STEP').Value<>cdstemp.FieldByName('STEP_NUMBER').Value then
           Lcds56.Edit;
           Lcds56.FieldByName('step').Value:=cdstemp.FieldByName('STEP_NUMBER').Value;
           Lcds56.Post;
         end;
        end;
        cds06_2.Next;
        end;
      end;


      Lsql:='select * From data0060 where rkey='+inttostr(Frkey60);
      gSvrintf.IntfGetDataBySql(Lsql, Lcds60);
      Lcds60.Edit;
      Lcds60.FieldByName('CUST_PART_PTR').Value:= self.FNrkey25;
      Lcds60.Post;

      //part_cpv:=dm.ADO60MANU_PART_NUMBER.Value;
      Lsql:='select * From data0318 where 1=2' ;
      gSvrintf.IntfGetDataBySql(Lsql, Lcds318);
      Lcds318.Edit;
      Lcds318.FieldByName('SALES_ORDER_PTR').Value:=Frkey60;
      Lcds318.FieldByName('TRANS_TYPE').Value:=9;
      Lcds318.FieldByName('TRANS_DESCRIPTION').Value:= '更改销售订单不同客户产品版本';
      Lcds318.FieldByName('FROM_string').Value:= self.FOprodNo;
      Lcds318.FieldByName('TO_string').Value:= self.FNProdNo;
      Lcds318.FieldByName('USER_PTR').Value:= StrToInt(gVar.rkey73);
      Lcds318.FieldByName('TRANS_DATE').Value:=Now;
      Lcds318.FieldByName('PROGRAM_SOURCE').Value:=109;
      Lcds318.Post;

      if Lcds60.FieldByName('part_price').Value<>0 then   //part_price
      begin

      Lsql:=' select * from data0025 where rkey='+Lcds60.FieldByName('CUST_PART_PTR').AsString;
       gSvrintf.IntfGetDataBySql(Lsql, Lcds25);
       Lcds25.edit;
       if Lcds60.FieldByName('tax_in_price').Value='N' then    //tax_in_price
       Lcds25.FieldByName('latest_price').Value:=
         formatfloat('0.0000',Lcds60.FieldByName('part_price').Value/Lcds60.FieldByName('EXCH_RATE').Value)
       else
       Lcds25.FieldByName('latest_price').Value:=
          formatfloat('0.0000',Lcds60.FieldByName('part_price').Value/Lcds60.FieldByName('EXCH_RATE').Value/
                              (1+Lcds60.FieldByName('RUSH_CHARGE').Value*0.01));
       Lcds25.Post;
      end;

       LPostData := varArrayCreate([0, 6], varVariant);
      if Lcds492.ChangeCount>0 then
       LPostData[0] := Lcds492.Delta;
      if Lcds06.ChangeCount>0 then
       LPostData[1] := Lcds06.Delta;
      if Lcds117.ChangeCount>0 then
       LPostData[2] := Lcds117.Delta;
      if Lcds56.ChangeCount>0 then
       LPostData[3] := Lcds56.Delta;
      if Lcds60.ChangeCount>0 then
       LPostData[3] := Lcds60.Delta;
      if Lcds318.ChangeCount>0 then
       LPostData[3] := Lcds318.Delta;
      if Lcds25.ChangeCount>0 then
       LPostData[3] := Lcds25.Delta;

      if gSvrIntf.IntfPostModData('公共基础', 284, LPostData,2) then
      begin
//        Lcds60.MergeChangeLog;
//        Lcds06.MergeChangeLog;
//        Lcds318.MergeChangeLog;
//        Lcds117.MergeChangeLog;
        showmessage('修改成功!');
        self.ModalResult:=mrok;
      end;

     except
     on E: Exception do
      begin
       messagedlg(E.Message,mterror,[mbcancel],0);
      end;
     end;
  finally
   Lcds60.free;
   Lcds492.free;
   lcds06.free;
   Lcds25.free;
   Lcds117.free;
   Lcds318.free;
   Lcds56.free;
  end;
end;

end.
