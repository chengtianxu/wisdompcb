unit DetailFrm_Mod291;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, RzTabs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.Mask, Data.DB, Datasnap.DBClient, Vcl.Menus;

type
  TfrmDetail_Mod291 = class(TfrmBase)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    btnCommit: TBitBtn;
    btnBack: TBitBtn;
    btnClose: TBitBtn;
    btnCancel: TBitBtn;
    RzPageControl1: TRzPageControl;
    ts1: TRzTabSheet;
    ts2: TRzTabSheet;
    ts3: TRzTabSheet;
    ts4: TRzTabSheet;
    ts5: TRzTabSheet;
    ts6: TRzTabSheet;
    pnl7: TPanel;
    pnl8: TPanel;
    ehDept: TDBGridEh;
    ehTool: TDBGridEh;
    ehParams: TDBGridEh;
    ehBom: TDBGridEh;
    eh38: TDBGridEh;
    eh360: TDBGridEh;
    ehTotal360: TDBGridEh;
    lbl1: TLabel;
    cbbFactory: TComboBox;
    rgFactory: TRadioGroup;
    rgType: TRadioGroup;
    dbchk1: TDBCheckBox;
    dbchk2: TDBCheckBox;
    dbchk3: TDBCheckBox;
    dbchk4: TDBCheckBox;
    dbchk5: TDBCheckBox;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    dbedtCustmer: TDBEdit;
    dbedtOrigCustmer: TDBEdit;
    dbedtPart: TDBEdit;
    dbedtDESC: TDBEdit;
    lbl6: TLabel;
    dtpDate: TDateTimePicker;
    lbl7: TLabel;
    dbedtRef: TDBEdit;
    lbl8: TLabel;
    btnRemar: TBitBtn;
    cds60: TClientDataSet;
    ds60: TDataSource;
    cds90: TClientDataSet;
    ds90: TDataSource;
    cds62: TClientDataSet;
    ds62: TDataSource;
    cds89: TClientDataSet;
    ds89: TDataSource;
    cds26: TClientDataSet;
    ds26: TDataSource;
    cds360: TClientDataSet;
    ds360: TDataSource;
    cds38: TClientDataSet;
    ds38: TDataSource;
    Panel1: TPanel;
    cdsTotal360: TClientDataSet;
    dsTotal360: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblCycle: TLabel;
    Label7: TLabel;
    btnUpdate: TBitBtn;
    DBQtySet: TDBText;
    DBQtyPCS: TDBText;
    DBArea: TDBText;
    DBProType: TDBText;
    DBCycle: TDBText;
    Label9: TLabel;
    DBOrdType: TDBText;
    lblOnTime: TLabel;
    pm360: TPopupMenu;
    NAdd: TMenuItem;
    NEdit: TMenuItem;
    NDel: TMenuItem;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    mmo1: TDBMemo;
    mmo2: TDBMemo;
    mmo4: TDBMemo;
    mmo3: TDBMemo;
    cds360_2: TClientDataSet;
    procedure RzPageControl1Change(Sender: TObject);
    procedure NAddClick(Sender: TObject);
    procedure pm360Popup(Sender: TObject);
    procedure NEditClick(Sender: TObject);
    procedure NDelClick(Sender: TObject);
    procedure dtpDateChange(Sender: TObject);
    procedure btnRemarClick(Sender: TObject);
    procedure cbbFactoryChange(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    LDate:TDateTime;

    function DataFilter:string;

  public
    { Public declarations }
    LDetailType:Integer;    //0:表示评审     1：表示取消评审
    LIsChang:Boolean;
    procedure GetData(ARkey90,ARkey60,ARkey25:Integer;ADate:TDateTime);
    procedure InitFrm;

  end;

var
  frmDetail_Mod291: TfrmDetail_Mod291;

implementation

uses uCommFunc,System.DateUtils, DateFrm_Mod291, RemarkFrm_Mod291;

{$R *.dfm}

{ TfrmDetail_Mod291 }

procedure TfrmDetail_Mod291.btnBackClick(Sender: TObject);
var
  LSql60,LSql90:string;
  LCds60,LCds90:TClientDataSet;
  LDataPost:OleVariant;
begin
  inherited;
  if Trim(cds60.FieldByName('RemarkAudit').AsString) = '' then
  begin
    ShowMessage('退回原因不能为空');
    mmo1.SetFocus;
    Exit;
  end;

  LSql60:= 'Select * from data0060 where rkey = ' + cds60.FieldByName('rkey60').AsString;
  LSql90:= 'Select * from data0090 where rkey = ' + cds60.FieldByName('rkey90').AsString;
  LCds60:= TClientDataSet.Create(nil);
  LCds90:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql60,LSql90])
          ,[LCds60,LCds90]) then
    begin
      ShowMessage('取得数据失败！');
      Exit;
    end;

    if not LCds90.IsEmpty then
    begin
      if (not LCds90.FieldByName('auth_date').IsNull and LCds60.FieldByName('rma_ptr').IsNull) then
      begin
        ShowMessage('状态发生改变,可能部门其它人员已处理');
        exit;
      end;
    end
    else
    begin
      ShowMessage('查找评审记录不存在，请联系管理员');
      Exit;
    end;

    LCds60.Edit;
    LCds60.FieldByName('RemarkAudit').Value:= cds60.FieldByName('RemarkAudit').Value;
    LCds60.FieldByName('quote_price').Value:= 2;
    LCds60.FieldByName('rma_ptr').Value:=StrToInt(gVar.rkey05);
    LCds60.FieldByName('MFG_ORDER_DATE').Value:= gFunc.GetSvrDateTime();
    LCds60.Post;

    if gSvrIntf.IntfPostDataByTable('data0060',LCds60.Delta) then
    begin
      ShowMessage('退回成功！');
      ModalResult:= mrOk;
    end
    else
    begin
      ShowMessage('退回失败,请重试！！');
      exit;
    end;
  finally
    LCds60.Free;
    LCds90.Free;
  end;
end;

procedure TfrmDetail_Mod291.btnCancelClick(Sender: TObject);
var
  LSql60,LSql90:string;
  LCds60,LCds90:TClientDataSet;
  LDataPost:OleVariant;
begin
  inherited;
  LSql60:= 'Select * from data0060 where rkey = ' + cds60.FieldByName('rkey60').AsString;
  LSql90:= 'Select * from data0090 where rkey = ' + cds60.FieldByName('rkey90').AsString;
  LCds60:= TClientDataSet.Create(nil);
  LCds90:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql60,LSql90])
          ,[LCds60,LCds90]) then
    begin
      ShowMessage('取得数据失败！');
      Exit;
    end;
    if LCds60.FieldByName('quote_price').AsInteger <> cds60.FieldByName('quote_price').AsInteger then
    begin
      ShowMessage('状态发生改变,不能取消评审');
      exit;
    end;

    if not LCds90.IsEmpty then
    begin
      LCds90.Edit;
      LCds90.FieldByName('user_ptr').AsVariant:= null;
      LCds90.FieldByName('auth_date').AsVariant:= null;
      LCds90.Post;
    end
    else
    begin
      ShowMessage('查找评审记录不存在，请联系管理员');
      Exit;
    end;

    if LCds60.FieldByName('if_puthdate').Value = 1 then
    begin
      LCds60.Edit;
      LCds60.FieldByName('sch_date').AsVariant := null;
      LCds60.Post;
    end;

    LDataPost:= VarArrayCreate([0,1],varVariant);
    if LCds60.ChangeCount > 0 then LDataPost[0]:= LCds60.Delta;
    if LCds90.ChangeCount > 0 then LDataPost[1]:= LCds90.Delta;

    if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['data0060','data0090']),LDataPost) then
    begin
      ShowMessage('取消成功！');
      ModalResult:= mrOk;
    end
    else
    begin
      ShowMessage('取消失败,请重试！！');
      exit;
    end;
  finally
    LCds60.Free;
    LCds90.Free;
  end;
end;

procedure TfrmDetail_Mod291.btnCommitClick(Sender: TObject);
var
  LQty,LNotAuth:Integer;
  LSql60,LSql90,LSql14,LSql314:string;
  LCds60,LCds90,LCds14,LCds314:TClientDataSet;
  LDataPost:OleVariant;
begin
  inherited;
  LQty:= 0;
  LNotAuth:= 0;
  cds360.DisableControls;
  try
    cds360.First;
    while not cds360.Eof do
    begin
      LQty:= LQty + cds360.FieldByName('quantity').AsInteger;
      cds360.Next;
    end;
  finally
    cds360.EnableControls;
  end;
  if LQty <> cds60.FieldByName('PARTS_ORDERED').AsInteger then
  begin
    ShowMessage('完成数量不等于订单数量,请编辑相等!');
    RzPageControl1.ActivePageIndex:= 4;
    Exit;
  end;
  if cds60.FieldByName('barcode_flag').AsInteger = 1 then
    if MessageDlg('该产品有高难度管控标识，请注意是否已通过超能力评审!'
            ,mtConFirmation,[mbYes,mbNo],0) <> mrYes then Exit;
  if cds60.FieldByName('CONSUME_FORECASTS').AsInteger = 1 then
    if MessageDlg('该客户为绝对保证交期,请再次确认'
            ,mtConFirmation,[mbYes,mbNo],0) <> mrYes then Exit;

  LSql60:= 'SELECT * FROM data0060 WHERE rkey = ' + cds60.FieldByName('rkey60').AsString;
  LSql90:= 'SELECT * FROM data0090 WHERE pact_ptr = ' + cds60.FieldByName('rkey60').AsString;
  LSql14:= 'SELECT * FROM DATA0014 WHERE RKEY = 0';
  LSql314:= 'SELECT * FROM DATA0314 WHERE RKEY = 0';
  LCds60:= TClientDataSet.Create(nil);
  LCds90:= TClientDataSet.Create(nil);
  LCds14:= TClientDataSet.Create(nil);
  LCds314:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql60,LSql90,LSql14,LSql314])
          ,[LCds60,LCds90,LCds14,LCds314]) then
    begin
      ShowMessage('取得数据失败！');
      Exit;
    end;

    if LCds90.Locate('dept_ptr',cds60.FieldByName('dept_ptr').AsString,[]) then
    begin
      if not (LCds90.FieldByName('auth_date').IsNull and LCds60.FieldByName('rma_ptr').IsNull) then
      begin
        ShowMessage('状态发生改变,可能部门其它人员已处理');
        exit;
      end;
    end
    else
    begin
      ShowMessage('查找评审记录不存在，请联系管理员');
      Exit;
    end;

    LCds90.First;
    while not LCds90.Eof do
    begin
      if LCds90.FieldByName('auth_date').IsNull then inc(LNotAuth);
      LCds90.Next;
    end;
    LCds60.Edit;
    LCds60.FieldByName('RemarkAudit').Value:= cds60.FieldByName('RemarkAudit').Value;
    if LNotAuth = 1 then LCds60.FieldByName('quote_price').Value:= 1;
    if cds60.FieldByName('if_puthdate').AsInteger = 1 then
      LCds60.FieldByName('sch_date').Value:= dtpDate.Date;
    LCds60.Post;

    LCds90.Locate('dept_ptr',cds60.FieldByName('dept_ptr').AsString,[]);
    LCds90.Edit;
    LCds90.FieldByName('user_ptr').Value:= StrToInt(gVar.rkey05);
    LCds90.FieldByName('auth_date').Value:= gFunc.GetSvrDateTime();
    LCds90.Post;

    if LCds60.FieldByName('quote_price').AsInteger = 1 then
    begin
      LCds14.Append;
      LCds14.FieldByName('MESSAGE').Value:= '本厂编号【' + cds60.FieldByName('MANU_PART_NUMBER').AsString + '】客户型号【' + cds60.FieldByName('MANU_PART_DESC').AsString
          +'】' + #13 + '客户订单号【' + cds60.FieldByName('PO_NUMBER').AsString+'】销售单号【' + cds60.FieldByName('SALES_ORDER').AsString + '】已评审通过！';
      LCds14.FieldByName('whosend').Value:= StrToInt(gVar.rkey73);
      LCds14.FieldByName('IDKey').Value:= gFunc.CreateIDKey;
      LCds14.Post;

      LCds314.Append;
      LCds314.FieldByName('emp_ptr').Value:=  StrToInt(gVar.rkey73);
      LCds314.FieldByName('D14_IDKey').Value:= LCds14.FieldByName('IDKey').Value;
      LCds314.Post;
    end;

    LDataPost:= VarArrayCreate([0,4],varVariant);
    if LCds60.ChangeCount > 0 then LDataPost[0]:= LCds60.Delta;
    if LCds90.ChangeCount > 0 then LDataPost[1]:= LCds90.Delta;
    if LCds14.ChangeCount > 0 then LDataPost[2]:= LCds14.Delta;
    if LCds314.ChangeCount > 0 then LDataPost[3]:= LCds314.Delta;
    if cds360.ChangeCount > 0 then  LDataPost[4]:= cds360.Delta;

    if gSvrIntf.IntfPostModData('公共基础',291,LDataPost,0) then
    begin
      ShowMessage('评审成功！');
      if cds360.ChangeCount > 0 then  cds360.MergeChangeLog;
      ModalResult:= mrOk;
    end
    else
    begin
      ShowMessage('提交失败,请重新提交！！');
      exit;
    end;
  finally
    LCds60.Free;
    LCds90.Free;
    LCds314.Free;
    LCds14.Free;
  end;
end;

procedure TfrmDetail_Mod291.btnRemarClick(Sender: TObject);
var
  LFrm:TfrmRemark_Mod291;
  i:Integer;
begin
  inherited;
  LFrm:= TfrmRemark_Mod291.Create(nil);
  try
    LFrm.InitWithPickID(291,0);
    if LFrm.ShowModal = mrOk then
    begin
      for i:=1 to 4 do
      if Trim(LFrm.cdsPick.fieldbyname('note_pad_line_'+inttostr(i)).asstring) <> '' then
      begin
        cds60.Edit;
        cds60.FieldByName('RemarkAudit').Value:= cds60.FieldByName('RemarkAudit').Value
          + #13 + LFrm.cdsPick.fieldbyname('note_pad_line_'+inttostr(i)).asstring;
        cds60.Post;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmDetail_Mod291.btnUpdateClick(Sender: TObject);
var
  LSql,LSqlTotal360:string;
  LCds:TClientDataSet;
  LQty:Integer;
begin
  inherited;
  if cds360.ChangeCount > 0 then
  begin
    LQty:= 0;
    cds360.DisableControls;
    try
      cds360.First;
      while not cds360.Eof do
      begin
        LQty:= LQty + cds360.FieldByName('quantity').AsInteger;
        cds360.Next;
      end;
    finally
      cds360.EnableControls;
    end;
    if LQty <> cds60.FieldByName('PARTS_ORDERED').AsInteger then
    begin
      ShowMessage('完成数量不等于订单数量,请编辑相等!');
      Exit;
    end;
    if gSvrIntf.IntfPostDataByTable('data0360',cds360.Delta) then
    begin
      cds360.MergeChangeLog;
      LIsChang:= True;
    end;
    LSql:= cds360.CommandText + ' WHERE so_ptr= '+ cds60.FieldByName('rkey60').AsString;
    ShowMessage(LSql);
    if gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([cdsTotal360.CommandText,LSql]),[cdsTotal360,cds360]) then
    begin
      ShowMessage('更新入库计划成功!');
    end;
  end;
end;

procedure TfrmDetail_Mod291.cbbFactoryChange(Sender: TObject);
begin
  inherited;
  cdsTotal360.Filtered:= False;
  cdsTotal360.Filter:= DataFilter;
  cdsTotal360.Filtered := True;
end;

function TfrmDetail_Mod291.DataFilter:string;
begin
  Result:='1 = 1';
  if cbbFactory.ItemIndex <> 0 then  Result:= Result + ' AND abbr_name = ' + QuotedStr(Trim(cbbFactory.Text));
  if rgFactory.ItemIndex <> 0 then Result:= Result + ' AND difficulty_grade = ' + IntToStr(rgFactory.ItemIndex);
  if rgType.ItemIndex <> 0 then Result:= Result + ' AND ttype = ' + IntToStr(rgType.ItemIndex - 1);
end;

procedure TfrmDetail_Mod291.dtpDateChange(Sender: TObject);
begin
  inherited;
  cds360.First;
  cds360.Edit;
  cds360.FieldByName('sch_date').Value:= dtpDate.Date;
  cds360.Post;
end;

procedure TfrmDetail_Mod291.FormResize(Sender: TObject);
begin
  inherited;
  if LDetailType = 0 then
  begin
    btnCommit.Left:= Round((Self.Width - 8 - btnCommit.Width)/4);
    btnBack.Left:= Round((Self.Width - 8 - btnCommit.Width)/2);
    btnClose.Left:= Round((Self.Width - 8 - btnCommit.Width)/4*3);
  end
  else if LDetailType = 1 then
  begin
    btnCancel.Left:= Round((Self.Width - 8 - btnCommit.Width)/3);
    btnClose.Left:= Round((Self.Width - 8 - btnCommit.Width)/3*2);
  end;
end;

procedure TfrmDetail_Mod291.GetData(ARkey90, ARkey60, ARkey25: Integer;ADate:TDateTime);
var
  LSql60,LSql90,LSql62:string;
  LSql89,LSql26,LSql38:string;
  LSql360,LSqlTotal360:string;
  LSql:string;
  LCds:TClientDataSet;
begin
  LDate:= ADate;
  LSql60:= cds60.CommandText + ' WHERE Data0090.rkey = ' + IntToStr(ARkey90);
  LSql90:= cds90.CommandText + ' WHERE Data0090.pact_ptr = ' + IntToStr(ARkey60);
  LSql62:= cds62.CommandText + ' WHERE Data0062.SO_PTR = ' + IntToStr(ARkey60);
  LSql89:= cds89.CommandText + ' WHERE Data0089.cust_part_ptr = ' + IntToStr(ARkey25) +
              ' ORDER BY data0089.rkey ';
  LSql26:= cds26.CommandText + ' WHERE Data0060.rkey = ' + IntToStr(ARkey60);
  LSql38:= cds38.CommandText + ' WHERE Data0025.rkey = ' + IntToStr(ARkey25) +
              ' ORDER BY Data0038.STEP_NUMBER ';
  LSql360:= cds360.CommandText + ' WHERE so_ptr= '+ IntToStr(ARkey60);
  LSqlTotal360:= ';WITH D360 as   '+#13+
                 ' (                       '+#13+
                 ' SELECT data0360.sch_date,Data0025.MANU_PART_NUMBER,Data0015.rkey   '+#13+
                 '        ,Data0015.ABBR_NAME,Data0025.ttype,Data0008.difficulty_grade     '+#13+
                 ' FROM   Data0060 INNER JOIN             '+#13+
                 '        data0360 ON Data0060.RKEY = data0360.so_ptr INNER JOIN      '+#13+
                 '        Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER JOIN      '+#13+
                 '        Data0008 ON Data0025.PROD_CODE_PTR = Data0008.RKEY INNER JOIN     '+#13+
                 '        Data0015 ON Data0060.SHIP_REG_TAX_ID = Data0015.RKEY     '+#13+
                 ' WHERE  (data0360.sch_date >= ' + QuotedStr(DateTimeToStr(ADate)) + ') and Data0060.STATUS=1   '+#13+
                 ' GROUP BY data0360.sch_date,Data0025.MANU_PART_NUMBER,Data0015.rkey      '+#13+
                 '        ,Data0015.ABBR_NAME,Data0025.ttype,Data0008.difficulty_grade     '+#13+
                 ' ),               '+#13+
                 ' D360_2 as       '+#13+
                 ' (               '+#13+
                 ' SELECT data0360.sch_date, '+#13+
                 '        SUM(data0360.quantity * Data0025.unit_sq) AS qty_mianji,      '+#13+
                 '        SUM(data0360.quantity) AS qty_total,Data0015.RKEY,       '+#13+
                 '        Data0015.ABBR_NAME,Data0025.ttype,Data0008.difficulty_grade   '+#13+
                 ' FROM   Data0060 INNER JOIN                 '+#13+
                 '        data0360 ON Data0060.RKEY = data0360.so_ptr INNER JOIN        '+#13+
                 '        Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER JOIN     '+#13+
                 '        Data0008 ON Data0025.PROD_CODE_PTR = Data0008.RKEY INNER JOIN    '+#13+
                 '        Data0015 ON Data0060.SHIP_REG_TAX_ID = Data0015.RKEY            '+#13+
                 ' WHERE  (data0360.sch_date >= ' + QuotedStr(DateTimeToStr(ADate)) + ' ) and Data0060.STATUS=1      '+#13+
                 ' GROUP BY data0360.sch_date,Data0015.ABBR_NAME,Data0025.ttype,Data0008.difficulty_grade,Data0015.RKEY   '+#13+
                 ' )                  '+#13+
                 ' SELECT D360.sch_date,D360.ABBR_NAME,D360.ttype,D360_2.rkey as rkey15   '+#13+
                 '     , D360.difficulty_grade, qty_mianji, qty_total   '+#13+
                 '     , case D360.ttype when 0 then ''量产'' when 1 then ''样板'' end as ttypetext    '+#13+
                 '     , COUNT(*) as number            '+#13+
                 ' FROM   D360_2 INNER JOIN D360 ON D360_2.sch_date = D360.sch_date    '+#13+
                 '       AND D360_2.ABBR_NAME = D360.ABBR_NAME     '+#13+
                 '       AND D360_2.ttype = D360.ttype      '+#13+
                 '       AND D360_2.difficulty_grade = D360.difficulty_grade   '+#13+
                 ' GROUP BY D360.sch_date,D360.ABBR_NAME,D360.ttype,D360_2.rkey     '+#13+
                 '     ,D360.difficulty_grade, qty_mianji, qty_total';
  cdsTotal360.CommandText:= LSqlTotal360;
  LSql:='SELECT rkey,abbr_name from data0015 ORDER BY RKEY';
  LCds:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql60,LSql90,LSql62,LSql89,LSql26,LSql38,Lsql360,LSqlTotal360,LSql,LSql360]),
                  [cds60,cds90,cds62,cds89,cds26,cds38,cds360,cdsTotal360,LCds,cds360_2]) then
    begin
      ShowMessage('从数据库取得数据失败，请联系管理员！');
      Exit;
    end;
    if not LCds.IsEmpty then
    begin
      cbbFactory.Clear;
      cbbFactory.Items.Add('全部');
      LCds.First;
      while not LCds.Eof do
      begin
        cbbFactory.Items.Add(LCds.FieldByName('abbr_name').AsString);
        LCds.Next;
      end;
      cbbFactory.ItemIndex:=0;
    end;
    if cds60.FieldByName('lead_time').Value <> 0 then
      lblCycle.Caption:= FormatFloat('0.0'
          ,(cds60.FieldByName('ORIG_SCHED_SHIP_DATE').Value - ADate)/cds60.FieldByName('lead_time').Value);
  finally
    LCds.Free;
  end;

end;

procedure TfrmDetail_Mod291.InitFrm;
begin
  if LDetailType = 0 then     //评审
  begin
    if cds60.FieldByName('if_puthdate').AsInteger = 1 then
    begin
      dtpDate.DateTime:= cds60.FieldByName('ORIG_SCHED_SHIP_DATE').AsDateTime;
      dtpDate.Visible := True;
      lbl6.Visible:= True;
      if cds60.FieldByName('CONSUME_FORECASTS').AsInteger = 1 then
         lblOnTime.Visible := True;
    end
    else
    begin
      dtpDate.Visible := False;
      lbl6.Visible:= False;
      eh360.PopupMenu:= nil;
      btnUpdate.Enabled:= False;
    end;
    btnCancel.Visible:= False;
    RzPageControl1.ActivePageIndex := 4;
  end
  else if LDetailType = 1 then   //取消评审
  begin
    btnCommit.Visible:= False;
    btnBack.Visible:= False;
    RzPageControl1.ActivePageIndex := 0;
    eh360.PopupMenu:= nil;
    dtpDate.Enabled:= False;
    btnUpdate.Enabled:= False;
    btnRemar.Enabled:= False;
    dtpDate.Enabled:= False;
  end;
end;

procedure TfrmDetail_Mod291.NAddClick(Sender: TObject);
var
  LFrm:TfrmDate_Mod291;
  LSchDate:TStringList;
  LRowNO:Integer;
begin
  inherited;
  LFrm:= TfrmDate_Mod291.Create(nil);
  LSchDate:= TStringList.Create;
  cds360.DisableControls;
  try
    LRowNO:= cds360.RecNo;
    cds360.Last;
    if DayOfTheWeek(cds360.FieldByName('sch_date').AsDateTime) = 6 then
      LFrm.dtpDate.DateTime :=  cds360.FieldByName('sch_date').AsDateTime + 2
    else
      LFrm.dtpDate.DateTime :=  cds360.FieldByName('sch_date').AsDateTime + 1;

    cds360.First;
    while not cds360.Eof do
    begin
      LSchDate.Add(cds360.FieldByName('sch_date').AsString);
      cds360.Next;
    end;
    cds360.RecNo:= LRowNO;

    if LFrm.ShowModal = mrOk then
    begin
      if LSchDate.IndexOf(DateToStr(LFrm.dtpDate.Date)) <> -1 then
      begin
        ShowMessage('完工日期已经存在');
        exit;
      end;
      if StrToInt(Trim(LFrm.edtQty.Text)) >= cds360.FieldByName('quantity').AsInteger then
      begin
        ShowMessage('新完工数量不能大于等于原完工数量！');
        exit;
      end;
      cds360.Edit;
      cds360.FieldByName('quantity').Value:= cds360.FieldByName('quantity').Value - StrToInt(Trim(LFrm.edtQty.Text));
      cds360.Post;

      cds360.Append;
      cds360.FieldByName('so_ptr').Value:= cds60.FieldByName('rkey60').Value;
      cds360.FieldByName('quantity').Value:= StrToInt(Trim(LFrm.edtQty.Text));
      cds360.FieldByName('sch_date').Value:= LFrm.dtpDate.Date;
      cds360.FieldByName('planned_qty').Value:= 0;
      cds360.Post;

      cds360.RecNo:= 1;
      dtpDate.DateTime:= cds360.FieldByName('sch_date').Value;
    end;
  finally
    cds360.EnableControls;
    LFrm.Free;
    LSchDate.Free;
  end;
end;

procedure TfrmDetail_Mod291.NDelClick(Sender: TObject);
var
  LQty:Integer;
begin
  inherited;
  if cds360.RecordCount = 1 then
  begin
    ShowMessage('最后一条完工日期不能删除！');
    Exit;
  end;
  if MessageDlg('确定删除此完工计划吗？',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    LQty:= cds360.FieldByName('quantity').AsInteger;
    cds360.Delete;
    cds360.RecNo:= 1;
    cds360.Edit;
    cds360.FieldByName('quantity').Value:= cds360.FieldByName('quantity').Value + LQty;
    cds360.Post;
    dtpDate.DateTime:= cds360.FieldByName('sch_date').Value;
  end;
end;

procedure TfrmDetail_Mod291.NEditClick(Sender: TObject);
var
  LFrm:TfrmDate_Mod291;
  LSchDate:TStringList;
  LDate:TDateTime;
  LRowNO:Integer;
begin
  inherited;
  LFrm:= TfrmDate_Mod291.Create(nil);
  LSchDate:= TStringList.Create;
  cds360.DisableControls;
  try
    LRowNO:= cds360.RecNo;
    LFrm.dtpDate.DateTime :=  cds360.FieldByName('sch_date').AsDateTime;
    LFrm.edtQty.Text:= cds360.FieldByName('quantity').AsString;
    LDate:= cds360.FieldByName('sch_date').AsDateTime;
    cds360.EnableControls;
    try
      cds360.First;
      while not cds360.Eof do
      begin
        if LDate <> cds360.FieldByName('sch_date').AsDateTime then
          LSchDate.Add(cds360.FieldByName('sch_date').AsString);
        cds360.Next;
      end;
      cds360.RecNo:= LRowNO;
    finally
      cds360.EnableControls;
    end;

    if LFrm.ShowModal = mrOk then
    begin
      if LSchDate.IndexOf(DateToStr(LFrm.dtpDate.Date)) <> -1 then
      begin
        ShowMessage('完工日期已经存在');
        exit;
      end;
      cds360.Edit;
      cds360.FieldByName('sch_date').Value:= LFrm.dtpDate.Date;
      cds360.FieldByName('quantity').Value:= StrToInt(Trim(LFrm.edtQty.Text));
      cds360.Post;

      cds360.RecNo:= 1;
      dtpDate.DateTime:= cds360.FieldByName('sch_date').Value;
    end;
  finally
    cds360.EnableControls;
    LFrm.Free;
    LSchDate.Free;
  end;
end;

procedure TfrmDetail_Mod291.pm360Popup(Sender: TObject);
begin
  inherited;
  NAdd.Enabled:= (not cds360.IsEmpty ) ;
  NEdit.Enabled:= (not cds360.IsEmpty );
  NDel.Enabled:= (not cds360.IsEmpty );
end;

procedure TfrmDetail_Mod291.RzPageControl1Change(Sender: TObject);
begin
  inherited;
  cbbFactory.Visible:= RzPageControl1.ActivePageIndex = 5;
  lbl1.Visible:= cbbFactory.Visible;
  rgFactory.Visible:= RzPageControl1.ActivePageIndex = 5;
  rgType.Visible:= RzPageControl1.ActivePageIndex = 5;
end;

end.
