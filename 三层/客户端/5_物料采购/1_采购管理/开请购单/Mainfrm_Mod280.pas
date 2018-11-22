unit Mainfrm_Mod280;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ubasemainfrm, DBGridEhGrouping,System.DateUtils,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.ExtCtrls, Vcl.XPMan, Data.DB,
  Datasnap.DBClient, Vcl.Menus, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls,
  Vcl.Buttons,ucommfunc, EhLibVCL,System.Win.ComObj;

type
  TfrmMain_Mod280 = class(TfrmBaseMain)
    Splitter1: TSplitter;
    cdsDetail: TClientDataSet;
    dsDetail: TDataSource;
    mniNew: TMenuItem;
    mniEdit: TMenuItem;
    mniDele: TMenuItem;
    Panel1: TPanel;
    dbg69: TDBGridEh;
    dbg204: TDBGridEh;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    cbx2: TCheckBox;
    cbx4: TCheckBox;
    cbx3: TCheckBox;
    cbx5: TCheckBox;
    cbx6: TCheckBox;
    cbx7: TCheckBox;
    cbx1: TCheckBox;
    mniView: TMenuItem;
    mniNewSC: TMenuItem;
    mniNewZY: TMenuItem;
    N3: TMenuItem;
    mniCopy: TMenuItem;
    mniSubmit: TMenuItem;
    mniAppView: TMenuItem;
    mniRecView: TMenuItem;
    N6: TMenuItem;
    mniExpPur: TMenuItem;
    mniReason: TMenuItem;
    cds68: TClientDataSet;
    mniprint: TMenuItem;
    pmApprove: TPopupMenu;
    mniApprove: TMenuItem;
    mniCancel: TMenuItem;
    mniReturn: TMenuItem;
    N8: TMenuItem;
    mniExamView: TMenuItem;
    mniAuthInfo: TMenuItem;
    pmDelApp: TPopupMenu;
    mniHisPrice: TMenuItem;
    mniSuppliers: TMenuItem;
    rgStatus: TRadioGroup;
    pm69: TPopupMenu;
    mniView69: TMenuItem;
    pm204: TPopupMenu;
    mniView204: TMenuItem;
    lblFac: TLabel;
    cmbFac: TComboBox;
    pmAward: TPopupMenu;
    mniAddAwd: TMenuItem;
    mniAwdSc: TMenuItem;
    mniAwdZx: TMenuItem;
    mniAwdEdit: TMenuItem;
    mniAwdView: TMenuItem;
    mniAwdSub: TMenuItem;
    mniAwdRej: TMenuItem;
    N12: TMenuItem;
    mniAwdAuth: TMenuItem;
    mniAwdSh: TMenuItem;
    mniAwdExp: TMenuItem;
    mniAwdCopy: TMenuItem;
    btnQryZt: TBitBtn;
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure mniEditClick(Sender: TObject);
    procedure mniViewClick(Sender: TObject);
    procedure cbx1Click(Sender: TObject);
    procedure mniNewSCClick(Sender: TObject);
    procedure mniSubmitClick(Sender: TObject);
    procedure mniDeleClick(Sender: TObject);
    procedure mniAppViewClick(Sender: TObject);
    procedure btnQryClick(Sender: TObject);
    procedure mniNewZYClick(Sender: TObject);
    procedure mniCopyClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure mniRecViewClick(Sender: TObject);
    procedure mniExpPurClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniReasonClick(Sender: TObject);
    procedure rgStatusClick(Sender: TObject);
    procedure pmApprovePopup(Sender: TObject);
    procedure pmDelAppPopup(Sender: TObject);
    procedure mniApproveClick(Sender: TObject);
    procedure mniCancelClick(Sender: TObject);
    procedure mniAuthInfoClick(Sender: TObject);
    procedure mniReturnClick(Sender: TObject);
    procedure ehMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure mniExamViewClick(Sender: TObject);
    procedure mniAwdScClick(Sender: TObject);
    procedure mniAwdZxClick(Sender: TObject);
    procedure cmbFacChange(Sender: TObject);
    procedure dbg69DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure mniAwdEditClick(Sender: TObject);
    function if_finished():boolean;
    procedure mniAwdCopyClick(Sender: TObject);
    procedure pmAwardPopup(Sender: TObject);
    procedure mniAwdSubClick(Sender: TObject);
    procedure mniAwdRejClick(Sender: TObject);
    procedure mniAwdViewClick(Sender: TObject);
    procedure mniView69Click(Sender: TObject);
    procedure mniView204Click(Sender: TObject);
    procedure mniHisPriceClick(Sender: TObject);
    procedure mniSuppliersClick(Sender: TObject);
    procedure btnQryZtClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure ehMainDblClick(Sender: TObject);
  private
    { Private declarations }
    function GetAddWhere1: string;
  public
    { Public declarations }
    procedure GetData();override;
    procedure OnAfterAdd;
  end;


implementation
uses Editfrm_Mod280, AuthInfo_Mod280, uBaseMainWhereFrm, MaterZt_Mod280,
  RecInf_Mode280,System.StrUtils, Remark_Mod280, EditDetail_Mod27,
  EditDetailZx_Mod27, QrySupp_Mod280, HisPriceZx_Mod27, HisPrice_Mod27;
{$R *.dfm}

{ TfrmMain_Mod280 }
function TfrmMain_Mod280.if_finished():boolean;
var
Lsql69,Lsql204:string;
Lcds69,Lcds204:TClientDataSet;
begin
 if_finished:=false;
 Lsql69:='select * from data0069 where purch_req_ptr='+cdsmain.FieldByName('rkey').AsString;
 Lsql204:='select * from data0204 where purchase_req_ptr='+cdsmain.FieldByName('rkey').AsString;
 Lcds69:=TClientDataSet.Create(nil);
 Lcds204:=TClientDataSet.Create(nil);
 try
 if cdsMain.FieldByName('flag').Value='S' then
  begin
   gSvrIntf.IntfGetDataBySql(Lsql69,Lcds69);
   while not Lcds69.Eof do
    begin
     if (Lcds69.FieldByName('supp_ptr').AsVariant=null) or (Lcds69.FieldByName('reply_date').AsVariant=null) then
      break
     else
      if Lcds69.RecNo=Lcds69.RecordCount then
       if_finished:=true;
     Lcds69.Next;
    end;
   Lcds69.First;
  end
 else
  begin
   gSvrIntf.IntfGetDataBySql(Lsql204,Lcds204);
   while not Lcds204.Eof do
    begin
     if (Lcds204.FieldByName('SUPPLIER_PTR').AsVariant=null) or (Lcds204.FieldByName('reply_date').AsVariant=null) then
      break
     else
      if Lcds204.RecNo=Lcds204.RecordCount then
       if_finished:=true;
     Lcds204.Next;
    end;
   Lcds204.First;
  end;
 finally
  Lcds69.Free;
  Lcds204.Free;
 end;
end;

procedure TfrmMain_Mod280.cdsMainAfterScroll(DataSet: TDataSet);
var lsql:string;
begin
  inherited;
  if DataSet.FieldByName('FLAG').AsString='S' then
  begin
    dbg69.Visible:=True;
    dbg204.Visible:=false;
    lsql:='select data0069.RKEY, data0069.REQ_DATE,data0069.QUANTITY,data0069.UNIT_PRICE,data0069.tax_price,data0069.UNIT_PTR,data0069.reply_date,data0069.reason,data0069.extra_req,'
         +' data0069.INVT_PTR,data0017.inv_part_number,data0017.inv_description,data0017.inv_name ,case data0069.IF_urgency when 0 then ''否'' when 1 then ''是'' end IF_urgencys,data0069.req_quantity,'
         +' data0002.unit_code,data0002.unit_name,data0002_1.unit_code unit_code_1,data0017.CRITICAL_MATL_FLAG,data0069.IF_urgency,Data0023.code'
         +' from dbo.Data0069 INNER JOIN'
         +' dbo.Data0017 ON dbo.Data0069.INVT_PTR = dbo.Data0017.RKEY INNER JOIN'
         +' dbo.Data0002 AS data0002_1 ON dbo.Data0069.req_unit_ptr = data0002_1.RKEY LEFT OUTER JOIN'
         +' dbo.Data0002 ON dbo.Data0069.UNIT_PTR = dbo.Data0002.RKEY Left outer join'
         +' dbo.Data0023 ON dbo.Data0069.SUPP_PTR = dbo.Data0023.rkey'
         +' where data0069 .purch_req_ptr='+ IntToStr(Dataset.FieldByName('RKEY').AsInteger);
  end
  else
  begin
    dbg204.Visible:=True;
    dbg69.Visible:=false;
    lsql:='select data0204.RKEY,data0204.PURCHASE_REQ_PTR,data0204.DESCRIPTION_1,data0204.GUI_GE,data0204.DESCRIPTION_2,data0204.QUANTITY_REQUIRED,'
          +'data0204.UNIT_PRICE,data0204.TAX_FLAG,data0204.REQ_DATE,data0204.o_i_flag,data0204.reply_date,data0204.reason,'
          +'data0204.tax,data0204.tax_price,data0204.rohs,data0204.status,case data0204.IF_urgency when 0 then ''否'' when 1 then ''是'' end IF_urgencys,'
          +'data0204.IF_urgency,data0204.req_quantity,D68_IDKey,data0002.unit_code,data0002.unit_name,data0023.code'
          +' from data0204'
          +' inner join data0002 on data0204.G_L_PTR=data0002.rkey'
          +' left outer join data0023 on data0204.SUPPLIER_PTR=data0023.rkey'
          +' where data0204 .purchase_req_ptr='+ IntToStr(Dataset.FieldByName('RKEY').AsInteger);
  end;
  gSvrintf.IntfGetDataBySql(lsql,cdsDetail);
end;

procedure TfrmMain_Mod280.cmbFacChange(Sender: TObject);
begin
  inherited;
 GetData;
end;

procedure TfrmMain_Mod280.dbg69DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if cdsDetail.FieldByName('CRITICAL_MATL_FLAG').Value=1 then
  dbg69.Canvas.Font.Color := clRed;//红色代表重要物料标识

  dbg69.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmMain_Mod280.ehMainDblClick(Sender: TObject);
begin
  inherited;
  if cdsMain.FieldByName('status').Value = 4 then
  begin
          ShowMessage('请购单会签未通过！' + #13 +
                    '原因如下：' + #13+
                    cdsMain.FieldByName('remark').AsString );
  end
  else if cdsMain.FieldByName('status').Value = 3 then mniEditClick(nil);

end;

procedure TfrmMain_Mod280.ehMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if (cdsMain.FieldByName('status').Value = 4) and (cdsMain.FieldByName('data275_ptr').Value <> null) then
     ehMain.Canvas.Font.Color := clred
  else
  if cdsMain.FieldByName('status').Value= 7 then
     ehMain.Canvas.Font.Color := clBlue
  else
  if cdsMain.FieldByName('status').Value = 4 then
     ehMain.Canvas.Font.Color := clfuchsia;
  ehMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmMain_Mod280.FormCreate(Sender: TObject);
var
Lcds15:TClientDataSet;
begin
  inherited;
 if FModID=28 then
 begin
  ehMain.PopupMenu:=pmApprove;
  dbg69.PopupMenu:=pmDelApp;
  dbg204.PopupMenu:=pmDelApp;
  Panel2.Visible:=False;
  rgStatus.Visible:=True;
 end;
 if FModID=27 then
 begin
  ehMain.PopupMenu:=pmAward;
  dbg69.PopupMenu:=pm69;
  dbg204.PopupMenu:=pm204;
  lblFac.Visible:=True;
  cmbFac.Visible:=True;
  cbx1.Checked:=false;
  cbx2.Checked:=false;
  cbx3.Checked:=True;
  cbx4.Checked:=True;
  dbg69.Columns[5].Visible:=True;//供应商代码
  dbg204.Columns[5].Visible:=True;
  dbg69.Columns[9].Visible:=True;//价格
  dbg204.Columns[9].Visible:=True;
  Lcds15:=TClientDataSet.Create(nil);
  try
   gSvrIntf.IntfGetDataBySql('select rkey,abbr_name from data0015',Lcds15);
   while not Lcds15.Eof do
   begin
    cmbFac.Items.Append(Lcds15.Fields[1].asstring);
    Lcds15.Next;
   end;
  finally
   Lcds15.Free;
  end;
 end;
end;

procedure TfrmMain_Mod280.btnQryClick(Sender: TObject);
begin
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'data0068.REQ_DATE';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString :=DateToStr(gFunc.GetSvrDateTime-29)+' AND '+DateToStr(gFunc.GetSvrDateTime+1);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '0';
    cdsMainWhereInit.Post;
  end;
  inherited;
end;

procedure TfrmMain_Mod280.btnQryZtClick(Sender: TObject);
var
Lsql:string;
begin
  inherited;
  try
  frmMaterZt_Mod280:=tfrmMaterZt_Mod280.create(nil);
  Lsql:='SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0023.ABBR_NAME, dbo.Data0071.QUAN_ORD,  '+
        ' dbo.Data0071.QUAN_RECD, dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD AS zaitu, dbo.Data0002.UNIT_NAME, dbo.Data0071.tax_price,  '+
        ' dbo.Data0071.TAX_2, dbo.Data0071.REQ_DATE, dbo.Data0070.PO_NUMBER, '+
        ' ISNULL(dbo.Data0005.EMPLOYEE_NAME, dbo.Data0070.ANALYSIS_CODE_1)  AS ANALYSIS_CODE_1,  '+
        ' ISNULL(Data0034_1.DEPT_NAME, dbo.Data0034.DEPT_NAME) AS dept_name,   '+
        ' ISNULL(dbo.Data0068.PO_REQ_NUMBER, dbo.Data0070.FOB) AS PO_REQ_NUMBER, dbo.Data0071.reason, dbo.Data0071.rohs,  '+
        ' dbo.Data0015.ABBR_NAME AS ComNm, Data0005_1.EMPLOYEE_NAME, dbo.Data0017.QUAN_ON_HAND  '+
        ' FROM dbo.Data0034 RIGHT OUTER JOIN dbo.Data0071 INNER JOIN '+
        ' dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY INNER JOIN '+
        ' dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER JOIN '+
        ' dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN '+
        ' dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.RKEY INNER JOIN '+
        ' dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POINTER = dbo.Data0015.RKEY INNER JOIN '+
        ' dbo.Data0005 AS Data0005_1 ON dbo.Data0070.EMPLOYEE_POINTER = Data0005_1.RKEY ON '+
        ' dbo.Data0034.DEPT_CODE = dbo.Data0070.PO_REV_NO FULL OUTER JOIN '+
        ' dbo.Data0068 LEFT OUTER JOIN '+
        ' dbo.Data0034 AS Data0034_1 ON dbo.Data0068.DEPARTMENT_NAME = Data0034_1.DEPT_CODE LEFT OUTER JOIN '+
        ' dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY FULL OUTER JOIN '+
        ' dbo.Data0069 ON dbo.Data0068.RKEY = dbo.Data0069.PURCH_REQ_PTR ON dbo.Data0071.rkey69 = dbo.Data0069.RKEY '+
        ' WHERE (dbo.Data0070.STATUS = 5) AND (dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD > 0) ' ;
   gSvrIntf.IntfGetDataBySql(lsql,frmMaterZt_Mod280.cdsMain);
   frmMaterZt_Mod280.cdsMain.CommandText:=Lsql;
   frmMaterZt_Mod280.showmodal;
  finally
   frmMaterZt_Mod280.free;
  end;
end;

procedure TfrmMain_Mod280.btnRefreshClick(Sender: TObject);
  var
  i:integer;
begin
  //inherited;
  if cdsMain.IsEmpty then exit;
  i := cdsMain.FieldByName('rkey').AsInteger ;
  GetData;
  cdsMain.Locate('rkey',i,[]);
end;

procedure TfrmMain_Mod280.cbx1Click(Sender: TObject);
begin
  inherited;
  GetData;
end;

function TfrmMain_Mod280.GetAddWhere1: string;
begin
 if (FModID=280) or (FModID=27) then
  begin
  Result := ' AND data0068.status IN (0';
  if cbx1.Checked then
  begin
    Result := Result + ',7';
  end;
  if cbx2.Checked then
  begin
    Result := Result + ',1';
  end;
  if cbx3.Checked then
  begin
    Result := Result + ',3';
  end;
  if cbx4.Checked then
  begin
    Result := Result + ',2';
  end;
  if cbx5.Checked then
  begin
    Result := Result + ',4';
  end;
  if cbx6.Checked then
  begin
    Result := Result + ',5';
  end;
  if cbx7.Checked then
  begin
    Result := Result + ',6';
  end;
  Result := Result + ')';
  end;
  if FModID=28 then
  begin
   if rgStatus.ItemIndex=0 then
     Result:=' and data0276.auth_flag=''Y'''
   else
     Result:='';
  end;
  if FModID=27 then
  begin
   if cmbfac.ItemIndex=0 then
   Result:=Result+''
   else
   Result:=Result+' and data0015.abbr_name='''+Cmbfac.Text+''''
  end;
end;

procedure TfrmMain_Mod280.getdata;
var
Lcds34:TClientDataSet;
Lsql34:string;
begin
  if FModID=280 then
  begin
    Lcds34:=TClientDataSet.Create(nil);
    try
    Lsql34:='select Data0034.DEPT_CODE from data0005'+
    ' inner join Data0034 on Data0005.EMPLOYEE_ID=Data0034.RKEY'+
    ' where Data0005.rkey='+gvar.rkey05;
    gSvrIntf.IntfGetDataBySql(Lsql34,Lcds34);
       cdsMain.CommandText:='SELECT data0068.*,'+
       ' data0005.empl_code,data0005.employee_name,'+
       ' data0015.abbr_name,data0015.warehouse_code,'+
       ' data0094.code code94,data0094.PURCHASE_APPROV_DESC ,'+
       ' data0362.code code362,data0362.DESCRIPTION,'+
       ' CASE data0068.FLAG WHEN ''S'' THEN  ''标准'' WHEN ''M'' THEN  ''杂项''  END v_flag,'+
       ' CASE data0068.status WHEN 1 THEN  ''待审批'' WHEN 2 THEN  ''待采购'''+
       ' WHEN 3 THEN  ''已批准'' WHEN 4 THEN  ''被退回'' WHEN 5 THEN  ''请购单已撤消'''+
       ' WHEN 6 THEN  ''请购单已处理'' WHEN 7 THEN  ''未提交'' END v_status'+
       ' from data0068'+
       ' inner join  data0005 on data0068.req_by=data0005.rkey'+
       ' inner join data0015 on data0068.WHSE_PTR=data0015.rkey'+
       ' inner join data0094 on data0068.auth_type=data0094.rkey'+
       ' inner join data0362 on data0068.budget_ptr=data0362.rkey'+
       ' where data0068.department_name=' + QuotedStr(Lcds34.FieldByName('dept_code').AsString);
    finally
     Lcds34.Free;
    end;
  end
  else
  if FModID=28 then
  begin
       cdsMain.CommandText:='SELECT data0068.*,'+
       ' data0005.empl_code,data0005.employee_name,'+
       ' data0015.abbr_name,data0015.warehouse_code,'+
       ' data0094.code code94,data0094.PURCHASE_APPROV_DESC ,'+
       ' data0362.code code362,data0362.DESCRIPTION,'+
       ' data0276.auth_date authdate276,data0276.ranking,data0276.user_ptr authUser_ptr,'+
       ' dbo.data0276.auth_flag,data0276.rkey rkey276,Data0073.USER_FULL_NAME,'+
       ' CASE data0068.FLAG WHEN ''S'' THEN  ''标准'' WHEN ''M'' THEN  ''杂项''  END v_flag,'+
       ' CASE data0068.status WHEN 1 THEN  ''待审批'' WHEN 2 THEN  ''待采购'''+
       ' WHEN 3 THEN  ''已批准'' WHEN 4 THEN  ''被退回'' WHEN 5 THEN  ''请购单已撤消'''+
       ' WHEN 6 THEN  ''请购单已处理'' WHEN 7 THEN  ''未提交'' END v_status'+
       ' from data0068'+
       ' inner join  data0005 on data0068.req_by=data0005.rkey'+
       ' inner join data0015 on data0068.WHSE_PTR=data0015.rkey'+
       ' inner join data0094 on data0068.auth_type=data0094.rkey'+
       ' inner join data0362 on data0068.budget_ptr=data0362.rkey'+
       ' inner join data0276 ON Data0068.RKEY = dbo.data0276.purchase_ptr'+
       ' inner join data0073 ON data0276.user_ptr = dbo.Data0073.RKEY'+
       ' where (Data0068.STATUS in (1,3)) and (data0073.rpl_pr_ptr ='+gvar.rkey73+')';
  end
  else
  if FModID=27 then
  begin
       cdsMain.CommandText:='SELECT data0068.*,'+
       ' data0005.empl_code,data0005.employee_name,'+
       ' data0015.abbr_name,data0015.warehouse_code,'+
       ' data0094.code code94,data0094.PURCHASE_APPROV_DESC ,'+
       ' data0362.code code362,data0362.DESCRIPTION,'+
       ' CASE data0068.FLAG WHEN ''S'' THEN  ''标准'' WHEN ''M'' THEN  ''杂项''  END v_flag,'+
       ' CASE data0068.status WHEN 1 THEN  ''待审批'' WHEN 2 THEN  ''待采购'''+
       ' WHEN 3 THEN  ''已批准'' WHEN 4 THEN  ''被退回'' WHEN 5 THEN  ''请购单已撤消'''+
       ' WHEN 6 THEN  ''请购单已处理'' WHEN 7 THEN  ''未提交'' END v_status'+
       ' from data0068'+
       ' inner join  data0005 on data0068.req_by=data0005.rkey'+
       ' inner join data0015 on data0068.WHSE_PTR=data0015.rkey'+
       ' inner join data0094 on data0068.auth_type=data0094.rkey'+
       ' inner join data0362 on data0068.budget_ptr=data0362.rkey'+
       ' where (1=1)';
  end;
  FMainFrmSql := cdsMain.CommandText;

  if Trim(FMainWhere)= '' then
  FMainWhere := ' AND data0068.REQ_DATE BETWEEN ' + QuotedStr(DateToStr(gFunc.GetSvrDateTime-29)) + ' AND ' + QuotedStr(DateToStr(gFunc.GetSvrDateTime+1));
  FWhere2 := GetAddWhere1;

  FOrderby := ' order by data0068.rkey desc ';
  inherited;
end;

procedure TfrmMain_Mod280.mniAwdCopyClick(Sender: TObject);
var
LCds69,LCds204: TClientDataSet;
LSql69,LSqlLK17,LSql204:string;
begin
  inherited;
  if not gFunc.CheckUserAuth(1,FModID) then Exit;
  if frmEdit_mod280 = nil then
  begin
    frmEdit_mod280 := TfrmEdit_mod280.Create(Self);
    frmEdit_mod280.FAfterAppend := OnAfterAdd;
    frmEdit_mod280.FEditType:=3;
    frmEdit_mod280.Init(cdsmain.FieldByName('Flag').AsString,FModID);
  end;
  frmEdit_mod280.DtpReqDate.DateTime:=cdsMain.FieldByName('REQ_DATE').AsDateTime;
  frmEdit_mod280.GetData('0',cdsMain.FieldByName('FLAG').AsString);
  frmEdit_mod280.cds68.Append;
  frmEdit_mod280.cds68.FieldByName('whse_ptr').Value:=cdsMain.FieldByName('whse_ptr').Value;
  frmEdit_mod280.cds68.FieldByName('budget_ptr').Value:=cdsMain.FieldByName('budget_ptr').Value;
  frmEdit_mod280.cds68.FieldByName('auth_type').Value:=cdsMain.FieldByName('auth_type').Value;
  frmEdit_mod280.cds68.FieldByName('user_name').Value:=cdsMain.FieldByName('user_name').Value;
  frmEdit_mod280.cds68.FieldByName('user_phone').Value:=cdsMain.FieldByName('user_phone').Value;
  frmEdit_mod280.cds68.FieldByName('DEPARTMENT_NAME').Value:=cdsMain.FieldByName('DEPARTMENT_NAME').Value;
  frmEdit_mod280.cds68.FieldByName('flag').Value:=cdsMain.FieldByName('flag').Value;
  frmEdit_mod280.Append68(cdsMain.FieldByName('FLAG').AsString,FModID);
  if frmEdit_mod280.eh69.Visible then
  begin
    LCds69 := TClientDataSet.Create(nil);
    try
    LSql69:='select * from data0069 where PURCH_REQ_PTR='+cdsmain.FieldByName('rkey').AsString;
    LSqlLK17 := 'select d17.rkey,d17.INV_PART_NUMBER ,d17.inv_name,d17.INV_DESCRIPTION from Data0069 d69 ' +
              ' inner join data0017 d17 on d69.INVT_PTR = d17.RKEY ' +
              ' where d69.PURCH_REQ_PTR = '+cdsmain.FieldByName('rkey').AsString;
    gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql69,LSqlLK17]),[LCds69,frmEdit_mod280.cdsLookUp17]);
     LCds69.First;
     while not LCds69.Eof do
     begin
      frmEdit_mod280.cds69.Append;
      frmEdit_mod280.cds69.FieldByName('D68_IDKey').Value:=frmEdit_mod280.cds68.FieldByName('IDKey').Value;
      frmEdit_mod280.cds69.FieldByName('INVT_PTR').Value:=Lcds69.FieldByName('INVT_PTR').Value;
      frmEdit_mod280.cds69.FieldByName('QUANTITY').Value:=Lcds69.FieldByName('QUANTITY').Value;
      frmEdit_mod280.cds69.FieldByName('UNIT_PRICE').Value:=Lcds69.FieldByName('UNIT_PRICE').Value;
      frmEdit_mod280.cds69.FieldByName('UNIT_PTR').Value:=Lcds69.FieldByName('UNIT_PTR').Value;
      frmEdit_mod280.cds69.FieldByName('CONVERSION_FACTOR').Value:=Lcds69.FieldByName('CONVERSION_FACTOR').Value;
      frmEdit_mod280.cds69.FieldByName('reason').Value:=Lcds69.FieldByName('reason').Value;
      frmEdit_mod280.cds69.FieldByName('extra_req').Value:=Lcds69.FieldByName('extra_req').Value;
      frmEdit_mod280.cds69.FieldByName('avl_flag').Value:=Lcds69.FieldByName('avl_flag').Value;
      frmEdit_mod280.cds69.FieldByName('tax').Value:=Lcds69.FieldByName('tax').Value;
      frmEdit_mod280.cds69.FieldByName('tax_price').Value:=Lcds69.FieldByName('tax_price').Value;
      frmEdit_mod280.cds69.FieldByName('rohs').Value:=Lcds69.FieldByName('rohs').Value;
      frmEdit_mod280.cds69.FieldByName('req_unit_ptr').Value:=Lcds69.FieldByName('req_unit_ptr').Value;
      frmEdit_mod280.cds69.FieldByName('IF_CAF').Value:=Lcds69.FieldByName('IF_CAF').Value;
      frmEdit_mod280.cds69.FieldByName('IF_urgency').Value:=Lcds69.FieldByName('IF_urgency').Value;
      frmEdit_mod280.cds69.FieldByName('IF_CAF').Value:=Lcds69.FieldByName('IF_CAF').Value;
      frmEdit_mod280.cds69.FieldByName('req_quantity').Value:=Lcds69.FieldByName('req_quantity').Value;
      frmEdit_mod280.cds69.FieldByName('REQ_DATE').Value:=gFunc.GetSvrDateTime;
      frmEdit_mod280.cds69.FieldByName('PO_LINK_PTR').Value:=Lcds69.FieldByName('PO_LINK_PTR').Value;
      frmEdit_mod280.cds69.FieldByName('SUPP_PTR').Value:=Lcds69.FieldByName('SUPP_PTR').Value;
      frmEdit_mod280.cds69.FieldByName('status').Value:=0;
      frmEdit_mod280.cds69.Post;
      LCds69.Next;
     end;
    finally
    LCds69.Free;
    end;
  end
  else
  begin
    LCds204 := TClientDataSet.Create(nil);
    try
    LSql204:='select * from data0204 where PURCHASE_REQ_PTR='+cdsmain.FieldByName('rkey').AsString;
     gSvrIntf.IntfGetDataBySql(LSql204,LCds204);
     LCds204.First;
     while not LCds204.Eof do
     begin
      frmEdit_mod280.cds204.Append;
      frmEdit_mod280.cds204.FieldByName('D68_IDKey').Value:=frmEdit_mod280.cds68.FieldByName('IDKey').Value;
      frmEdit_mod280.cds204.FieldByName('DESCRIPTION_1').Value:=LCds204.FieldByName('DESCRIPTION_1').Value;
      frmEdit_mod280.cds204.FieldByName('GUI_GE').Value:=LCds204.FieldByName('GUI_GE').Value;
      frmEdit_mod280.cds204.FieldByName('DESCRIPTION_2').Value:=LCds204.FieldByName('DESCRIPTION_2').Value;
      frmEdit_mod280.cds204.FieldByName('G_L_PTR').Value:=LCds204.FieldByName('G_L_PTR').Value;
      frmEdit_mod280.cds204.FieldByName('QUANTITY_REQUIRED').Value:=LCds204.FieldByName('QUANTITY_REQUIRED').Value;
      frmEdit_mod280.cds204.FieldByName('reason').Value:=LCds204.FieldByName('reason').Value;
      frmEdit_mod280.cds204.FieldByName('UNIT_PRICE').Value:=LCds204.FieldByName('UNIT_PRICE').Value;
      frmEdit_mod280.cds204.FieldByName('TAX_FLAG').Value:=LCds204.FieldByName('TAX_FLAG').Value;
      frmEdit_mod280.cds204.FieldByName('tax').Value:=LCds204.FieldByName('tax').Value;
      frmEdit_mod280.cds204.FieldByName('tax_price').Value:=LCds204.FieldByName('tax_price').Value;
      frmEdit_mod280.cds204.FieldByName('reason').Value:=LCds204.FieldByName('reason').Value;
      frmEdit_mod280.cds204.FieldByName('rohs').Value:=LCds204.FieldByName('rohs').Value;
      frmEdit_mod280.cds204.FieldByName('IF_urgency').Value:=LCds204.FieldByName('IF_urgency').Value;
      frmEdit_mod280.cds204.FieldByName('req_quantity').Value:=LCds204.FieldByName('req_quantity').Value;
      frmEdit_mod280.cds204.FieldByName('REQ_DATE').Value:=gFunc.GetSvrDateTime;
      frmEdit_mod280.cds204.FieldByName('PO_LINK_PTR').Value:=LCds204.FieldByName('PO_LINK_PTR').Value;
      frmEdit_mod280.cds204.FieldByName('SUPPLIER_PTR').Value:=LCds204.FieldByName('SUPPLIER_PTR').Value;
      frmEdit_mod280.cds204.FieldByName('status').Value:=0;
      frmEdit_mod280.cds204.Post;
      LCds204.Next;
     end;
    finally
    LCds204.Free;
    end;
  end;
  frmEdit_mod280.Show;
end;

procedure TfrmMain_Mod280.mniAwdEditClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(2,FModID) then Exit;
  if frmEdit_mod280 = nil then
  begin
    frmEdit_mod280 := TfrmEdit_mod280.Create(Self);
    frmEdit_mod280.FAfterAppend := OnAfterAdd;
    frmEdit_mod280.FEditType:=1;
    frmEdit_mod280.FsModid:=FModID;
    frmEdit_mod280.RedtFactory.Enabled:=False;
    frmEdit_mod280.BtnBudDet.Enabled:=True;
    frmEdit_mod280.Init(cdsmain.FieldByName('Flag').AsString,FModID);
    frmEdit_mod280.mniDelAwd.Caption:='单项退回';
  end;
  frmEdit_mod280.DtpReqDate.DateTime:=cdsMain.FieldByName('REQ_DATE').AsDateTime;
  frmEdit_mod280.GetData(cdsMain.FieldByName('rkey').AsString,cdsMain.FieldByName('FLAG').AsString);
  frmEdit_mod280.Show;
end;

procedure TfrmMain_Mod280.mniAwdScClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,FModID) then Exit;
  if frmEdit_mod280 = nil then
  begin
    frmEdit_mod280 := TfrmEdit_mod280.Create(Self);
    frmEdit_mod280.FAfterAppend := OnAfterAdd;
    frmEdit_mod280.dtpReqDate.DateTime:=dateof(gFunc.GetSvrDateTime);
    frmEdit_mod280.FEditType:=0;
    frmEdit_mod280.FsModid:=FModID;
    frmEdit_mod280.Init('S',FModID);
  end;
  frmEdit_mod280.GetData('0','S');
  frmEdit_mod280.Append68('S',FModID);
  frmEdit_mod280.eh69.Columns[5].Visible:=True;
  frmEdit_mod280.eh69.PopupMenu:=frmEdit_mod280.pmAwd69;
  frmEdit_mod280.Show;
end;

procedure TfrmMain_Mod280.mniView204Click(Sender: TObject);
var
  LFrmZx: TfrmEditDetailZx_Mod27;
begin
  inherited;
  LFrmZx := TfrmEditDetailZx_Mod27.Create(Self);
   try
    LFrmZx.getdataZx(cdsDetail.FieldByName('rkey').AsString);
    LFrmZx.cds204.ReadOnly := True;
    LFrmZx.RedtSupp.Enabled:=False;
    LFrmZx.dbcbbDESCRIPTION_2.Enabled:=False;
    LFrmZx.btnSave.Enabled:=False;
    if LFrmZx.ShowModal = mrOk then
    begin

    end;
   finally
    LFrmZx.Free;
   end;
end;


procedure TfrmMain_Mod280.mniView69Click(Sender: TObject);
var
  LFrm: TfrmEditDetail_Mod27;
  Lcds17,Lcds15:TClientDataSet;
  Lsql17,Lsql15:string;
begin
  inherited;
   LFrm := TfrmEditDetail_Mod27.Create(Self);
   Lcds17:=TClientDataSet.Create(nil);
   Lcds15:=TClientDataSet.Create(nil);
   try
    LFrm.GetData(cdsDetail.FieldByName('rkey').AsString);
    Lsql15:='SELECT warehouse_name from data0015'+
            ' where rkey='+cdsmain.FieldByName('WHSE_PTR').AsString;
    gSvrIntf.IntfGetDataBySql(Lsql15,Lcds15);
    LFrm.RedtNeedFac.Text:=Lcds15.FieldByName('warehouse_name').AsString;
    Lsql17:='select case d17.CRITICAL_MATL_FLAG when 0 then ''否'' when 1 then ''是'' end as CRITICAL_MATL'+
           '  from data0017 d17 where rkey='+cdsDetail.FieldByName('INVT_PTR').AsString;
    gSvrIntf.IntfGetDataBySql(Lsql17,Lcds17);
    LFrm.RedtIfMajor.Text:=Lcds17.FieldByName('CRITICAL_MATL').AsString;

    LFrm.RedtMaterCode.Enabled:=False;
    LFrm.RedtSupp.Enabled:=False;
    LFrm.btnSave.Enabled := False;
    LFrm.cds69.ReadOnly := True;
    if LFrm.ShowModal = mrOk then
    begin

    end;
   finally
    LFrm.Free;
    Lcds17.Free;
    Lcds15.Free;
   end;
end;


procedure TfrmMain_Mod280.mniViewClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(3,FModID) then Exit;
  if frmEdit_mod280 = nil then
  begin
    frmEdit_mod280 := TfrmEdit_mod280.Create(Self);
    frmEdit_mod280.FEditType:=2;
    frmEdit_mod280.Init(cdsMain.FieldByName('FLAG').AsString,FModID);
  end;
  frmEdit_mod280.GetData(cdsMain.FieldByName('rkey').AsString,cdsMain.FieldByName('FLAG').AsString);
  frmEdit_mod280.DtpReqDate.DateTime:=cdsMain.FieldByName('REQ_DATE').AsDateTime;
  frmEdit_mod280.DtpReqDate.Enabled:=False;
  frmEdit_mod280.cds68.ReadOnly := True;
  frmEdit_mod280.cds69.ReadOnly := True;
  frmEdit_mod280.cds69.ReadOnly := true;
  frmEdit_mod280.btnSave.Enabled := False;
  frmEdit_mod280.RedtFactory.Enabled:=False;
  frmEdit_mod280.RedtBudtCode.Enabled:=False;
  frmEdit_mod280.RedtAppCode.Enabled:=False;
  frmEdit_mod280.RedtUser.Enabled:=False;
  frmEdit_mod280.Show;
end;

procedure TfrmMain_Mod280.OnAfterAdd;
begin
  btnRefreshClick(btnRefresh);
end;

procedure TfrmMain_Mod280.mniAwdZxClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,FModID) then Exit;
  if frmEdit_mod280 = nil then
  begin
    frmEdit_mod280 := TfrmEdit_mod280.Create(Self);
    frmEdit_mod280.FAfterAppend := OnAfterAdd;
    frmEdit_mod280.dtpReqDate.DateTime:=dateof(gFunc.GetSvrDateTime);
    frmEdit_mod280.FEditType:=0;
    frmEdit_mod280.FsModid:=FModID;
    frmEdit_mod280.Init('M',FModID);
  end;
  frmEdit_mod280.GetData('0','M');
  frmEdit_mod280.Append68('M',FModID);
  frmEdit_mod280.eh204.Columns[5].Visible:=True;
  frmEdit_mod280.eh204.Columns[7].Visible:=True;
  frmEdit_mod280.eh204.PopupMenu:=frmEdit_mod280.pmAwd69;
  frmEdit_mod280.Show;
end;

procedure TfrmMain_Mod280.pmApprovePopup(Sender: TObject);
begin
  inherited;
  if cdsMain.IsEmpty then
   begin
    mniApprove.Enabled := false;   //批准
    mniCancel.Enabled := false;   //取消审批
    mniReturn.Enabled := false;   //退回请购者
    mniExamView.Enabled := false;   //检查/审批
    mniAuthInfo.Enabled := false;   //审批信息
   end
  else
   begin
    mniApprove.Enabled :=cdsMain.FieldByName('auth_flag').Value='Y';
    mniCancel.Enabled :=(cdsMain.FieldByName('authdate276').AsVariant <> null) and (cdsMain.FieldByName('status').Value=1);
    mniReturn.Enabled :=cdsMain.FieldByName('status').Value=1;
    mniExamView.Enabled:=true;
    mniAuthInfo.Enabled :=true;
   end;
end;

procedure TfrmMain_Mod280.pmAwardPopup(Sender: TObject);
begin
  inherited;
 if cdsMain.IsEmpty then
  begin
   mniAwdEdit.Enabled:=false;//编辑
   mniAwdView.Enabled:=false;//检查
   mniAwdCopy.Enabled:=false;//复制
   mniAwdSub.Enabled:=false;//提交采购
   mniAwdAuth.Enabled:=false;//审批信息
   mniAwdSh.Enabled:=false;//收货信息
   mniAwdRej.Enabled:=false;//退回请购者
   mniAwdExp.Enabled:=false;//导出采购项目
  end
 else
 begin
   mniAwdEdit.Enabled := False;//编辑
   mniAwdView.Enabled:=True;//检查
   mniAwdCopy.Enabled:=True;//复制
   mniAwdAuth.Enabled:=True;//审批信息
   mniAwdSh.Enabled:=True;//收货信息
   mniAwdExp.Enabled:=True;//导出采购项目
   mniAwdSub.Enabled:=false;//提交采购
   mniAwdRej.Enabled:=false;//退回请购者
   case cdsMain.FieldByName('status').Value of
    1://待审批
     begin

     end;
    2://待采购
    begin
     mniAwdEdit.Enabled := true;//编辑
    end;
    3://已批准
     begin
      mniAwdEdit.Enabled := true;//编辑
      mniAwdSub.Enabled:=true;//提交采购
      mniAwdRej.Enabled:=true;//退回请购者
     end;
    5,6,7 ://请购单已撤消,请购单已处理,未提交
     begin

     end;
    4://被退回
     begin

     end;
   end;
 end;
end;

procedure TfrmMain_Mod280.pmDelAppPopup(Sender: TObject);
begin
  inherited;
  mniHisPrice.Enabled:=not cdsMain.IsEmpty;
  mniSuppliers.Enabled:=not cdsMain.IsEmpty and (cdsMain.FieldByName('flag').Value='S');
end;

procedure TfrmMain_Mod280.pmMainPopup(Sender: TObject);
begin
  inherited;
  if cdsMain.IsEmpty then
  begin
    mniNew.Enabled:=true; //新增
    mniEdit.Enabled:=false;    //编辑
    mniView.Enabled:=false;    //检查
    mniCopy.Enabled:=false;    //复制
    mniDele.Enabled:=false;    //删除
    mniSubmit.Enabled:=false;    //提交审批
    mniAppView.Enabled:=false;    //审批信息
    mniRecView.Enabled:=false;   //收货信息
    mniExpPur.Enabled:=false;   //导出请购项目
    mniReason.Enabled:=False;   //退回理由
    mniprint.Enabled:=false;   //打印请购单
  end
  else
  begin
    mniNew.Enabled:=true; //新增
    mniEdit.Enabled:=cdsMain.FieldByName('status').AsInteger in [7,4];//编辑
    mniView.Enabled := true; //检查
    mniCopy.Enabled := true; //复制
    mniDele.Enabled:=cdsMain.FieldByName('status').AsInteger in [7,4,5]; //删除
    mniSubmit.Enabled:=cdsMain.FieldByName('status').AsInteger=7; //提交审批
    mniAppView.Enabled := true; //审批信息
    mniRecView.Enabled := true; //收货信息
    mniExpPur.Enabled := true;  //导出请购项目
    mniReason.Enabled:=cdsMain.FieldByName('status').AsInteger=4; //退回理由
    mniprint.Enabled:= True;//打印请购单
  end;
end;

procedure TfrmMain_Mod280.rgStatusClick(Sender: TObject);
begin
  inherited;
  GetData;
end;

procedure TfrmMain_Mod280.mniNewSCClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,FModID) then Exit;
  if frmEdit_mod280 = nil then
  begin
    frmEdit_mod280 := TfrmEdit_mod280.Create(Self);
    frmEdit_mod280.FAfterAppend := OnAfterAdd;
    frmEdit_mod280.dtpReqDate.DateTime:=dateof(gFunc.GetSvrDateTime);
    frmEdit_mod280.FEditType:=0;
    frmEdit_mod280.FsModid:=FModID;
    frmEdit_mod280.Init('S',FModID);
  end;
  frmEdit_mod280.GetData('0','S');
  frmEdit_mod280.Append68('S',FModID);
  frmEdit_mod280.Show;
end;

procedure TfrmMain_Mod280.mniNewZYClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,FModID) then Exit;
  if frmEdit_mod280 = nil then
  begin
    frmEdit_mod280 := TfrmEdit_mod280.Create(Self);
    frmEdit_mod280.FAfterAppend := OnAfterAdd;
    frmEdit_mod280.dtpReqDate.DateTime:=dateof(gFunc.GetSvrDateTime);
    frmEdit_mod280.FEditType:=0;
    frmEdit_mod280.FsModid:=FModID;
    frmEdit_mod280.Init('M',FModID);
  end;
  frmEdit_mod280.GetData('0','M');
  frmEdit_mod280.Append68('M',FModID);
  frmEdit_mod280.Show;
end;

procedure TfrmMain_Mod280.mniReasonClick(Sender: TObject);
var
Lcds05:TClientDataSet;
begin
  inherited;
  Lcds05:=TClientDataSet.Create(nil);
  try
  if not gFunc.CheckUserAuth(3,FModID) then Exit;
  if cdsMain.fieldbyname('data275_ptr').AsVariant<>null then
   begin
   gSvrIntf.IntfGetDataBySql('select employee_name from data0005 where rkey='+cdsMain.fieldbyname('data275_ptr').AsString,Lcds05);
         showmessage('该请购单在采购环节被员工:'+trim(Lcds05.FieldByName('employee_name').AsString)+'于'+#13+
                     cdsMain.FieldByName('auth_date').AsString+'日退回,退回原因如下:'+#13+
                     cdsMain.FieldByName('remark').AsString);
   end
   else
   showmessage('该请购单会签未通过原因如下：'+#13+cdsMain.FieldByName('remark').AsString);
  finally
   Lcds05.Free;
  end;
end;

procedure TfrmMain_Mod280.mniRecViewClick(Sender: TObject);
var
Lsql71,Lsql72:string;
begin
  inherited;
 if not gFunc.CheckUserAuth(3,FModID) then Exit;
 try
  FrmRecInf_Mod280:=TFrmRecInf_Mod280.Create(nil);
  if cdsMain.FieldByName('flag').Value='S' then //生产物料
  begin
  frmRecInf_Mod280.ds71.DataSet:=frmRecInf_Mod280.cds71;
  frmRecInf_Mod280.ds22.DataSet:=frmRecInf_Mod280.cds22;
  lsql71:='SELECT Data0070.PO_NUMBER, dbo.Data0017.INV_PART_NUMBER,'+
       ' Data0017.INV_PART_DESCRIPTION, dbo.Data0071.QUAN_ORD,'+
       ' Data0071.QUAN_RECD,data0071.rkey'+
       ' FROM Data0070 INNER JOIN '+
       ' Data0071 ON dbo.Data0070.RKEY = dbo.Data0071.PO_PTR INNER JOIN'+
       ' Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.RKEY'+
       ' where data0071.quan_recd>0 and'+
       ' data0070.fob='+quotedstr(cdsMain.FieldByName('po_req_number').AsString);
  gSvrIntf.IntfGetDataBySql(lsql71,FrmRecInf_Mod280.cds71);
  if not frmRecInf_Mod280.cds71.IsEmpty then
  frmRecInf_Mod280.ShowModal
  else
  messagedlg('对不起该请购单还没有收货记录!',mtinformation,[mbok],0);
  end
  else
  begin
  frmRecInf_Mod280.ds71.DataSet:=frmRecInf_Mod280.cds72;
  frmRecInf_Mod280.ds22.DataSet:=frmRecInf_Mod280.cds235;
  lsql72:='SELECT Data0070.PO_NUMBER, dbo.Data0072.DESCRIPTION,'+
       ' Data0072.GUI_GE, dbo.Data0072.QUAN_ORD,'+
       ' Data0072.QUANTITY_RECEIVED,data0072.rkey'+
       ' FROM Data0070 INNER JOIN'+
       ' Data0072 ON dbo.Data0070.RKEY = dbo.Data0072.POPTR'+
       ' where data0072.QUANTITY_RECEIVED>0 and'+
       ' data0070.fob='+quotedstr(cdsMain.FieldByName('po_req_number').AsString);
  gSvrIntf.IntfGetDataBySql(lsql72,FrmRecInf_Mod280.cds72);
  if not frmRecInf_Mod280.cds72.IsEmpty then
  frmRecInf_Mod280.ShowModal
  else
  messagedlg('对不起该请购单还没有收货记录!',mtinformation,[mbok],0);
  end;
 finally
  FrmRecInf_Mod280.Free;
 end;
end;

procedure TfrmMain_Mod280.mniAwdRejClick(Sender: TObject);
begin
 if not gFunc.CheckUserAuth(5,FModID) then Exit;
 frmRemark_Mod280:=TfrmRemark_Mod280.Create(Application);
 try
  frmRemark_Mod280.mmoRemark.Text:=cdsmain.FieldByName('remark').AsString;
  frmRemark_Mod280.Caption := '退回请购原因';

  if frmRemark_Mod280.ShowModal=mrok then
  begin
   gSvrIntf.IntfGetDataBySql('select * from data0068 where rkey='+cdsmain.FieldByName('rkey').AsString,cds68);
   if trim(frmRemark_Mod280.mmoRemark.Text) <> '' then
    begin
     cds68.Edit;
     cds68.FieldByName('status').Value:=4;
     cds68.FieldByName('data275_ptr').AsString:=gVar.rkey05;
     cds68.FieldByName('auth_date').value:=gFunc.GetSvrDateTime;
     cds68.FieldByName('remark').AsString:=frmRemark_Mod280.mmoRemark.Text;
     cds68.Post;
     if gSvrIntf.IntfPostDataByTable('data0068',cds68.Delta) then
     begin
     if cds68.ChangeCount>0 then cds68.MergeChangeLog;
     ShowMessage('退回请购单成功');
     btnRefreshClick(Sender);
     end;
    end
   else
    messagedlg('因为退回原因为空，导致退回请购者操作不成功!',mtinformation,[mbok],0);
  end;
 finally
  frmRemark_Mod280.Free;
 end;
end;

procedure TfrmMain_Mod280.mniReturnClick(Sender: TObject);
var
Lcdstmp:TClientDataSet;
Lsqltmp:string;
begin
  inherited;
  if not gFunc.CheckUserAuth(3,FModID) then Exit;
  if ehMain.SelectedRows.Count>1 then
   showmessage('对不起,退回不能一次退多条记录...')
  else
  begin
   Lcdstmp:=TClientDataSet.Create(nil);
   try
    if cdsMain.FieldByName('auth_flag').Value='N' then //如果当前操作者已审核
    begin
     Lsqltmp:= 'select rkey from data0276 where purchase_ptr='+cdsmain.FieldByName('rkey').AsString+
             ' and auth_flag=''N'' and  ranking>'+cdsmain.FieldByName('ranking').AsString+' and auth_date is not null';
     gSvrIntf.IntfGetDataBySql(Lsqltmp,Lcdstmp);
     if not Lcdstmp.IsEmpty then
     begin
     showmessage('此单的下一用户已经审核通过,您不能再退回请购单!');
     btnRefreshClick(nil);
     exit;
     end;
    end;
   finally
    Lcdstmp.Free;
   end;
    with TfrmRemark_Mod280.Create(nil) do
     try
      mmoRemark.Text:=cdsMain.FieldByName('remark').AsString;
      if showmodal=mrok then
       begin
        gSvrIntf.IntfGetDataBySql('select * from data0068 where rkey='+cdsmain.FieldByName('rkey').AsString,cds68);
        if cds68.FieldByName('status').Value<>1  then
        begin
         showmessage('请购单状态发生改变而未能成功退回!');
         btnRefreshClick(nil);
        exit;
        end;
        gSvrIntf.IntfGetDataBySql('select * from data0068 where rkey='+cdsmain.FieldByName('rkey').AsString,cds68);
        if Trim(mmoRemark.Text)<>'' then
        begin
         cds68.Edit;
         cds68.FieldByName('status').Value:=4;
         cds68.FieldByName('remark').AsString:=mmoRemark.Text;
         cds68.Post;
         if gSvrIntf.IntfPostDataByTable('data0068',cds68.Delta) then
         begin
          if cds68.ChangeCount>0 then cds68.MergeChangeLog;
          ShowMessage('退回请购单成功');
          btnRefreshClick(Sender);
         end;
        end;
       end;
     finally
      free;
     end;
  end;
end;

procedure TfrmMain_Mod280.mniSubmitClick(Sender: TObject);
var
  Lsql68,Lsql14,Lsql275,Lsql276,Lsql314,Lsql276_2:string;
  Lcds275,Lcds276,Lcds14,Lcds314,Lcds276_2:TClientDataSet;
  If_Inf:Boolean;
  iRank:Integer;
  LPostData: OleVariant;
begin
  inherited;
  if not gFunc.CheckUserAuth(1,FModID) then Exit;
  Lcds275:=TClientDataSet.Create(nil);
  Lcds276:=TClientDataSet.Create(nil);
  Lcds14:=TClientDataSet.Create(nil);
  Lcds314:=TClientDataSet.Create(nil);
  Lcds276_2:=TClientDataSet.Create(nil);
  try
    Lsql276_2 := 'select * from data0276 where purchase_ptr='+cdsmain.FieldByName('rkey').AsString;
    gSvrIntf.IntfGetDataBySql(Lsql276_2,Lcds276_2);
    if not Lcds276_2.IsEmpty then
     begin
       while not Lcds276_2.eof do Lcds276_2.Delete;
     end;
    Lsql68:='select * from data0068 where rkey='+cdsmain.FieldByName('rkey').AsString;
    gSvrIntf.IntfGetDataBySql(Lsql68,cds68);
    if cds68.FieldByName('status').Value<>7 then
    begin
     ShowMessage('请购单状态已发生变化!提交不成功!');
     Exit;
    end;
    cds68.Edit;
    cds68.FieldByName('status').Value:=1;
    cds68.FieldByName('ENT_DATE').Value:=dateof(gFunc.GetSvrDateTime);
    cds68.Post;
    If_Inf:=messagedlg('是否短信通知审批人员?',mtconfirmation,[mbYes,mbNo],0)=mrYes;
   if If_Inf then
   begin
    Lsql14:='select * from data0014 where rkey is null';
    gSvrIntf.IntfGetDataBySql(Lsql14,Lcds14);
    Lcds14.Append;
    Lcds14.FieldByName('MESSAGE').Value:='有一张请购单需要通过您的审批,请购人员:'+
                                       cdsMain.FieldByName('employee_name').AsString+'请购编号:'+
                                       cdsMain.FieldByName('po_req_number').AsString;
    Lcds14.FieldByName('whosend').Value:= gVar.rkey73;
    Lcds14.FieldByName('IDkey').Value := gFunc.CreateIDKey;
    Lcds14.Post;

    Lsql314:='select * from data0314 where D14_ptr=0';
    gSvrIntf.IntfGetDataBySql(Lsql314,Lcds314);
   end;
    Lsql275:='select * from data0275 where AUTH_GROUP_PTR='+cdsmain.FieldByName('AUTH_TYPE').AsString+' order by rkey';
    gSvrIntf.IntfGetDataBySql(Lsql275,Lcds275);
    iRank:=1;
   Lsql276:='select * from data0276 where rkey is null';
   gSvrIntf.IntfGetDataBySql(Lsql276,Lcds276);
   Lcds275.First;
   while not Lcds275.Eof do
   begin
     if iRank=1 then
     begin
      Lcds276.Append;
      Lcds276.FieldByName('purchase_ptr').Value:=cdsMain.FieldByName('rkey').Value;
      Lcds276.FieldByName('user_ptr').Value:=Lcds275.FieldByName('user_ptr').Value;
      Lcds276.FieldByName('ranking').Value:=iRank;
      Lcds276.FieldByName('auth_flag').Value:='Y';
      Lcds276.Post;
     end
     else
     begin
      Lcds276.Append;
      Lcds276.FieldByName('purchase_ptr').Value:=cdsMain.FieldByName('rkey').Value;
      Lcds276.FieldByName('user_ptr').Value:=Lcds275.FieldByName('user_ptr').Value;
      Lcds276.FieldByName('ranking').Value:=iRank;
      Lcds276.FieldByName('auth_flag').Value:='N';
      Lcds276.Post;
     end;
     inc(iRank);
     if If_Inf then
     begin
      Lcds314.Append;
      Lcds314.FieldByName('D14_IDKey').AsString :=Lcds14.FieldByName('IDKEY').AsString;
      Lcds314.FieldByName('emp_ptr').Value:=Lcds275.FieldByName('user_ptr').Value;
      Lcds314.Post;
     end;
     Lcds275.Next;
   end;
  if cds68.State in [dsEdit,dsInsert] then cds68.Post;
  if Lcds14.State in [dsEdit,dsInsert] then Lcds14.Post;
  if Lcds314.State in [dsEdit,dsInsert] then Lcds314.Post;
  if Lcds275.State in [dsEdit,dsInsert] then Lcds275.Post;
  if Lcds276_2.State in [dsEdit,dsInsert] then Lcds276_2.Post;
  if Lcds276.State in [dsEdit,dsInsert] then Lcds276.Post;

  LPostData := VarArrayCreate([0,5],varVariant);
  if Lcds276_2.ChangeCount > 0 then
    LPostData[0] := Lcds276_2.Delta;
  if cds68.ChangeCount > 0 then
    LPostData[1] := cds68.Delta;
  if Lcds14.ChangeCount > 0 then
    LPostData[2] := Lcds14.Delta;
  if Lcds314.ChangeCount > 0 then
    LPostData[3] := Lcds314.Delta;
  if Lcds275.ChangeCount > 0 then
    LPostData[4] := Lcds275.Delta;
  if Lcds276.ChangeCount > 0 then
    LPostData[5] := Lcds276.Delta;


  if gSvrIntf.IntfPostModData('公共基础',280,LPostData,1) then
  begin
    if cds68.ChangeCount>0 then cds68.MergeChangeLog;
    if Lcds14.ChangeCount>0 then Lcds14.MergeChangeLog;
    if Lcds314.ChangeCount>0 then Lcds314.MergeChangeLog;
    if Lcds275.ChangeCount>0 then Lcds275.MergeChangeLog;
    if Lcds276_2.ChangeCount>0 then Lcds276_2.MergeChangeLog;
    if Lcds276.ChangeCount>0 then Lcds276.MergeChangeLog;
    ShowMessage('提交请购单成功');
    btnRefreshClick(Sender);
  end;
  finally
   Lcds275.free;
   Lcds276.free;
   Lcds14.free;
   Lcds314.free;
   Lcds276_2.Free;
  end;
end;

procedure TfrmMain_Mod280.mniSuppliersClick(Sender: TObject);
var
Lsql:string;
begin
  inherited;
  Lsql:='select data0023.abbr_name,case data0023.status when 0 then ''有效'' when 1 then ''无效'' end as supper_statu,'+
       ' data0028.SUPPLIER_PART_NO,data0028.avl_flag,data0028.TDATE'+
       ' from data0028 inner join'+
       ' data0017 on data0028.inventory_ptr=data0017.rkey inner join'+
       ' data0023 on data0028.supplier_ptr=data0023.rkey'+
       ' where data0028.inventory_ptr='+cdsdetail.FieldByName('INVT_PTR').AsString+' order by ABBR_NAME';
  try
   frmQrySupp_Mod280:=TfrmQrySupp_Mod280.Create(nil);
   gSvrIntf.IntfGetDataBySql(Lsql,frmQrySupp_Mod280.cdsMain);
   frmQrySupp_Mod280.ShowModal;
  finally
   frmQrySupp_Mod280.Free;
  end;
end;

procedure TfrmMain_Mod280.mniAwdSubClick(Sender: TObject);
var
Lcds68:TClientDataSet;
begin
  inherited;
  if not gFunc.CheckUserAuth(4,FModID) then Exit;
  Lcds68:=TClientDataSet.Create(nil);
  try
   if if_finished=true then
   begin
    gSvrIntf.IntfGetDataBySql('select * from data0068 where rkey='+cdsmain.FieldByName('rkey').AsString,Lcds68);
    Lcds68.Edit;
    Lcds68.FieldByName('status').Value:=2;//状态变成提待采购
    Lcds68.FieldByName('data275_ptr').Value := StrToInt(gVar.rkey05); //提交采购人员 0005.rkey
    Lcds68.FieldByName('auth_date').Value := gFunc.GetSvrDateTime;//提交采购日期
    Lcds68.Post;
    if gSvrIntf.IntfPostDataByTable('data0068',Lcds68.Delta) then
    begin
     Lcds68.MergeChangeLog;
    ShowMessage('提交采购成功!');
    btnRefreshClick(Sender);
    end;
   end
   else
  messagedlg('请购项目没有授理结束,请确定其供应商,和回复交期',mtinformation,[mbok],0);
  finally
   Lcds68.Free;
  end;
end;

procedure TfrmMain_Mod280.mniAwdViewClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(3,FModID) then Exit;
  if frmEdit_mod280 = nil then
  begin
    frmEdit_mod280 := TfrmEdit_mod280.Create(Self);
    frmEdit_mod280.FEditType:=2;
    frmEdit_mod280.Init(cdsMain.FieldByName('FLAG').AsString,FModID);
  end;
  frmEdit_mod280.GetData(cdsMain.FieldByName('rkey').AsString,cdsMain.FieldByName('FLAG').AsString);
  frmEdit_mod280.DtpReqDate.DateTime:=cdsMain.FieldByName('REQ_DATE').AsDateTime;
  frmEdit_mod280.DtpReqDate.Enabled:=False;
  frmEdit_mod280.cds68.ReadOnly := True;
  frmEdit_mod280.cds69.ReadOnly := True;
  frmEdit_mod280.cds69.ReadOnly := true;
  frmEdit_mod280.btnSave.Enabled := False;
  frmEdit_mod280.RedtFactory.Enabled:=False;
  frmEdit_mod280.RedtBudtCode.Enabled:=False;
  frmEdit_mod280.RedtAppCode.Enabled:=False;
  frmEdit_mod280.RedtUser.Enabled:=False;
  frmEdit_mod280.Show;

end;

procedure TfrmMain_Mod280.mniApproveClick(Sender: TObject);
var
LPostData: OleVariant;
Lcds68,Lcds276,Lcds276_2:TClientDataSet;
Lsql68,Lsql276,Lsql276_2:string;
begin
 inherited;
 if not gFunc.CheckUserAuth(1,FModID) then Exit;
 if ehMain.SelectedRows.Count>1 then
 begin
  ShowMessage('对不起,取消审批不能一次取消多条记录,只能单条记录取消');
  Exit;
 end;
 if cdsMain.FieldByName('auth_flag').Value='Y' then
 begin
   Lsql68:='select * from data0068 where rkey='+cdsmain.FieldByName('rkey').AsString;
   Lsql276:='select * from data0276 where rkey='+cdsmain.FieldByName('rkey276').AsString;
   Lsql276_2:='select * from data0276 where rkey=('+
   ' select top 1 rkey from data0276 where purchase_ptr='+cdsmain.FieldByName('rkey').AsString+
   ' and ranking>'+cdsmain.FieldByName('ranking').AsString+' order by ranking asc)';
   Lcds68:=TClientDataSet.Create(nil);
   Lcds276:=TClientDataSet.Create(nil);
   Lcds276_2:=TClientDataSet.Create(nil);
  try
   gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql68,Lsql276,Lsql276_2]),[Lcds68,Lcds276,Lcds276_2]);
   Lcds276.Edit;
   Lcds276.FieldByName('auth_flag').Value:='N';
   Lcds276.FieldByName('auth_date').Value:=gFunc.GetSvrDateTime;
   Lcds276.Post;
   if not Lcds276_2.IsEmpty then //如果当前不是最后一个人审核
   begin
    Lcds68.Edit;
    Lcds68.FieldByName('edited_date').Value:=gFunc.GetSvrDateTime;
    Lcds68.Post;
    Lcds276_2.Edit;
    Lcds276_2.FieldByName('auth_flag').Value:='Y';
    Lcds276_2.FieldByName('auth_date').Value:=null;
    Lcds276_2.Post;
   end
   else  //当前已是最后一个人审核
   begin
    Lcds68.Edit;
    Lcds68.FieldByName('edited_date').Value:=gFunc.GetSvrDateTime;
    Lcds68.FieldByName('status').Value:=3;
    Lcds68.Post;
   end;
   if Lcds68.State in [dsEdit,dsInsert] then Lcds68.Post;
   if Lcds276.State in [dsEdit,dsInsert] then Lcds276.Post;
   if Lcds276_2.State in [dsEdit,dsInsert] then Lcds276_2.Post;
   LPostData := VarArrayCreate([0,2],varVariant);
   if Lcds68.ChangeCount > 0 then
    LPostData[0] := Lcds68.Delta;
   if Lcds276.ChangeCount > 0 then
    LPostData[1] := Lcds276.Delta;
   if Lcds276_2.ChangeCount > 0 then
    LPostData[2] := Lcds276_2.Delta;
   if gSvrIntf.IntfPostModData('公共基础',28,LPostData,0) then
   begin
    if Lcds68.ChangeCount>0 then Lcds68.MergeChangeLog;
    if Lcds276.ChangeCount>0 then Lcds276.MergeChangeLog;
    if Lcds276_2.ChangeCount > 0 then Lcds276_2.MergeChangeLog;
    ShowMessage('审批成功');
    btnRefreshClick(Sender);
   end;
  finally
  Lcds68.Free;
  Lcds276.Free;
  Lcds276_2.Free;
  end;
 end;
end;

procedure TfrmMain_Mod280.mniAppViewClick(Sender: TObject);
var lsql05,lsql73:string;
begin
 inherited;
 if not gFunc.CheckUserAuth(3,FModID) then Exit;
 try
  FrmAuthInfo_Mod280:=TFrmAuthInfo_Mod280.Create(nil);
  FrmAuthInfo_Mod280.RkyTjsprq.Text:=cdsMain.FieldByName('ent_date').AsString;
  FrmAuthInfo_Mod280.RkyZhsprq.Text:=cdsMain.FieldByName('edited_date').AsString;
  FrmAuthInfo_Mod280.RkyTjcgrq.Text:=cdsMain.FieldByName('auth_date').AsString;
  lsql73:='SELECT Data0073.user_login_name USER_ID,Data0073.USER_FULL_NAME,data0276.user_ptr,'+
         'data0276.auth_date,data0276.ranking,data0276.auth_flag FROM dbo.Data0073 INNER JOIN dbo.data0276 '+
         'ON dbo.Data0073.RKEY = dbo.data0276.user_ptr '+
         'WHERE dbo.data0276.purchase_ptr='+cdsmain.FieldByName('rkey').AsString+
         ' order by ranking';
  if not gSvrIntf.IntfGetDataBySql(lsql73,FrmAuthInfo_Mod280.cds276) then Exit;
  if cdsMain.FieldByName('DATA275_ptr').AsString<>'' then
  begin
    Lsql05:='select employee_name from data0005 where rkey='+cdsMain.FieldByName('DATA275_ptr').AsString;
    if gSvrIntf.IntfGetDataBySql(lsql05,FrmAuthInfo_Mod280.cds05) then
    begin
     FrmAuthInfo_Mod280.RkyTjcgry.Text:=FrmAuthInfo_Mod280.cds05.FieldByName('employee_name').AsString;
    end;
  end;
  FrmAuthInfo_Mod280.ShowModal;
 finally
  FrmAuthInfo_Mod280.Free;
 end;
end;

procedure TfrmMain_Mod280.mniAuthInfoClick(Sender: TObject);
var
Lsql05,Lsql73:string;
begin
  inherited;
 if not gFunc.CheckUserAuth(4,FModID) then Exit;
 try
  FrmAuthInfo_Mod280:=TFrmAuthInfo_Mod280.Create(nil);
  FrmAuthInfo_Mod280.RkyTjsprq.Text:=cdsMain.FieldByName('ent_date').AsString;
  FrmAuthInfo_Mod280.RkyZhsprq.Text:=cdsMain.FieldByName('edited_date').AsString;
  FrmAuthInfo_Mod280.RkyTjcgrq.Text:=cdsMain.FieldByName('auth_date').AsString;
  lsql73:='SELECT Data0073.user_login_name USER_ID,Data0073.USER_FULL_NAME,data0276.user_ptr,'+
         'data0276.auth_date,data0276.ranking,data0276.auth_flag FROM dbo.Data0073 INNER JOIN dbo.data0276 '+
         'ON dbo.Data0073.RKEY = dbo.data0276.user_ptr '+
         'WHERE dbo.data0276.purchase_ptr='+cdsmain.FieldByName('rkey').AsString+
         ' order by ranking';
  if not gSvrIntf.IntfGetDataBySql(lsql73,FrmAuthInfo_Mod280.cds276) then Exit;
  if cdsMain.FieldByName('DATA275_ptr').AsString<>'' then
  begin
    Lsql05:='select employee_name from data0005 where rkey='+cdsMain.FieldByName('DATA275_ptr').AsString;
    if gSvrIntf.IntfGetDataBySql(Lsql05,FrmAuthInfo_Mod280.cds05) then
    begin
     FrmAuthInfo_Mod280.RkyTjcgry.Text:=FrmAuthInfo_Mod280.cds05.FieldByName('employee_name').AsString;
    end;
  end;
  FrmAuthInfo_Mod280.ShowModal;
 finally
  FrmAuthInfo_Mod280.Free;
 end;
end;

procedure TfrmMain_Mod280.mniCancelClick(Sender: TObject);
var
Lcdstmp,Lcds276,Lcds276_2:TClientDataSet;
Lsqltmp,lsql276,lsql276_2:string;
LPostData: OleVariant;
begin
  inherited;
  if not gFunc.CheckUserAuth(2,FModID) then Exit;
  if ehMain.SelectedRows.Count>1 then
  begin
    ShowMessage('对不起,取消审批不能一次取消多条记录,只能单条记录取消');
    Exit;
  end;
  Lcdstmp:=TClientDataSet.Create(nil);
  Lcds276:=TClientDataSet.Create(nil);
  Lcds276_2:=TClientDataSet.Create(nil);
  try
   Lsqltmp:= 'select rkey from data0276 where purchase_ptr='+cdsmain.FieldByName('rkey').AsString+
             ' and auth_flag=''N'' and  ranking>'+cdsmain.FieldByName('ranking').AsString+ ' and auth_date is not null';
   gSvrIntf.IntfGetDataBySql(Lsqltmp,Lcdstmp);
   if not Lcdstmp.IsEmpty then
   begin
    showmessage('此单的下一用户已经审核通过,您不能再取消审核!');
    btnRefreshClick(nil);
    exit;
   end;
   gSvrIntf.IntfGetDataBySql('select * from data0068 where rkey='+cdsmain.FieldByName('rkey').AsString,cds68);
   if cds68.FieldByName('status').Value<>1  then
   begin
    showmessage('请购单状态发生改变而未能成功取消!');
    btnRefreshClick(nil);
    exit;
   end;
   Lsql276:='select * from data0276 where purchase_ptr='+cdsmain.FieldByName('rkey').AsString+
            ' and rkey<>('+
            ' select top 1 rkey from data0276 where purchase_ptr='+cdsmain.FieldByName('rkey').AsString+
            ' order by ranking asc)';
   gSvrIntf.IntfGetDataBySql(lsql276,Lcds276);
   Lcds276.Edit;
   Lcds276.FieldByName('auth_flag').Value:='N';
   Lcds276.FieldByName('auth_date').AsVariant:=null;
   Lcds276.Post;
   Lsql276_2:='select * from data0276 where rkey=('+
              ' select top 1 rkey from data0276 where purchase_ptr='+cdsmain.FieldByName('rkey').AsString+
              ' order by ranking asc)';
   gSvrIntf.IntfGetDataBySql(lsql276_2,Lcds276_2);
   Lcds276_2.Edit;
   Lcds276_2.FieldByName('auth_flag').Value:='Y';
   Lcds276_2.FieldByName('auth_date').AsVariant:=null;
   Lcds276_2.Post;
   if Lcds276.State in [dsEdit,dsInsert] then Lcds276.Post;
   if Lcds276_2.State in [dsEdit,dsInsert] then Lcds276_2.Post;
   LPostData := VarArrayCreate([0,1],varVariant);
   if Lcds276.ChangeCount > 0 then
    LPostData[0] := Lcds276.Delta;
   if Lcds276_2.ChangeCount > 0 then
    LPostData[1] := Lcds276_2.Delta;
   if gSvrIntf.IntfPostModData('公共基础',28,LPostData,1) then
   begin
    if Lcds276.ChangeCount > 0 then Lcds276.MergeChangeLog;
    if Lcds276_2.ChangeCount > 0 then Lcds276_2.MergeChangeLog;
    ShowMessage('取消审批成功');
    btnRefreshClick(Sender);
   end;
  finally
   Lcdstmp.Free;
   Lcds276.Free;
   Lcds276_2.Free;
  end;
end;

procedure TfrmMain_Mod280.mniCopyClick(Sender: TObject);
var
LCds69,LCds204: TClientDataSet;
LSql69,LSqlLK17,LSql204:string;
begin
  inherited;
  if frmEdit_mod280 = nil then
  begin
    frmEdit_mod280 := TfrmEdit_mod280.Create(Self);
    frmEdit_mod280.FAfterAppend := OnAfterAdd;
    frmEdit_mod280.FEditType:=3;
    frmEdit_mod280.Init(cdsmain.FieldByName('Flag').AsString,FModID);
  end;
  frmEdit_mod280.DtpReqDate.DateTime:=cdsMain.FieldByName('REQ_DATE').AsDateTime;
  frmEdit_mod280.GetData('0',cdsMain.FieldByName('FLAG').AsString);
  frmEdit_mod280.cds68.Append;
  frmEdit_mod280.cds68.FieldByName('whse_ptr').Value:=cdsMain.FieldByName('whse_ptr').Value;
  frmEdit_mod280.cds68.FieldByName('budget_ptr').Value:=cdsMain.FieldByName('budget_ptr').Value;
  frmEdit_mod280.cds68.FieldByName('auth_type').Value:=cdsMain.FieldByName('auth_type').Value;
  frmEdit_mod280.cds68.FieldByName('user_name').Value:=cdsMain.FieldByName('user_name').Value;
  frmEdit_mod280.cds68.FieldByName('user_phone').Value:=cdsMain.FieldByName('user_phone').Value;
  frmEdit_mod280.cds68.FieldByName('DEPARTMENT_NAME').Value:=cdsMain.FieldByName('DEPARTMENT_NAME').Value;
  frmEdit_mod280.cds68.FieldByName('flag').Value:=cdsMain.FieldByName('flag').Value;
  frmEdit_mod280.Append68(cdsMain.FieldByName('FLAG').AsString,FModID);
  if frmEdit_mod280.eh69.Visible then
  begin
    LCds69 := TClientDataSet.Create(nil);
    try
    LSql69:='select * from data0069 where PURCH_REQ_PTR='+cdsmain.FieldByName('rkey').AsString;
    LSqlLK17 := 'select d17.rkey,d17.INV_PART_NUMBER ,d17.inv_name,d17.INV_DESCRIPTION from Data0069 d69 ' +
              ' inner join data0017 d17 on d69.INVT_PTR = d17.RKEY ' +
              ' where d69.PURCH_REQ_PTR = '+cdsmain.FieldByName('rkey').AsString;
    gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql69,LSqlLK17]),[LCds69,frmEdit_mod280.cdsLookUp17]);
     LCds69.First;
     while not LCds69.Eof do
     begin
      frmEdit_mod280.cds69.Append;
      frmEdit_mod280.cds69.FieldByName('D68_IDKey').Value:=frmEdit_mod280.cds68.FieldByName('IDKey').Value;
      frmEdit_mod280.cds69.FieldByName('INVT_PTR').Value:=Lcds69.FieldByName('INVT_PTR').Value;
      frmEdit_mod280.cds69.FieldByName('QUANTITY').Value:=Lcds69.FieldByName('QUANTITY').Value;
      frmEdit_mod280.cds69.FieldByName('UNIT_PRICE').Value:=Lcds69.FieldByName('UNIT_PRICE').Value;
      frmEdit_mod280.cds69.FieldByName('UNIT_PTR').Value:=Lcds69.FieldByName('UNIT_PTR').Value;
      frmEdit_mod280.cds69.FieldByName('CONVERSION_FACTOR').Value:=Lcds69.FieldByName('CONVERSION_FACTOR').Value;
      frmEdit_mod280.cds69.FieldByName('reason').Value:=Lcds69.FieldByName('reason').Value;
      frmEdit_mod280.cds69.FieldByName('extra_req').Value:=Lcds69.FieldByName('extra_req').Value;
      frmEdit_mod280.cds69.FieldByName('avl_flag').Value:=Lcds69.FieldByName('avl_flag').Value;
      frmEdit_mod280.cds69.FieldByName('tax').Value:=Lcds69.FieldByName('tax').Value;
      frmEdit_mod280.cds69.FieldByName('tax_price').Value:=Lcds69.FieldByName('tax_price').Value;
      frmEdit_mod280.cds69.FieldByName('rohs').Value:=Lcds69.FieldByName('rohs').Value;
      frmEdit_mod280.cds69.FieldByName('req_unit_ptr').Value:=Lcds69.FieldByName('req_unit_ptr').Value;
      frmEdit_mod280.cds69.FieldByName('IF_CAF').Value:=Lcds69.FieldByName('IF_CAF').Value;
      frmEdit_mod280.cds69.FieldByName('IF_urgency').Value:=Lcds69.FieldByName('IF_urgency').Value;
      frmEdit_mod280.cds69.FieldByName('IF_CAF').Value:=Lcds69.FieldByName('IF_CAF').Value;
      frmEdit_mod280.cds69.FieldByName('req_quantity').Value:=Lcds69.FieldByName('req_quantity').Value;
      frmEdit_mod280.cds69.FieldByName('REQ_DATE').Value:=gFunc.GetSvrDateTime;
      frmEdit_mod280.cds69.FieldByName('status').Value:=0;
      frmEdit_mod280.cds69.Post;
      LCds69.Next;
     end;
    finally
    LCds69.Free;
    end;
  end
  else
  begin
    LCds204 := TClientDataSet.Create(nil);
    try
    LSql204:='select * from data0204 where PURCHASE_REQ_PTR='+cdsmain.FieldByName('rkey').AsString;
     gSvrIntf.IntfGetDataBySql(LSql204,LCds204);
     LCds204.First;
     while not LCds204.Eof do
     begin
      frmEdit_mod280.cds204.Append;
      frmEdit_mod280.cds204.FieldByName('D68_IDKey').Value:=frmEdit_mod280.cds68.FieldByName('IDKey').Value;
      frmEdit_mod280.cds204.FieldByName('DESCRIPTION_1').Value:=LCds204.FieldByName('DESCRIPTION_1').Value;
      frmEdit_mod280.cds204.FieldByName('GUI_GE').Value:=LCds204.FieldByName('GUI_GE').Value;
      frmEdit_mod280.cds204.FieldByName('DESCRIPTION_2').Value:=LCds204.FieldByName('DESCRIPTION_2').Value;
      frmEdit_mod280.cds204.FieldByName('G_L_PTR').Value:=LCds204.FieldByName('G_L_PTR').Value;
      frmEdit_mod280.cds204.FieldByName('QUANTITY_REQUIRED').Value:=LCds204.FieldByName('QUANTITY_REQUIRED').Value;
      frmEdit_mod280.cds204.FieldByName('reason').Value:=LCds204.FieldByName('reason').Value;
      frmEdit_mod280.cds204.FieldByName('UNIT_PRICE').Value:=LCds204.FieldByName('UNIT_PRICE').Value;
      frmEdit_mod280.cds204.FieldByName('TAX_FLAG').Value:=LCds204.FieldByName('TAX_FLAG').Value;
      frmEdit_mod280.cds204.FieldByName('tax').Value:=LCds204.FieldByName('tax').Value;
      frmEdit_mod280.cds204.FieldByName('tax_price').Value:=LCds204.FieldByName('tax_price').Value;
      frmEdit_mod280.cds204.FieldByName('reason').Value:=LCds204.FieldByName('reason').Value;
      frmEdit_mod280.cds204.FieldByName('rohs').Value:=LCds204.FieldByName('rohs').Value;
      frmEdit_mod280.cds204.FieldByName('IF_urgency').Value:=LCds204.FieldByName('IF_urgency').Value;
      frmEdit_mod280.cds204.FieldByName('req_quantity').Value:=LCds204.FieldByName('req_quantity').Value;
      frmEdit_mod280.cds204.FieldByName('REQ_DATE').Value:=gFunc.GetSvrDateTime;
      frmEdit_mod280.cds204.FieldByName('status').Value:=0;
      frmEdit_mod280.cds204.Post;
      LCds204.Next;
     end;
    finally
    LCds204.Free;
    end;
  end;
  frmEdit_mod280.Show;
end;

procedure TfrmMain_Mod280.mniDeleClick(Sender: TObject);
var
  Lsql:string;
begin
  inherited;
  if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
  Lsql:='select * from data0068 where status in (7,4,5) and rkey= '+cdsMain.FieldByName('rkey').AsString;
  gSvrIntf.IntfGetDataBySql(lsql,cds68);
  cds68.Delete;
  if gSvrIntf.IntfPostDataByTable('data0068',cds68.Delta) then
  begin
    cds68.MergeChangeLog;
    cdsMain.Delete;
    ShowMessage('删除记录成功');
    //btnRefreshClick(Sender);
  end;
  end;
end;

procedure TfrmMain_Mod280.mniEditClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(2,FModID) then Exit;
  if frmEdit_mod280 = nil then
  begin
    frmEdit_mod280 := TfrmEdit_mod280.Create(Self);
    frmEdit_mod280.FAfterAppend := OnAfterAdd;
    frmEdit_mod280.FEditType:=1;
    frmEdit_mod280.FsModid:=FModID;
    frmEdit_mod280.RedtFactory.Enabled:=False;
    frmEdit_mod280.Init(cdsmain.FieldByName('Flag').AsString,FModID);
  end;
  frmEdit_mod280.DtpReqDate.DateTime:=cdsMain.FieldByName('REQ_DATE').AsDateTime;
  frmEdit_mod280.GetData(cdsMain.FieldByName('rkey').AsString,cdsMain.FieldByName('FLAG').AsString);
  frmEdit_mod280.Show;
end;

procedure TfrmMain_Mod280.mniExamViewClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(4,FModID) then Exit;
  if frmEdit_mod280 = nil then
  begin
    frmEdit_mod280 := TfrmEdit_mod280.Create(Self);
    frmEdit_mod280.FEditType:=2;
    frmEdit_mod280.Init(cdsMain.FieldByName('FLAG').AsString,FModID);
  end;
  frmEdit_mod280.GetData(cdsMain.FieldByName('rkey').AsString,cdsMain.FieldByName('FLAG').AsString);
  frmEdit_mod280.DtpReqDate.DateTime:=cdsMain.FieldByName('REQ_DATE').AsDateTime;
  frmEdit_mod280.DtpReqDate.Enabled:=False;
  frmEdit_mod280.cds68.ReadOnly := True;
  frmEdit_mod280.cds69.ReadOnly := True;
  frmEdit_mod280.cds69.ReadOnly := true;
  frmEdit_mod280.btnSave.Enabled := False;
  frmEdit_mod280.RedtFactory.Enabled:=False;
  frmEdit_mod280.RedtBudtCode.Enabled:=False;
  frmEdit_mod280.RedtAppCode.Enabled:=False;
  frmEdit_mod280.RedtUser.Enabled:=False;
  frmEdit_mod280.BtnApp.Visible:=True;
  frmEdit_mod280.BtnRet.Visible:=True;
  frmEdit_mod280.BtnApp.Enabled:=mniApprove.Enabled;
  frmEdit_mod280.BtnRet.Enabled:=mniReturn.Enabled;
  frmEdit_mod280.Show;
end;

procedure TfrmMain_Mod280.mniExpPurClick(Sender: TObject);
var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TMemo;
   ExcelApp: Variant;
   Lcds11:TClientDataSet;
begin
  if not gFunc.CheckUserAuth(3,FModID) then Exit;
  Lcds11:=TClientDataSet.Create(nil);
  try
  if (cdsMain.FieldByName('Flag').Value = 'S')  then
  begin
    Screen.Cursor := crHourglass;
    dbg69.DataSource.DataSet.DisableControls;
    bm := dbg69.DataSource.DataSet.GetBookmark;
    dbg69.DataSource.DataSet.First;

    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.WorkBooks.Add;
    ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    mem := TMemo.Create(Self);
    mem.Visible := false;
    mem.Parent := self;
    mem.Clear;
    sline := '';

    for col := 0 to ehMain.FieldCount-1 do
      sline := sline + ehMain.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);

    sline := '';
    for col := 0 to ehMain.FieldCount-1 do
      sline := sline + ehMain.Fields[col].AsString + #9;
    mem.Lines.Add(sline);            //导出请购编号

    mem.Lines.Add('');//增加一行空行

    sline := '';
    for col := 0 to dbg69.FieldCount-1 do
     sline := sline + dbg69.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);

    for row := 0 to dbg69.DataSource.DataSet.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to dbg69.FieldCount-1 do
        sline := sline + dbg69.Fields[col].AsString + #9;
      mem.Lines.Add(sline);
      dbg69.DataSource.DataSet.Next;
    end;

    mem.Lines.Add('');//增加一行空行
    mem.Lines.Add('备注');//增加一行空行
    sline := '';
    gSvrIntf.IntfGetDataBySql('select * from data0011 where source_type=68 and file_pointer='+cdsmain.FieldByName('rkey').AsString,Lcds11);//查找记事本
    if not Lcds11.isempty then
    for col := 1 to 4 do
    mem.Lines.Add(Lcds11.Fieldbyname('NOTE_PAD_LINE_'+inttostr(col)).AsString);

    mem.SelectAll;
    mem.CopyToClipboard;

    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    FreeAndNil(mem);

    dbg69.DataSource.DataSet.GotoBookmark(bm);
    dbg69.DataSource.DataSet.FreeBookmark(bm);
    dbg69.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end
  else
  begin
    Screen.Cursor := crHourglass;
    dbg204.DataSource.DataSet.DisableControls;
    bm := dbg204.DataSource.DataSet.GetBookmark;
    dbg204.DataSource.DataSet.First;

     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add;
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    mem := TMemo.Create(Self);
    mem.Visible := false;
    mem.Parent := self;
    mem.Clear;
    sline := '';
    for col := 0 to ehmain.FieldCount-1 do
     sline := sline + ehmain.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);

    sline := '';
    for col := 0 to ehmain.FieldCount-1 do
     sline := sline + ehmain.Fields[col].AsString + #9;
    mem.Lines.Add(sline);            //导出请购编号
    mem.Lines.Add('');
    sline := '';
    for col := 0 to dbg204.FieldCount-1 do
     sline := sline + dbg204.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);

    for row := 0 to dbg204.DataSource.DataSet.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to dbg204.FieldCount-1 do
       sline := sline + dbg204.Fields[col].AsString + #9;
      mem.Lines.Add(sline);
      dbg204.DataSource.DataSet.Next;
    end;

    mem.Lines.Add('');
    mem.Lines.Add('备注');//增加一行空行
    sline := '';
    gSvrIntf.IntfGetDataBySql('select * from data0011 where source_type=68 and file_pointer='+cdsmain.FieldByName('rkey').AsString,Lcds11);//查找记事本
    if not Lcds11.isempty then
    for col := 1 to 4 do
    mem.Lines.Add(Lcds11.Fieldbyname('NOTE_PAD_LINE_'+inttostr(col)).AsString);

    mem.SelectAll;
    mem.CopyToClipboard;
    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    FreeAndNil(mem);

    dbg204.DataSource.DataSet.GotoBookmark(bm);
    dbg204.DataSource.DataSet.FreeBookmark(bm);
    dbg204.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
  finally

  end;
end;

procedure TfrmMain_Mod280.mniHisPriceClick(Sender: TObject);
var
Lsql:string;
begin
  inherited;
  if cdsMain.FieldByName('flag').AsString='M' then
  begin
  frmHisPriceZx_Mod27:=TfrmHisPriceZx_Mod27.Create(nil);
  try
   Lsql:='SELECT TOP 50 Data0204.DESCRIPTION_1, dbo.Data0204.GUI_GE,'+
       ' Data0204.QUANTITY_REQUIRED, dbo.Data0204.UNIT_PRICE,'+
       ' Data0204.REQ_DATE, dbo.Data0204.o_i_flag, dbo.Data0001.CURR_NAME,'+
       ' Data0023.ABBR_NAME, dbo.Data0002.UNIT_NAME'+
       ' FROM Data0204 INNER JOIN Data0001 ON'+
       ' Data0204.PO_LINK_PTR = dbo.Data0001.RKEY INNER JOIN Data0023 ON'+
       ' Data0204.SUPPLIER_PTR = dbo.Data0023.RKEY INNER JOIN'+
       ' Data0002 ON dbo.Data0204.G_L_PTR = dbo.Data0002.RKEY'+
       ' where Data0204.DESCRIPTION_1 ='+quotedstr(cdsDetail.FieldByName('DESCRIPTION_1').AsString)+
       ' ORDER BY dbo.Data0204.REQ_DATE DESC';
   gSvrIntf.IntfGetDataBySql(Lsql,frmHisPriceZx_Mod27.cds204);
   frmHisPriceZx_Mod27.ShowModal;
  finally
   frmHisPriceZx_Mod27.Free;
  end;
  end
  else
  begin
  frmHisPrice_Mod27:=TfrmHisPrice_Mod27.Create(nil);
   try
   Lsql:='SELECT TOP 50 Data0069.QUANTITY, dbo.Data0069.UNIT_PRICE,'+
       ' Data0069.REQ_DATE, dbo.Data0002.UNIT_NAME,'+
       ' Data0001.CURR_NAME, dbo.Data0023.ABBR_NAME,'+
       ' Data0069.o_i_flag,data0069.tax_price,data0069.tax'+
       ' FROM Data0069 INNER JOIN '+
       ' Data0023 ON dbo.Data0069.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'+
       ' Data0001 ON'+
       ' Data0069.PO_LINK_PTR = dbo.Data0001.RKEY INNER JOIN'+
       ' Data0002 ON dbo.Data0069.UNIT_PTR = dbo.Data0002.RKEY'+
       ' WHERE dbo.Data0069.INVT_PTR ='+cdsDetail.FieldByName('INVT_PTR').AsString+
       ' ORDER BY dbo.Data0069.REQ_DATE DESC';
    gSvrIntf.IntfGetDataBySql(Lsql,frmHisPrice_Mod27.cds69);
    frmHisPrice_Mod27.ShowModal;
   finally
    frmHisPrice_Mod27.Free;
   end;
  end;
end;

end.
