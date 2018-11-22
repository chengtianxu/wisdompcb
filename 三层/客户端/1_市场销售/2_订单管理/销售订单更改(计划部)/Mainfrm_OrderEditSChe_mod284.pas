unit Mainfrm_OrderEditSChe_mod284;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Vcl.XPMan, Vcl.Menus, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Data.Win.ADODB,System.DateUtils,uCommFunc,ubasemainfrm;

type
  TfrmMain_OrderModiSChe_mod284 = class(TfrmBaseMain)
    qrytemp: TADOQuery;
    strngfldSALES_ORDER: TStringField;
    strngfldCUST_CODE: TStringField;
    strngfldMANU_PART_NUMBER: TStringField;
    strngfldPO_NUMBER: TStringField;
    strngfldEMPLOYEE_NAME: TStringField;
    fltfldPARTS_ORDERED: TFloatField;
    fltfldPARTS_SHIPPED: TFloatField;
    dtmfldORIG_SCHED_SHIP_DATE: TDateTimeField;
    strngfldMANU_PART_DESC: TStringField;
    intgrfldISSUED_QTY: TIntegerField;
    strngfld_status: TStringField;
    mni_PutOff: TMenuItem;
    mni_reStart: TMenuItem;
    mni_modiVer: TMenuItem;
    mni_WoList: TMenuItem;
    mni_OrderDetail: TMenuItem;
    cdsTemp: TClientDataSet;
    procedure btnQryClick(Sender: TObject);
    procedure mni_OrderDetailClick(Sender: TObject);
    procedure mni_WoListClick(Sender: TObject);
    procedure mni_PutOffClick(Sender: TObject);
    procedure mni_reStartClick(Sender: TObject);
    procedure mni_modiVerClick(Sender: TObject);
    procedure AfterSelCustProd;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(); override;

  end;

var
  frmMain_OrderModiSChe_mod284: TfrmMain_OrderModiSChe_mod284;

implementation
   uses OrderDetailFrm_mod284,WorkListFrm_mod284,orderNoteFrm_mod284
   ,OrderVerEditFrm_mod284,QryCustPartNoFrm_mod284;
{$R *.dfm}

{ TfrmMain_OrderModiSChe_mod284 }



procedure TfrmMain_OrderModiSChe_mod284.btnQryClick(Sender: TObject);
begin
    FMainWhereID:=0;
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'data0060.ent_date';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := FormatDateTime('yyyy-mm-dd',gfunc.GetSvrDateTime-15) +
                                  ' AND ' + FormatDateTime('YYYY-MM-DD',gfunc.GetSvrDateTime+1);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '6';
    cdsMainWhereInit.Post;
  inherited;
end;

procedure TfrmMain_OrderModiSChe_mod284.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmMain_OrderModiSChe_mod284:=nil;
end;

procedure TfrmMain_OrderModiSChe_mod284.GetData;
var
Lsql94,Lsql275:string;
begin

    try
      FMainFrmSql :=
        ' SELECT data0060.rkey,Data0060.SALES_ORDER,Data0010.CUST_CODE as CUST_CODE, '+
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
        ' where (Data0060.STATUS <> 3) and (Data0060.STATUS <> 4)';

      if trim(FMainWhere) = '' then
        FMainWhere := ' and data0060.ENT_DATE >= '''+formatdatetime('yyyy-MM-dd hh:mm:ss',gFunc.GetSvrDateTime()-15)+''' '+
                       ' and  data0060.ENT_DATE <='''+formatdatetime('yyyy-MM-dd hh:mm:ss',gFunc.GetSvrDateTime()+1)+'''  ' ;

      //FOrderby := ' ORDER BY Data0015.ABBR_NAME,data0077.seq_no  ';
      // showmessage(FMainFrmSql+FMainWhere+FOrderby);
      inherited;


    except on e:Exception do
    begin
    ShowMessage('错误：'+e.Message);
    exit;
    end;
   end;
 end;


procedure TfrmMain_OrderModiSChe_mod284.mni_OrderDetailClick(Sender: TObject);
var
 Lfrm: TfrmOrderDetail_mod284;
begin
  inherited;
 if cdsmain.isempty then exit;
  Lfrm:=TfrmOrderDetail_mod284.create(self);
  try
   Lfrm.getdata(cdsMain.fieldByName('rkey').asstring);
   LFrm.showmodal;
  finally
  LFrm.free;
  end;
end;

procedure TfrmMain_OrderModiSChe_mod284.mni_PutOffClick(Sender: TObject);
var
 Lstate:string;
 LFrm:TfrmorderNote_mod284;
 Lsql:string;
 Lcds60,Lcds06,Lcds318,Lcds117:TClientDataSet;
 LPostData:OleVariant;
 Lrkey60:integer;
begin
 inherited;
  if cdsmain.isempty then exit;
  

  if not gfunc.CheckUserAuth(1, 284) then
  begin
   ShowMessage('对不起,您本程序该功能的权限!');
   exit;
  end;

 if cdsMain.fieldbyname('status').value=2 then
  begin
  showmessage('订单已是暂缓状态！');
  exit;
  end;


if messagedlg('暂缓已投产的订单将暂缓/取消工作单您确定?',mtConfirmation,[mbyes,mbno],0)=mrno then Exit;

   Lcds60:=TClientDataSet.Create(nil);
   Lcds06:=TClientDataSet.Create(nil);
   Lcds318:=TClientDataSet.Create(nil);
   Lcds117:=TClientDataSet.Create(nil);

   Lfrm:=TfrmorderNote_mod284.Create(self);
 try
   LFrm.lbl1.Caption:=' 文件号/暂停原因:';
   LFrm.FNType:=0;// 暂停

   Lsql:='select * from data0060 where Rkey='+cdsMain.fieldbyname('rkey').AsString;
  if gSvrIntf.IntfGetDataBySql(Lsql,Lcds60) then
  if not Lcds60.IsEmpty  then
   Lfrm.mmo1.Lines.Add(Lcds60.fieldbyname('RemarkSO').AsString);

  if LFrm.ShowModal=mrok then
  begin
    if (not Lcds60.IsEmpty) and (Lcds60.fieldbyname('RemarkSO').AsString<>trim(Lfrm.mmo1.Text)) then
    begin             //原记录有记事本而且修改了
      Lcds60.Edit;
      Lcds60.fieldbyname('RemarkSO').asstring:=trim(Lfrm.mmo1.Text);
      Lcds60.Post;
    end;

   Lstate:=cdsMain.fieldbyname('v_status').AsString;      //v_status
   Lcds60.Edit;            //准备修改状态及工作单
   Lcds60.fieldbyname('status').Value:=2;  //暂缓070915改以前是取消
   Lcds60.Post;

     //记录销售订单状态更改(日志文件)
   Lsql:='select  * from data0318 where 1=2';
    gSvrIntf.IntfGetDataBySql(Lsql,Lcds318);
    Lcds318.Append;
    Lcds318.fieldbyname('SALES_ORDER_PTR').Value:= cdsMain.fieldbyname('rkey').value;
    Lcds318.fieldbyname('TRANS_TYPE').Value:=10;
    Lcds318.fieldbyname('TRANS_DESCRIPTION').Value:='更改销售订单状态为缓暂';
    Lcds318.fieldbyname('FROM_string').Value:= Lstate;
    Lcds318.fieldbyname('TO_string').Value:= cdsMain.fieldbyname('v_status').value;
    Lcds318.fieldbyname('USER_PTR').Value:= gvar.rkey73;
    Lcds318.fieldbyname('TRANS_DATE').Value:= Now;
    Lcds318.fieldbyname('PROGRAM_SOURCE').Value:= 109 ;
    Lcds318.fieldbyname('file_number').Value:= trim(LFrm.edt_no.Text);
    Lcds318.Post;

   Lsql:=' SELECT data0006.*   '+
     ' FROM dbo.Data0006 INNER JOIN'+
    ' dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO '+
    ' WHERE  (Data0006.PROD_STATUS <= 4)  and  data0492.so_no = '''+cdsMain.fieldbyname('SALES_ORDER').asstring+''' ';      //SALES_ORDER

    gSvrIntf.IntfGetDataBySql(Lsql,Lcds06);

    Lsql:='select  * from data0117 where 1=2';
    gSvrIntf.IntfGetDataBySql(Lsql,Lcds117);

   if not Lcds06.IsEmpty  then
    begin
     Lcds06.First;
     while not Lcds06.eof do
      begin
       if Lcds06.fieldbyname('PROD_STATUS').value=4 then      //PROD_STATUS
         begin
          Lcds117.Append;
          Lcds117.fieldbyname('Source_ptr').value:= Lcds06.fieldbyname('rkey').value;
          Lcds117.fieldbyname('Source_Type').value:=2 ;
          Lcds117.fieldbyname('Empl_ptr').value:= StrToInt(gVar.rkey05);
          Lcds117.fieldbyname('Tdate').value:=now ;
          Lcds117.fieldbyname('Action').value:=1 ;
          Lcds117.fieldbyname('Remark').value:='订单更改暂缓导致外发工单暂缓' ;
          Lcds117.Post;
         end
       else
       begin    //订单更改暂缓导致工单暂缓
          Lcds117.Append;
          Lcds117.fieldbyname('Source_ptr').value:= Lcds06.fieldbyname('rkey').value;
          Lcds117.fieldbyname('Source_Type').value:=2 ;
          Lcds117.fieldbyname('Empl_ptr').value:= StrToInt(gVar.rkey05);
          Lcds117.fieldbyname('Tdate').value:=now ;
          Lcds117.fieldbyname('Action').value:=1 ;
          Lcds117.fieldbyname('Remark').value:='订单更改暂缓导致工单暂缓' ;
          Lcds117.Post;
       end;

       Lcds06.edit;
       Lcds06.fieldbyname('ENGG_STATUS').value:= Lcds06.fieldbyname('PROD_STATUS').value ;

       if Lcds06.fieldbyname('PROD_STATUS').value=2 then
        Lcds06.fieldbyname('PROD_STATUS').value:=102      //PROD_STATUS
       else
        Lcds06.fieldbyname('PROD_STATUS').value:=103;
       Lcds06.post;

       Lcds06.next;
      end;
    end;

    LPostData := varArrayCreate([0, 3], varVariant);
   if Lcds60.ChangeCount>0 then
    LPostData[0] := Lcds60.Delta;
   if Lcds06.ChangeCount>0 then
    LPostData[1] := Lcds06.Delta;
   if Lcds318.ChangeCount>0 then
    LPostData[2] := Lcds318.Delta;
   if Lcds117.ChangeCount>0 then
    LPostData[3] := Lcds117.Delta;

    if gSvrIntf.IntfPostModData('公共基础', 284, LPostData,1) then
    begin
      Lcds60.MergeChangeLog;
      Lcds06.MergeChangeLog;
      Lcds318.MergeChangeLog;
      Lcds117.MergeChangeLog;
      showmessage('暂缓成功');
      Lrkey60:=cdsMain.FieldByName('rkey').Value;
      getdata();
      cdsMain.Locate('rkey',Lrkey60,[]);
    end;
  end;
finally
 Lfrm.Free;
 Lcds60.Free;
 Lcds06.Free;
 Lcds318.Free;
 Lcds117.Free;
end;
end;

procedure TfrmMain_OrderModiSChe_mod284.mni_reStartClick(Sender: TObject);
var
 Lstate:string;
 Lsql:string;
 Lcds60,Lcds06,Lcds318,Lcds117:TClientDataSet;
 LPostData: OleVariant;
 LFrm: TfrmorderNote_mod284;
 Lrkey60:integer;
begin
inherited;
  if cdsmain.isempty then exit;
  if not gfunc.CheckUserAuth(2, 284) then
  begin
   ShowMessage('对不起,您本程序该功能的权限!');
   exit;
  end;

  if messagedlg('重新起动订单将重新起动工作单您确定?',mtConfirmation,[mbyes,mbno],0)=mrno then Exit;

   Lcds60:=TClientDataSet.Create(nil);
   Lcds06:=TClientDataSet.Create(nil);
   Lcds318:=TClientDataSet.Create(nil);
   Lcds117:=TClientDataSet.Create(nil);

   Lfrm:=TfrmorderNote_mod284.Create(self);

 try                   //文件号/重新启动原因
   LFrm.lbl1.Caption:=' 文件号/重新启动原因:';
   LFrm.FNType:=1;// 启动

   Lsql:='select * from data0060 where Rkey='+cdsMain.fieldbyname('rkey').AsString;
  if gSvrIntf.IntfGetDataBySql(Lsql,Lcds60) then
  if not Lcds60.IsEmpty  then
   Lfrm.mmo1.Lines.Add(Lcds60.fieldbyname('RemarkSO').AsString);

  if LFrm.ShowModal=mrok then
  begin
    if (not Lcds60.IsEmpty) and (Lcds60.fieldbyname('RemarkSO').AsString<>trim(Lfrm.mmo1.Text)) then
    begin             //原记录有记事本而且修改了
      Lcds60.Edit;
      Lcds60.fieldbyname('RemarkSO').asstring:=trim(Lfrm.mmo1.Text);
      Lcds60.Post;
    end;

   //修改状态及工作单
   Lstate:=cdsMain.fieldbyname('v_status').AsString;      //v_status
   Lcds60.Edit;
   Lcds60.fieldbyname('status').Value:=1;
   Lcds60.Post;

     //记录销售订单状态更改(日志文件)
    Lsql:='select  * from data0318 where 1=2';
    gSvrIntf.IntfGetDataBySql(Lsql,Lcds318);
    Lcds318.Append;
    Lcds318.fieldbyname('SALES_ORDER_PTR').Value:= cdsMain.fieldbyname('rkey').value;
    Lcds318.fieldbyname('TRANS_TYPE').Value:=10;
    Lcds318.fieldbyname('TRANS_DESCRIPTION').Value:='更改销售订单状态为有效';
    Lcds318.fieldbyname('FROM_string').Value:= Lstate;
    Lcds318.fieldbyname('TO_string').Value:= cdsMain.fieldbyname('v_status').value;
    Lcds318.fieldbyname('USER_PTR').Value:= gvar.rkey73;
    Lcds318.fieldbyname('TRANS_DATE').Value:= Now;
    Lcds318.fieldbyname('PROGRAM_SOURCE').Value:= 109 ;
    Lcds318.fieldbyname('file_number').Value:= trim(LFrm.edt_no.Text);
    Lcds318.Post;

   Lsql:=' SELECT data0006.*   '+
     ' FROM dbo.Data0006 INNER JOIN'+
     ' dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO '+
     ' WHERE (Data0006.PROD_STATUS = 103 or Data0006.PROD_STATUS = 102) and  data0492.so_no = '''+cdsMain.fieldbyname('SALES_ORDER').asstring+''' ';      //SALES_ORDER
    gSvrIntf.IntfGetDataBySql(Lsql,Lcds06);

    Lsql:='select  * from data0117 where 1=2';
    gSvrIntf.IntfGetDataBySql(Lsql,Lcds117);


    if not Lcds06.IsEmpty then
    begin
     Lcds06.First;
     while not Lcds06.eof do
      begin
          Lcds117.Append;
          Lcds117.fieldbyname('Source_ptr').value:= Lcds06.fieldbyname('rkey').value;
          Lcds117.fieldbyname('Source_Type').value:=2 ;
          Lcds117.fieldbyname('Empl_ptr').value:= StrToInt(gVar.rkey05);
          Lcds117.fieldbyname('Tdate').value:=now ;
          Lcds117.fieldbyname('Action').value:=2 ;
          Lcds117.fieldbyname('Remark').value:='订单更改生效导致工单生效' ;
          Lcds117.Post;

       Lcds06.edit;
       Lcds06.fieldbyname('PROD_STATUS').value:= Lcds06.fieldbyname('ENGG_STATUS').value ;
       Lcds06.fieldbyname('ENGG_STATUS').value:=null;      //PROD_STATUS
       Lcds06.post;

       Lcds06.next;
      end;
    end;

    LPostData := varArrayCreate([0, 3], varVariant);
   if Lcds60.ChangeCount>0 then
    LPostData[0] := Lcds60.Delta;
   if Lcds06.ChangeCount>0 then
    LPostData[1] := Lcds06.Delta;
   if Lcds318.ChangeCount>0 then
    LPostData[2] := Lcds318.Delta;
   if Lcds117.ChangeCount>0 then
    LPostData[3] := Lcds117.Delta;

    if gSvrIntf.IntfPostModData('公共基础', 284, LPostData,1) then
    begin
      Lcds60.MergeChangeLog;
      Lcds06.MergeChangeLog;
      Lcds318.MergeChangeLog;
      Lcds117.MergeChangeLog;
      showmessage('启动成功');
      Lrkey60:=cdsMain.FieldByName('rkey').Value;
      getdata();
      cdsMain.Locate('rkey',Lrkey60,[]);
    end;
  end;
finally
 Lfrm.Free;
 Lcds60.Free;
 Lcds06.Free;
 Lcds318.Free;
 Lcds117.Free;
end;
end;

procedure TfrmMain_OrderModiSChe_mod284.mni_WoListClick(Sender: TObject);
var
LFrm: TfrmWorkList_mod284;
 Lstr  :string;
begin
  inherited;
 if cdsmain.isempty then exit;
  LFrm:=TfrmWorkList_mod284.Create(self);
  try
  if (cdsMain.fieldByName('status').Value=1) then    //status
   Lstr:= 'and Data0006.PROD_STATUS <= 6 '
  else
  Lstr:=' and (Data0006.PROD_STATUS = 103 or Data0006.PROD_STATUS = 102) ';

  Lstr:=' and data0492.so_no ='''+cdsMain.fieldByName('SALES_ORDER').asstring+''' ' +Lstr+ ' order by work_order_number ';
  LFrm.InitWithPickID(284,3,LStr);
  Lfrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;



procedure TfrmMain_OrderModiSChe_mod284.mni_modiVerClick(Sender: TObject);
var
Lfrm: TfrmQryCustPartNo_mod284;
Lfrm2:TfrmOrderVerEdit_mod284;
Lsql,Lstr:string;
Lcds192,Lcds492:TClientDataSet;
 rkey60,i:integer;
 part_cpv:string;
begin
  inherited;
  if cdsmain.isempty then exit;
  if not gfunc.CheckUserAuth(3, 284) then
  begin
   ShowMessage('对不起,您本程序该功能的权限!');
   exit;
  end;
  Lcds192:=TClientDataSet.Create(nil);
  LFrm:=TfrmQryCustPartNo_mod284.Create(nil);
  try
    Lsql:='select artaxontax,aptaxontax,QTE_control2,ppc_control15, '+
    ' custcitool,custciprod,suplcimat,custciship,CUSTCOPROD,custcoTool'+
    ' from data0192';
    gSvrIntf.IntfGetDataBySql(Lsql,Lcds192);

    if cdsMain.FieldByName('qty_plannned').Value>0 then
    begin
     Lstr:=  ' and data0025.onhold_planning_flag=0';
     if  Lcds192.FieldByName('custcoTool').Value<>'Y' then  //custcoTool
     Lstr:=Lstr+' and data0025.customer_ptr='+cdsMain.FieldByName('CUSTOMER_PTR').asstring;   //CUSTOMER_PTR
    end
    else
    begin
     if  Lcds192.FieldByName('custcoTool').Value<>'Y' then  //custcoTool
     Lstr:=' and data0025.customer_ptr='+cdsMain.FieldByName('CUSTOMER_PTR').asstring;
    end;
    Lstr:=Lstr+ ' order by manu_part_number ' ;

   Lfrm.InitWithPickID(284,2,Lstr);

   if Lfrm.cdsPick.IsEmpty then
     showmessage('对不起,没有找到该客户产品版本不同的型号!')
   else
   if Lfrm.ShowModal = mrok then
   begin
    LFrm2:=TfrmOrderVerEdit_mod284.Create(nil);
    Lfrm2.FOrkey25:= cdsMain.FieldByName('rkey').AsInteger;
    Lfrm2.FNrkey25:=Lfrm.cdsPick.FieldByName('rkey').AsInteger;
    Lfrm2.Frkey12:= cdsMain.FieldByName('CUST_SHIP_ADDR_PTR').AsInteger ; //
    Lfrm2.Frkey10:= Lfrm.cdsPick.FieldByName('customer_ptr').AsInteger;
    Lfrm2.FOprodNo:=cdsMain.FieldByName('MANU_PART_NUMBER').asstring ;
    Lfrm2.FNprodNo:=LFrm.cdsPick.FieldByName('manu_part_number').asstring ;
    Lfrm2.Frkey60:=cdsMain.FieldByName('rkey').AsInteger;

    Lfrm2.GetData(cdsMain.FieldByName('SALES_ORDER').AsString);
    Lfrm2.pgc1.ActivePageIndex:=0;
    try
    if LFrm2.ShowModal=mrok then
    begin
     rkey60 := cdsMain.fieldbyname('rkey').Value;
     btnRefreshClick(sender);
     cdsMain.Locate('rkey',rkey60,[]);
    end;
    finally
     Lfrm2.Free;
    end;
   end;
  finally
  Lfrm.Free;
  Lcds192.Free;
  end;
end;

procedure TfrmMain_OrderModiSChe_mod284.AfterSelCustProd;
var
Lfrm:TfrmOrderVerEdit_mod284;
begin
   LFrm:=TfrmOrderVerEdit_mod284.Create(nil);
   try

   finally
     Lfrm.Free;
   end;

end;
end.
