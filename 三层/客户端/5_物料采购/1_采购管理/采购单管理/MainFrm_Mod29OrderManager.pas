unit MainFrm_Mod29OrderManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan,
  Datasnap.DBClient, Vcl.Menus, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, RzEdit, RzBtnEdt,
  uRKeyBtnEdit, Vcl.ComCtrls, Datasnap.Provider, Data.Win.ADODB;

type
  TfrmMain_Mod29OrderManager = class(TfrmBaseMain)
    pnl1: TPanel;
    grpStatus: TGroupBox;
    cbx1: TCheckBox;
    cbx2: TCheckBox;
    cbx3: TCheckBox;
    cbx4: TCheckBox;
    cbx5: TCheckBox;
    cbx6: TCheckBox;
    cbx7: TCheckBox;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    cbx8: TCheckBox;
    mniAdd: TMenuItem;
    mniAddS: TMenuItem;
    mniAddM: TMenuItem;
    mniImport: TMenuItem;
    mniEdit: TMenuItem;
    mniEditDate: TMenuItem;
    mniCheck: TMenuItem;
    mniAuth: TMenuItem;
    mniUnAuth: TMenuItem;
    mniText: TMenuItem;
    mniN1: TMenuItem;
    mniStop: TMenuItem;
    mniStart: TMenuItem;
    mniDel: TMenuItem;
    mniN2: TMenuItem;
    mniEnd: TMenuItem;
    mniReStart: TMenuItem;
    mniN3: TMenuItem;
    mniAuthMsg: TMenuItem;
    mniReceivedMsg: TMenuItem;
    mniASK: TMenuItem;
    mniPrintOnly: TMenuItem;
    mniPrintMul: TMenuItem;
    mniChangLog: TMenuItem;
    cds78: TClientDataSet;
    cds14: TClientDataSet;
    cds314: TClientDataSet;
    cds70: TClientDataSet;
    cds362: TClientDataSet;
    cds68: TClientDataSet;
    cds69: TClientDataSet;
    cds204: TClientDataSet;
    cds78_2: TClientDataSet;
    pmDY: TPopupMenu;
    mniS: TMenuItem;
    mniM: TMenuItem;
    btnWJH: TBitBtn;
    rgPrint: TRadioGroup;
//    procedure rkyCodeButtonClick(Sender: TObject);
    procedure cbx1Click(Sender: TObject);
    procedure dtpkSExit(Sender: TObject);
    procedure btnQryClick(Sender: TObject);
    procedure mniAddSClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniAddMClick(Sender: TObject);
    procedure mniImportClick(Sender: TObject);
    procedure mniDelClick(Sender: TObject);
    procedure mniAuthClick(Sender: TObject);
    procedure mniUnAuthClick(Sender: TObject);
    procedure mniStopClick(Sender: TObject);
    procedure mniStartClick(Sender: TObject);
    procedure mniEndClick(Sender: TObject);
    procedure mniReStartClick(Sender: TObject);
    procedure mniAuthMsgClick(Sender: TObject);
    procedure mniReceivedMsgClick(Sender: TObject);
    procedure mniChangLogClick(Sender: TObject);
    procedure mniASKClick(Sender: TObject);
    procedure mniCheckClick(Sender: TObject);
    procedure mniEditDateClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure mniPrintOnlyClick(Sender: TObject);
    procedure mniPrintMulClick(Sender: TObject);
    procedure mniSClick(Sender: TObject);
    procedure mniMClick(Sender: TObject);
    procedure btnDYClick(Sender: TObject);
    procedure ehMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure mniTextClick(Sender: TObject);
    procedure btnWJHClick(Sender: TObject);
    procedure rgPrintClick(Sender: TObject);
    procedure ehMainDblClick(Sender: TObject);
  private
    { Private declarations }
    LEDate:TDateTime;
    PrintBeforAuth,From04:string;  //审核前是否允许打印     控制码是否来自04
    function GetStatusWhere:string;
    procedure GetInf192;
    function GetOtherWhere:string;
//    procedure LoadCbb(ASql:string;ACbb:TComboBox);
    function CheckStore(ARkey70:string):Boolean;
    function SendMsg(ASend:Boolean):Boolean;
    function CheckRec(ARkey70:string):Boolean;
    function ChangStatus70(ARkey,AStatu,AType:Integer;ADesc,AFrom,ATo:Variant):Boolean;
    function Update362(ARkey,AType:string;AFlag:Integer):Boolean;
    function ChangStatus68(ARkey:string):Boolean;
    function PrintRep(Arkey:string):Boolean;

  public
    procedure OnAffterModPost(ACds:TClientDataSet);
    procedure GetData;override;

        { Public declarations }
  end;

//var
//  frmMain_Mod29: TfrmMain_Mod29;

implementation

uses  uCommFunc,System.DateUtils,uBaseSinglePickListFrm,DetailFrm_Mod29,
  AuthMsgFrm_Mod29, RecMsgFrm_Mod29, ChangLogFrm_Mod29, EdtReqDateFrm_Mod29,
  ReportMFrm_Mod29, ReportSFrm_Mod29, MultiPrintFrm_Mod29, NoteFrm_Mod29,
  OutOfDateFrm_Mod29;

{$R *.dfm}

{ TfrmMain_Mod29 }

procedure TfrmMain_Mod29OrderManager.btnDYClick(Sender: TObject);
begin
  inherited;
  pmDY.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmMain_Mod29OrderManager.btnQryClick(Sender: TObject);
begin
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'DATA0070.PO_DATE';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := FormatDateTime('YYYY-MM-DD',IncDay(LEDate,-3)) +
                                  ' AND ' + FormatDateTime('YYYY-MM-DD',LEDate);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '0';
    cdsMainWhereInit.Post;
  end;
  inherited;
end;

procedure TfrmMain_Mod29OrderManager.btnWJHClick(Sender: TObject);
var
  LFrm: TfrmOutOfDay_Mod29;
begin
  inherited;
  LFrm:= TfrmOutOfDay_Mod29.Create(nil);
  try
    LFrm.GetData;
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod29OrderManager.cbx1Click(Sender: TObject);
begin
  inherited;
  GetData;
end;

function TfrmMain_Mod29OrderManager.ChangStatus70(ARkey,AStatu,AType:Integer;ADesc,AFrom,ATo:Variant):Boolean;
var
  LSql,LSql2:string;
  LCds:TClientDataSet;
  LData:OleVariant;
begin
  inherited;
  Result:= False;
  LSql:='SELECT * FROM DATA0070 WHERE RKEY =' + IntToStr(ARkey);
  LSql2:='Select * FROM DATA0339 WHERE 1=0';
  LCds:= TClientDataSet.Create(Self);
  try
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql,LSql2]),[cds70,LCds]) then Exit;
    if not cds70.IsEmpty then
    begin
      cds70.Edit;
      cds70.FieldByName('status').Value:= AStatu;
      cds70.Post;

      LCds.Append;
      LCds.FieldByName('po_ptr').Value:= cdsMain.FieldByName('rkey').AsString;
      LCds.FieldByName('EDITED_BY_PTR').Value:= StrToInt(gVar.rkey05);
      LCds.FieldByName('tran_type').Value:= AType;
      LCds.FieldByName('TRAN_DESCRIPTION').Value:= ADesc;
      LCds.FieldByName('tran_from').AsVariant:= AFrom;
      LCds.FieldByName('tran_to').Value:= ATo;
//      LCds.FieldByName('data0071_ptr').AsVariant:= null;
//      LCds.FieldByName('data0072_ptr').AsVariant:= null;
      LCds.Post;

      LData:=VarArrayCreate([0,1],varVariant);
      if cds70.ChangeCount > 0 then LData[0]:= cds70.Delta;
      if LCds.ChangeCount > 0  then LData[1]:= LCds.Delta;
      if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['DATA0070','DATA0339']),LData) then
      begin
        cds70.MergeChangeLog;
        ShowMessage('操作成功！！');
        Result:= True;
        btnRefreshClick(nil);
      end;
    end;
  finally
    LCds.Free;
  end;
end;

function TfrmMain_Mod29OrderManager.ChangStatus68(ARkey: string):Boolean;
var
  LSql,LRkeys,LPtr:string;
  LCds:TClientDataSet;
begin
  Result:= False;
  LRkeys:='';
  LPtr:='';
  Lcds:= TClientDataSet.Create(Self);
  try
    if cdsMain.FieldByName('PO_TYPE').AsString  = 'S' then
    begin
      LSql:='SELECT rkey69 FROM DATA0071 WHERE PO_PTR = ' + ARkey;
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
      LCds.DisableControls;
      LCds.First;
      while not LCds.Eof do
      begin
        if LCds.FieldByName('rkey69').AsInteger > 0 then
          LRkeys:= LCds.FieldByName('rkey69').AsString + ',' + LRkeys;
        LCds.Next;
      end;
      LCds.EnableControls;
      if LRkeys > '' then
      begin
        LRkeys:= Copy(LRkeys,1,Length(LRkeys)-1);

        LSql:=' SELECT * FROM DATA0069 WHERE RKEY IN (' + LRkeys + ')';
        if NOT gSvrIntf.IntfGetDataBySql(LSql,cds69) then Exit;
        if not cds69.IsEmpty then
        begin
          cds69.First;
          while not cds69.Eof do
          begin
            cds69.Edit;
            cds69.FieldByName('status').Value:= 0;
            cds69.Post;
            if Pos(LPtr,cds69.FieldByName('PURCH_REQ_PTR').AsString) = 0 then
              LPtr:= cds69.FieldByName('PURCH_REQ_PTR').AsString + ',' + LPtr;
            cds69.Next;
          end;
          LPtr:= Copy(LPtr,1,Length(LPtr)-1);

          LSql:=' SELECT * FROM DATA0068 WHERE RKEY IN (' + LPtr + ')';
    //            '   	AND rkey NOT IN (  ' +#13+
    //            '       		SELECT dbo.Data0069.PURCH_REQ_PTR ' +#13+
    //            '           FROM data0069 ' +#13+
    //            '           WHERE PURCH_REQ_PTR in (' + LPtr + ') and status =0 )';
          if NOT gSvrIntf.IntfGetDataBySql(LSql,cds68) then Exit;
          if not cds68.IsEmpty then
          begin
            cds68.First;
            while not cds68.Eof do
            begin
              cds68.Edit;
              cds68.FieldByName('status').Value:= 2;
              cds68.Post;
              cds68.Next;
            end;
          end;
        end;
      end;
    end
    else
    begin
      LSql:='SELECT rkey204 FROM DATA0072 WHERE POPTR = ' + ARkey;
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
      LCds.First;
      while not LCds.Eof do
      begin
        if LCds.FieldByName('rkey204').AsInteger > 0 then
           LRkeys:= LCds.FieldByName('rkey204').AsString + ',' + LRkeys;
        LCds.Next;
      end;
      if LRkeys <> '' then
      begin
        LRkeys:= Copy(LRkeys,1,Length(LRkeys)-1);

        LSql:=' SELECT * FROM DATA0204 WHERE RKEY IN (' + LRkeys + ')';
        if NOT gSvrIntf.IntfGetDataBySql(LSql,cds204) then Exit;
        if not cds204.IsEmpty then
        begin
          cds204.First;
          while not cds204.Eof do
          begin
            cds204.Edit;
            cds204.FieldByName('status').Value:= 0;
            cds204.Post;
            if Pos(LPtr,cds204.FieldByName('PURCHASE_REQ_PTR').AsString) = 0 then
              LPtr:= cds204.FieldByName('PURCHASE_REQ_PTR').AsString + ',' + LPtr;
            cds204.Next;
          end;
          LPtr:= Copy(LPtr,1,Length(LPtr)-1);
          LSql:=' SELECT * FROM DATA0068 WHERE RKEY IN (' + LPtr + ')';
    //            '   	AND rkey NOT IN (  ' +#13+
    //            '       		SELECT dbo.Data0204.PURCHASE_REQ_PTR ' +#13+
    //            '           FROM data0204 ' +#13+
    //            '           WHERE PURCHASE_REQ_PTR in (' + LPtr + ') and status =0 )';
          if NOT gSvrIntf.IntfGetDataBySql(LSql,cds68) then Exit;
          if not cds68.IsEmpty then
          begin
            cds68.First;
            while not cds68.Eof do
            begin
              cds68.Edit;
              cds68.FieldByName('status').Value:= 2;
              cds68.Post;
              cds68.Next;
            end;
          end;
        end;
      end;
    end;
    Result:= True;
  finally
    LCds.Free;
  end;
end;

function TfrmMain_Mod29OrderManager.CheckRec(ARkey70:string): Boolean;
var
  LSql:string;
  LCds:TClientDataSet;
begin
  Result:= False;
  LCds:=TClientDataSet.Create(self);
  try
    if cdsMain.FieldByName('PO_TYPE').Value = 'S' then
    begin
      LSql:= 'SELECT data0022.rkey  ' + #13+
             '   FROM data0071 INNER JOIN  ' + #13+
             '      data0022 ON data0022.source_ptr=data0071.rkey ' + #13+
             '   WHERE data0071.po_ptr= ' + ARkey70;
    end
    else
    begin
      LSql:= 'SELECT data0235.rkey  ' + #13+
             '   FROM data0072 INNER JOIN  ' + #13+
             '      data0235 ON data0235.D0072_PTR = data0072.rkey ' + #13+
             '   WHERE data0072.poptr= ' + ARkey70;
    end;
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    if not LCds.IsEmpty then Result:= True;
  finally
    LCds.Free;
  end;
end;

function TfrmMain_Mod29OrderManager.CheckStore(ARkey70: string): Boolean;
var
  LSql,LInvNumber:string;
  LCds:TClientDataSet;
begin
  Result:=False;
  LInvNumber:='';
  LSql:='SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.QUAN_ON_HAND, SUM(dbo.Data0071.QUAN_ORD) '
           +' AS quan_ord, ISNULL(z_t.zaitu, 0) AS zaitu, ISNULL(vmi.vmi_quantotal, 0) AS vmi_quantotal, dbo.Data0017.REPORT_VALUE2'
           +' FROM         dbo.Data0071 INNER JOIN'
           +' dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.RKEY LEFT OUTER JOIN'
           +' (SELECT     Data0071_1.INVT_PTR, SUM(Data0071_1.QUAN_ORD - Data0071_1.QUAN_RECD) AS zaitu'
           +' FROM   dbo.Data0071 AS Data0071_1 INNER JOIN'
           +' dbo.Data0070 AS Data0070_1 ON Data0071_1.PO_PTR = Data0070_1.RKEY'
           +' WHERE      (Data0070_1.STATUS = 5) AND (Data0071_1.QUAN_ORD - Data0071_1.QUAN_RECD > 0)'
           +' GROUP BY Data0071_1.INVT_PTR) AS z_t ON dbo.Data0071.INVT_PTR = z_t.INVT_PTR LEFT OUTER JOIN'
           +' (SELECT  TOP (100) PERCENT INVENTORY_PTR, SUM(QUAN_ON_HAND) AS vmi_quantotal'
           +' FROM          dbo.DATA0134'
           +' WHERE      (QUAN_ON_HAND > 0)'
           +' GROUP BY INVENTORY_PTR) AS vmi ON dbo.Data0071.INVT_PTR = vmi.INVENTORY_PTR'
           +' WHERE     (dbo.Data0017.REPORT_VALUE2 > 0) '
           +' AND (dbo.Data0071.PO_PTR = ' + ARkey70 + ')'
           +' GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.QUAN_ON_HAND, dbo.Data0017.REPORT_VALUE2, '
           +' z_t.zaitu, vmi.vmi_quantotal'
           +' HAVING (SUM(dbo.Data0071.QUAN_ORD) + dbo.Data0017.QUAN_ON_HAND + ISNULL(z_t.zaitu, 0) + ISNULL(vmi.vmi_quantotal, 0) > dbo.Data0017.REPORT_VALUE2)';
  LCds:=TClientDataSet.Create(Self);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    if not LCds.IsEmpty then
    begin
      LCds.First;
      while not LCds.Eof do
      begin
        if LCds.RecordCount=LCds.RecNo then
        begin
          LInvNumber := LInvNumber + QuotedStr(LCds.FieldByName('INV_PART_NUMBER').AsString);
        end
        else
        begin
          LInvNumber := LInvNumber + QuotedStr(LCds.FieldByName('INV_PART_NUMBER').AsString)+',';
        end;
        LCds.Next;
      end;
      messagedlg('你请购的物料编码 '+ LInvNumber+'本次请购数+在途数量+现有库存+vmi已超过最高库存,请提升最高库存后再继续',mtconfirmation,[mbcancel],0);
      Result :=True;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmMain_Mod29OrderManager.dtpkSExit(Sender: TObject);
begin
  inherited;
  GetData;
end;

procedure TfrmMain_Mod29OrderManager.ehMainDblClick(Sender: TObject);
var
  LSql05:string;
  LCds:TClientDataSet;
begin
  inherited;
  if cdsMain.FieldByName('status').Value = 2  then
  begin
    LSql05:= 'SELECT employee_name from data0005 WHERE RKEY=' + cdsMain.FieldByName('STATE_TAX').AsString;
    LCds:= TClientDataSet.Create(nil);
    try
      if not gSvrIntf.IntfGetDataBySql(LSql05,LCds) then Exit;
      ShowMessage('采购会签未通过！' + #13 +
                    LCds.FieldByName('employee_name').AsString + ' 于日期: ' +
                    cdsMain.FieldByName('PRINT_TIME').AsString + '退回'+ #13 +
                    '原因如下：' + #13+
                    cdsMain.FieldByName('Remark2070').AsString );
    finally
      LCds.Free;
    end;
  end
  else mniCheckClick(nil);
end;

procedure TfrmMain_Mod29OrderManager.ehMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if cdsMain.FieldByName('status').Value = 2 then
    ehMain.Canvas.Font.Color:= clRed
  else if cdsMain.FieldByName('status').Value = 8 then
          ehMain.Canvas.Font.Color:= clBlue;
  ehMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmMain_Mod29OrderManager.GetData;
begin
//  if cbbBuyer.Items.Count = 1 then
//    LoadCbb('SELECT rkey,EMPLOYEE_NAME FROM DATA0005 WHERE BUYER_FLAG=''Y''',cbbBuyer);
//  if cbbWHoure.Items.Count = 1 then
//    LoadCbb('SELECT RKEY,abbr_name FROM data0015',cbbWHoure);

  FMainFrmSql:= cdsMain.CommandText;
  if Trim(FMainWhere) = '' then
  begin
    LEDate:= gFunc.GetSvrDateTime;
    FMainWhere:= ' AND DATA0070.PO_DATE BETWEEN ' + QuotedStr(FormatDateTime('YYYY-MM-DD',IncDay(LEDate,-3)))
          + ' AND ' + QuotedStr(FormatDateTime('YYYY-MM-DD',LEDate));
  end;
  FWhere2:= GetStatusWhere;
  FWhere3:= GetOtherWhere;
  FOrderby:= ' ORDER BY DATA0070.PO_NUMBER DESC';
//  ShowMessage(FMainFrmSql + FMainWhere + FWhere2 + FWhere3 + FOrderby);
  inherited;
  Self.GetInf192;
end;

procedure TfrmMain_Mod29OrderManager.GetInf192;
var
  LSql:string;
  LCds:TClientDataSet;
begin
  LSql:= 'SELECT suplstamat,suplstamisc FROM data0192';
  LCds:= TClientDataSet.Create(nil);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    if not LCds.IsEmpty then
    begin
      if LCds.FieldByName('suplstamat').AsString <> '' then
                    PrintBeforAuth:=LCds.FieldByName('suplstamat').AsString;
      if LCds.FieldByName('suplstamisc').AsString <> '' then
                    From04:= LCds.FieldByName('suplstamisc').AsString;
    end;
  finally
    LCds.Free;
  end;
end;

function TfrmMain_Mod29OrderManager.GetOtherWhere: string;
begin
  Result:='';
  if rgPrint.ItemIndex = 1  then
    Result:= Result + ' AND DATA0070.PRINT_DATE IS NOT NULL '
  else if rgPrint.ItemIndex = 2 then  Result:= Result + ' AND DATA0070.PRINT_DATE IS NULL ';
end;

function TfrmMain_Mod29OrderManager.GetStatusWhere: string;
begin
  Result := ' AND DATA0070.status in ( 99';
  if cbx1.Checked then Result:= Result + ',1';
  if cbx2.Checked then Result:= Result + ',2';
  if cbx3.Checked then Result:= Result + ',3';
  if cbx4.Checked then Result:= Result + ',4';
  if cbx5.Checked then Result:= Result + ',5';
  if cbx6.Checked then Result:= Result + ',6';
  if cbx7.Checked then Result:= Result + ',7';
  if cbx8.Checked then Result:= Result + ',8';
  Result:= Result + ')';
end;

procedure TfrmMain_Mod29OrderManager.mniAddMClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,29) then  exit;
  if frmDetail_Mod29 = nil then
  begin
    frmDetail_Mod29:= TfrmDetail_Mod29.Create(Self);
    frmDetail_Mod29.FAfterUpdate:= self.OnAffterModPost;
    frmDetail_Mod29.InitField72;
  end;
  frmDetail_Mod29.AddINVT:='M';
  frmDetail_Mod29.AddMod:=0;
  frmDetail_Mod29.OpenType := 0;
  frmDetail_Mod29.From04:= Self.From04;
  frmDetail_Mod29.GetDataM('0');
  frmDetail_Mod29.tbc.Visible:=False;
  frmDetail_Mod29.Show;
  frmDetail_Mod29.Init_UI;
  frmDetail_Mod29.mniSAddClick(nil);
end;

procedure TfrmMain_Mod29OrderManager.mniAddSClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,29) then Exit;
  if frmDetail_Mod29 = nil then
  begin
    frmDetail_Mod29:= TfrmDetail_Mod29.Create(Self);
    frmDetail_Mod29.FAfterUpdate:= self.OnAffterModPost;
    frmDetail_Mod29.InitField71;
  end;
  frmDetail_Mod29.AddINVT:='S';
  frmDetail_Mod29.AddMod:=0;
  frmDetail_Mod29.OpenType := 0;
  frmDetail_Mod29.From04:= Self.From04;
  frmDetail_Mod29.GetDataS('0');
  frmDetail_Mod29.tbc.Visible:=False;
  frmDetail_Mod29.Show;
  frmDetail_Mod29.Init_UI;
  frmDetail_Mod29.mniSAddClick(nil);
end;

procedure TfrmMain_Mod29OrderManager.mniASKClick(Sender: TObject);
var
  LSql,LInvt:string;
  LCds,LCds70:TClientDataSet;
begin
  inherited;
  LCds:=TClientDataSet.Create(Self);
  LCds70:=TClientDataSet.Create(Self);
  try
    if cdsMain.FieldByName('CSI_USER_POINTER').AsVariant = null then
    begin
      LInvt:='';
      LSql:=' SELECT max(rEQ_DATE) as max_date,data0017.INV_PART_DESCRIPTION  '+#13+
            '  FROM data0071 inner join   '+#13+
            '        (SELECT  INVT_PTR   '+#13+
            '        FROM  Data0071     '+#13+
            '        WHERE  (PO_PTR = ' + cdsMain.FieldByName('RKEY').AsString + ') '+#13+
            '        GROUP BY INVT_PTR) as d71 on data0071.invt_ptr = d71.invt_ptr INNER JOIN '+#13+
            '        data0017 on data0071.invt_ptr=data0017.rkey  '+#13+
            '  WHERE data0071.po_ptr<> ' + cdsMain.FieldByName('RKEY').AsString + #13 +
            '  GROUP BY data0071.invt_ptr,data0017.INV_PART_DESCRIPTION  '+#13+
            '  having getdate()- max(rEQ_DATE)>40  ';
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
      if not LCds.IsEmpty then
      begin
        LCds.First;
        while not LCds.Eof do
        begin
          LInvt:= LInvt + LCds.FieldByName('INV_PART_DESCRIPTION').AsString + #13 ;
          LCds.Next;
        end;
        if Trim(LInvt) <> '' then
          ShowMessage('本次采购如下物料在最近40天没有采购,务必询价!' + #13 + LInvt);
      end;

      LSql:='SELECT * FROM DATA0070 WHERE RKEY = ' + cdsMain.FieldByName('RKEY').AsString;
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds70) then Exit;
      if not LCds70.IsEmpty then
      begin
        LCds70.Edit;
        LCds70.FieldByName('CSI_USER_POINTER').Value:= StrToInt(gVar.rkey73);    //询价用户
        LCds70.Post;
      end;
      if gSvrIntf.IntfPostDataByTable('data0070',LCds70.Delta) then
      begin
        btnRefreshClick(nil);
        mniASK.Hint:= '取消询价';
      end
      else ShowMessage('修改询价用户出错！');
    end
    else
    begin
      LSql:='SELECT * FROM DATA0070 WHERE RKEY = ' + cdsMain.FieldByName('RKEY').AsString;
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds70) then Exit;
      if not LCds70.IsEmpty then
      begin
        LCds70.Edit;
        LCds70.FieldByName('CSI_USER_POINTER').AsVariant:= null;    //询价用户
        LCds70.Post;
      end;
      if gSvrIntf.IntfPostDataByTable('data0070',LCds70.Delta) then
      begin
        mniASK.Hint:= '询价';
        btnRefreshClick(nil);
      end
      else ShowMessage('取消询价出错！');
    end;
  finally
    LCds.Free;
    LCds70.Free;
  end;
end;

procedure TfrmMain_Mod29OrderManager.mniAuthClick(Sender: TObject);
var
  LSend:Boolean;
  LData:OleVariant;
begin
  inherited;
  if not gFunc.CheckUserAuth(5,29) then Exit;
  if CheckStore(cdsMain.FieldByName('rkey').AsString) then Exit;
  LSend:= MessageDlg('是否ERP内部信息通知采购审批人员?',mtconfirmation,[mbYes,mbNo],0)=mrYes;
  if not SendMsg(LSend) then
  begin
    ShowMessage('采购审批流程未正确定义');
    Exit;
  end;
  if not gSvrIntf.IntfGetDataBySql('SELECT * FROM DATA0070 WHERE RKEY='
        + cdsMain.FieldByName('RKEY').AsString,cds70) then Exit;

  if not cds70.IsEmpty then
  begin
    cds70.Edit;
    cds70.FieldByName('STATUS').Value:= 1; //待审核
    cds70.FieldByName('DATE_EDITED').Value:= gFunc.GetSvrDateTime;
    cds70.Post;
  end;
  if not Self.Update362(cdsMain.FieldByName('RKEY').AsString,cdsMain.FieldByName('PO_TYPE').AsString,1) then  //增加预算
  begin
    ShowMessage('更新预算失败！请联系管理员');
    Exit;
  end;
  LData:= VarArrayCreate([0,5],varVariant);
  if cds78.ChangeCount > 0 then LData[0]:= cds78.Delta;
  if cds78_2.ChangeCount > 0 then LData[1]:= cds78_2.Delta;
  if LSend then
  begin
    if cds14.ChangeCount > 0 then LData[2]:= cds14.Delta;
    if cds314.ChangeCount > 0 then LData[3]:= cds314.Delta;
  end;
  if cds70.ChangeCount > 0 then LData[4]:= cds70.Delta;
  if cds362.ChangeCount >0 then LData[5]:= cds362.Delta;

  if gSvrIntf.IntfPostModData('',29,LData,1) then
  begin
    ShowMessage('提交审批成功！');
    if cds78.ChangeCount > 0 then cds78.MergeChangeLog;
    if cds14.ChangeCount > 0 then cds14.MergeChangeLog;
    if cds314.ChangeCount > 0 then cds314.MergeChangeLog;
    if cds70.ChangeCount > 0 then cds70.MergeChangeLog;
    if cds362.ChangeCount >0 then cds362.MergeChangeLog;
    btnRefreshClick(nil);
  end
  else
  begin
    ShowMessage('提交审批失败！');
  end;
end;

procedure TfrmMain_Mod29OrderManager.mniAuthMsgClick(Sender: TObject);
var
  LFrm:TfrmAuthMsg_Mod29;
begin
  inherited;
  LFrm:= TfrmAuthMsg_Mod29.Create(Self);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod29OrderManager.mniChangLogClick(Sender: TObject);
var
  LFrm:TfrmChangLog_Mod29;
begin
  inherited;
  LFrm:= TfrmChangLog_Mod29.Create(Self);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString,cdsMain.FieldByName('PO_TYPE').AsString);
    LFrm.Init_Memo(cdsMain.FieldByName('PO_TYPE').AsString);
    LFrm.mmo1.Enabled:= False;
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod29OrderManager.mniCheckClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(3,29) then  exit;
  if frmDetail_Mod29 = nil then
  begin
    frmDetail_Mod29:= TfrmDetail_Mod29.Create(Self);
    if cdsMain.FieldByName('PO_TYPE').AsString = 'S' then  frmDetail_Mod29.InitField71
    else frmDetail_Mod29.InitField72;
  end;
  frmDetail_Mod29.AddINVT:= cdsMain.FieldByName('PO_TYPE').AsString;
  frmDetail_Mod29.OpenType := 2;
  if cdsMain.FieldByName('PO_TYPE').AsString = 'S' then
  begin
    frmDetail_Mod29.GetDataS(cdsMain.FieldByName('rkey').AsString);
    frmDetail_Mod29.CaleDetailS();
    frmDetail_Mod29.eh71.BringToFront;
  end
  else
  begin
    frmDetail_Mod29.GetDataM(cdsMain.FieldByName('rkey').AsString);
    frmDetail_Mod29.CaleDetailM;
    frmDetail_Mod29.eh72.BringToFront;
  end;
  frmDetail_Mod29.CaleTotal;
  frmDetail_Mod29.tbc.Tabs.Add(cdsMain.FieldByName('CODE').AsString);
  frmDetail_Mod29.tbc.Visible:=True;
  frmDetail_Mod29.LoadData;
  frmDetail_Mod29.Init_UI;
  frmDetail_Mod29.Show;
end;

procedure TfrmMain_Mod29OrderManager.mniDelClick(Sender: TObject);
var
  LData:OleVariant;
begin
  inherited;
  if not gFunc.CheckUserAuth(4,29) then  exit;
  if CheckRec(cdsMain.FieldByName('rkey').AsString) then
  begin
    ShowMessage('该采购已经有收货记录不能删除,请使用结束订单!');
    Exit;
  end;

  if MessageDlg('你确定要删除订单吗？',mtconfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    if not Self.ChangStatus68(cdsMain.FieldByName('rkey').AsString) then    //反更新68 69 204 状态
    begin
      ShowMessage('修改状态失败！请联系管理员');
      Exit;
    end;
    if not gSvrIntf.IntfGetDataBySql('SELECT * FROM DATA0070 WHERE RKEY='
          + cdsMain.FieldByName('RKEY').AsString,cds70) then Exit;
    cds70.Delete;

    LData:= VarArrayCreate([0,3],varVariant);
    if cdsMain.FieldByName('PO_TYPE').AsString = 'S' then
    begin
      if cds69.ChangeCount > 0 then LData[0]:= cds69.Delta;
    end
    else
    begin
      if cds204.ChangeCount > 0 then    LData[1]:= cds204.Delta;
    end;
    if cds68.ChangeCount > 0 then LData[2]:= cds68.Delta;

    LData[3]:= cds70.Delta;
    if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['Data0069','Data0204','Data0068','Data0070']),LData) then
    begin
      if cds69.ChangeCount > 0 then cds69.MergeChangeLog;
      if cds204.ChangeCount > 0 then cds204.MergeChangeLog;
      if cds68.ChangeCount > 0 then cds68.MergeChangeLog;
      cds70.MergeChangeLog;
      ShowMessage('删除成功！');
      btnRefreshClick(nil);
    end
    else
      ShowMessage('删除失败！');
  end;
end;

procedure TfrmMain_Mod29OrderManager.mniEditClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(2,29) then  exit;
  if (cdsMain.FieldByName('status').AsInteger = 5)
     or (cdsMain.FieldByName('status').AsInteger = 6)
     or (cdsMain.FieldByName('status').AsInteger = 7) then
  begin
    ShowMessage('订单已经处理，不能再编辑！');
    Exit;
  end;

  if frmDetail_Mod29 = nil then
  begin
    frmDetail_Mod29:= TfrmDetail_Mod29.Create(Self);
    frmDetail_Mod29.FAfterUpdate:= self.OnAffterModPost;
    if cdsMain.FieldByName('PO_TYPE').AsString = 'S' then  frmDetail_Mod29.InitField71
    else frmDetail_Mod29.InitField72;
  end;
  frmDetail_Mod29.AddINVT:= cdsMain.FieldByName('PO_TYPE').AsString;
  frmDetail_Mod29.OpenType := 1;    //编辑
  if cdsMain.FieldByName('PO_TYPE').AsString = 'S' then
  begin
    frmDetail_Mod29.GetDataS(cdsMain.FieldByName('rkey').AsString);
    frmDetail_Mod29.CaleDetailS();
    frmDetail_Mod29.eh71.BringToFront;
  end
  else
  begin
    frmDetail_Mod29.GetDataM(cdsMain.FieldByName('rkey').AsString);
    frmDetail_Mod29.CaleDetailM;
    frmDetail_Mod29.eh72.BringToFront;
  end;
  frmDetail_Mod29.CaleTotal;
  frmDetail_Mod29.tbc.Tabs.Add(cdsMain.FieldByName('CODE').AsString);
  frmDetail_Mod29.tbc.Visible:=True;
  frmDetail_Mod29.Init_UI;
  frmDetail_Mod29.LoadData;
  frmDetail_Mod29.Show;
end;

procedure TfrmMain_Mod29OrderManager.mniEditDateClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(2,29) then  exit;
  if frmEdtReqDate_Mod29 = nil then
  begin
    frmEdtReqDate_Mod29:= TfrmEdtReqDate_Mod29.Create(Self);
    frmEdtReqDate_Mod29.FAfterUpdate:= self.OnAffterModPost;
  end;
  if cdsMain.FieldByName('PO_Type').AsString = 'S' then
  begin
    frmEdtReqDate_Mod29.InitField71;
    frmEdtReqDate_Mod29.eh71.BringToFront;
    frmEdtReqDate_Mod29.eh71.PopupMenu := frmEdtReqDate_Mod29.pm1;
  end
  else
  begin
    frmEdtReqDate_Mod29.InitField72;
    frmEdtReqDate_Mod29.eh72.BringToFront;
    frmEdtReqDate_Mod29.eh72.PopupMenu := frmEdtReqDate_Mod29.pm1;
  end;
  frmEdtReqDate_Mod29.GetData(cdsMain.FieldByName('rkey').AsString,cdsMain.FieldByName('PO_Type').AsString);
  frmEdtReqDate_Mod29.Show;
  btnRefreshClick(nil);
end;

procedure TfrmMain_Mod29OrderManager.mniEndClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(8,29) then Exit;
  if not Self.ChangStatus70(cdsMain.FieldByName('rkey').AsInteger,6,5
          ,'采购定单状态已更改','状态已审核5','采购订单已被标识已收货6') then
  begin
    ShowMessage('结束订单失败！！');
    Exit;
  end;
end;

procedure TfrmMain_Mod29OrderManager.mniImportClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,29) then  exit;
  if frmDetail_Mod29 = nil then
  begin
    frmDetail_Mod29:= TfrmDetail_Mod29.Create(Self);
    frmDetail_Mod29.FAfterUpdate:= self.OnAffterModPost;
  end;
  frmDetail_Mod29.AddMod:=1;             //手工导入
  frmDetail_Mod29.From04:= Self.From04;
  frmDetail_Mod29.tbc.Visible:=False;
  frmDetail_Mod29.Show;
  frmDetail_Mod29.InitApp;
end;

procedure TfrmMain_Mod29OrderManager.mniMClick(Sender: TObject);
var
  LFileName: string;
  LFrm:TfrmReportM_Mod29;
begin
  inherited;
  LFrm:= TfrmReportM_Mod29.Create(nil);
  try

      LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
        'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\物料采购_采购管理\', [rfReplaceAll]) +
        '采购单管理杂项物料.fr3';
      LFrm.repM.LoadFromFile(LFileName);
      LFrm.repM.DesignReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod29OrderManager.mniPrintMulClick(Sender: TObject);
var
  LFrm:TfrmMultiPrint_Mod29;
  LRkey,i:Integer;
begin
  inherited;
  LRkey:= cdsMain.FieldByName('rkey').AsInteger;
  LFrm:= TfrmMultiPrint_Mod29.Create(nil);
  try
    cdsMain.DisableControls;
    cdsMain.First;
    while not cdsMain.Eof do
    begin
      if (cdsMain.FieldByName('CSI_USER_POINTER').Value > 0) then
      begin
        if (self.PrintBeforAuth='Y') then
        begin
          if  (cdsMain.FieldByName('status').AsInteger <> 5) and
               (cdsMain.FieldByName('status').AsInteger <> 6) and
               (cdsMain.FieldByName('status').AsInteger <> 7) then
          begin
            cdsMain.Next;
            Continue;
          end;
        end;
        LFrm.sg1.Cells[0,LFrm.sg1.RowCount-1]:= cdsMain.FieldByName('PO_NUMBER').AsString;
        LFrm.sg1.Cells[1,LFrm.sg1.RowCount-1]:= cdsMain.FieldByName('supp_abbrname').AsString;
        LFrm.sg1.Cells[2,LFrm.sg1.RowCount-1]:= cdsMain.FieldByName('rkey').AsString;
//        LFrm.sg1.Cells[3,LFrm.sg1.RowCount-1]:= IntToStr(LFrm.sg1.RowCount - 1);
        LFrm.sg1.RowCount:=  LFrm.sg1.RowCount + 1;
      end;
      cdsMain.Next;
    end;
    cdsMain.Locate('rkey',LRkey,[]);
    if LFrm.sg1.RowCount = 2 then
    begin
      ShowMessage('没有可打印的订单');
      Exit;
    end;
    if LFrm.ShowModal = mrOk then
    begin
      for i:=1 to LFrm.sg2.RowCount-2 do  PrintRep(LFrm.sg2.Cells[2,i]);
    end;
  finally
    LFrm.Free;
    cdsMain.EnableControls;
  end;
end;

procedure TfrmMain_Mod29OrderManager.mniPrintOnlyClick(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if (self.PrintBeforAuth='Y') then
  begin
    if (cdsMain.FieldByName('status').AsInteger<>5) and
       (cdsMain.FieldByName('status').AsInteger<>6) and
       (cdsMain.FieldByName('status').AsInteger<>7) then
    begin
       showmessage('对不起,没有审批的订单不能够被打印');
       exit;
    end;
  end;

  if cdsMain.FieldByName('CSI_USER_POINTER').AsInteger = 0 then
  begin
    showmessage('对不起,没有询价的订单不能够被打印');
    exit;
  end;

  if not Self.PrintRep(cdsMain.FieldByName('rkey').AsString) then
  begin
    ShowMessage('打印出错！');
    Exit;
  end
  else
  begin
    if cdsMain.FieldByName('print_date').IsNull then
    if messagedlg('将该PO标识为已打印吗？',mtConfirmation,[mbyes,mbno],0) = mryes then
    begin
      LSql:= ' SELECT * FROM DATA0070 WHERE RKEY= ' + cdsMain.FieldByName('rkey').AsString;
      LCds:= TClientDataSet.Create(Self);
      try
        if gSvrIntf.IntfGetDataBySql(LSql,LCds) then
        begin
          LCds.Edit;
          LCds.FieldByName('print_date').Value:= gFunc.GetSvrDateTime(dtdate);
          LCds.Post;

          if gSvrIntf.IntfPostDataByTable('data0070',LCds.Delta) then
          begin
            btnRefreshClick(nil);
          end;
        end
        else
        begin
          ShowMessage('更新打印状态失败！');
          Exit;
        end;
      finally
        LCds.Free;
      end;
    end;
  end;

//  if cdsMain.FieldByName('PO_TYPE').AsString = 'S' then
//  begin
//    LFrmS:=TfrmReportS_Mod29.Create(Self);
//    try
//      LFrmS.GetData(cdsMain.FieldByName('rkey').AsString);
//      LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
//        'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\物料采购_采购管理\', [rfReplaceAll]) +
//        '采购单管理标准物料.fr3';
//      LFrmS.repS.LoadFromFile(LFileName, true);
//      LFrmS.repS.ShowReport;
//    finally
//      LFrmS.Free;
//    end;
//  end
//  else
//  begin
//    LfrmM:=TfrmReportM_Mod29.Create(Self);
//    try
//      LfrmM.GetData(cdsMain.FieldByName('rkey').AsString);
//      LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
//        'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\物料采购_采购管理\', [rfReplaceAll]) +
//        '采购单管理杂项物料.fr3';
//      LfrmM.repM.LoadFromFile(LFileName, true);
//      LfrmM.repM.ShowReport;
//    finally
//      LfrmM.Free;
//    end;
//  end;
end;

procedure TfrmMain_Mod29OrderManager.mniReceivedMsgClick(Sender: TObject);
var
  LFrm:TfrmRecMsg_Mod29;
begin
  inherited;
  LFrm:= TfrmRecMsg_Mod29.Create(Self);
  try
    LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
    if cdsMain.FieldByName('PO_TYPE').AsString = 'M' then LFrm.grpVMI.Visible:= False;
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod29OrderManager.mniReStartClick(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  if not gFunc.CheckUserAuth(9,29) then Exit;
  LCds:= TClientDataSet.Create(Self);
  try
    if cdsMain.FieldByName('PO_TYPE').AsString = 'S' then
    begin
      LSql:= 'select rkey from data0071 where PO_PTR=' + cdsMain.FieldByName('rkey').AsString +
              ' and QUAN_ORD - QUAN_RECD>0';
    end
    else
    begin
      LSql:= 'select rkey from data0072 where POPTR=' + cdsMain.FieldByName('rkey').AsString +
              ' and QUAN_ORD - QUANTITY_RECEIVED>0';
    end;
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    if not LCds.IsEmpty then
    begin
      if not Self.ChangStatus70(cdsMain.FieldByName('rkey').AsInteger,5,9
              ,'采购定单状态已更改','从状态已收货6','采购订单已被标识审批5') then
      begin
        ShowMessage('更改状态失败！！');
        Exit;
      end;
    end
    else
    begin
      ShowMessage('该订单已无欠货记录,不能重启!!');
      Exit;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmMain_Mod29OrderManager.mniSClick(Sender: TObject);
var
  LFileName: string;
  LFrm:TfrmReportS_Mod29;
begin
  inherited;
  LFrm:= TfrmReportS_Mod29.Create(nil);
  try
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\物料采购_采购管理\', [rfReplaceAll]) +
      '采购单管理标准物料.fr3';
    LFrm.repS.LoadFromFile(LFileName);
    LFrm.repS.DesignReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod29OrderManager.mniStartClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(7,29) then Exit;
  if not Self.ChangStatus70(cdsMain.FieldByName('rkey').AsInteger,8,11
          ,'采购定单状态已更改',null,'采购订单已被重新启动为有效') then
  begin
    ShowMessage('重启订单失败！！');
    Exit;
  end;
end;

procedure TfrmMain_Mod29OrderManager.mniStopClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(6,29) then Exit;
  if not Self.ChangStatus70(cdsMain.FieldByName('rkey').AsInteger,4,11
            ,'采购定单状态已更改',null,'采购订单已被暂缓') then
  begin
    ShowMessage('暂缓订单失败！！');
    Exit;
  end;
end;

procedure TfrmMain_Mod29OrderManager.mniTextClick(Sender: TObject);
var
  LFrm:TfrmNote_Mod29;
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  LFrm:=TfrmNote_Mod29.Create(nil);
  try
    LFrm.Caption:= '交货记事本 ' + cdsMain.FieldByName('PO_NUMBER').AsString ;
    LFrm.mmo1.Lines.Add(Trim(cdsMain.FieldByName('remark1070').AsString));
//    Lfrm.mmo1.Enabled:=False;
//    LFrm.btnSelect.Enabled:= False;
    if LFrm.ShowModal = mrOk then
    begin
      LSql:= ' SELECT * FROM DATA0070 WHERE RKEY = ' +  cdsMain.FieldByName('rkey').AsString;
      LCds:= TClientDataSet.Create(Self);
      try
        if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
        LCds.Edit;
        LCds.FieldByName('remark1070').Value:= Trim(LFrm.mmo1.Text);
        LCds.Post;

        if gSvrIntf.IntfPostDataByTable('data0070',LCds.Delta) then
        begin
          ShowMessage('修改交货记事本成功！');
          btnRefreshClick(nil);
        end
        else ShowMessage('修改失败！');
      finally
        LCds.Free;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod29OrderManager.mniUnAuthClick(Sender: TObject);
var
  LData:OleVariant;
  LSql70:string;
begin
  inherited;
  if not gFunc.CheckUserAuth(10,29) then Exit;
  if CheckRec(cdsMain.FieldByName('rkey').AsString) then
  begin
    ShowMessage('该采购已经有收货记录不能取消审核!');
    Exit;
  end;
//  LSql78:= 'SELECT * FROM DATA0078 WHERE po_ptr=' + cdsMain.FieldByName('RKEY').AsString;
  LSql70:=' SELECT * FROM DATA0070 WHERE RKEY= ' + cdsMain.FieldByName('RKEY').AsString;
  if not gSvrIntf.IntfGetDataBySql(LSql70,cds70) then Exit;

//  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql78,LSql70]),[cds78,cds70]) then Exit;
//  if not cds78.IsEmpty then
//    while not cds78.IsEmpty do cds78.Delete;

  if not cds70.IsEmpty then
  begin
    cds70.Edit;
    cds70.FieldByName('STATUS').Value:= 8;
    cds70.FieldByName('DATE_EDITED').AsVariant:= null;
    cds70.Post;
  end;
  if not Self.Update362(cdsMain.FieldByName('RKEY').AsString,cdsMain.FieldByName('PO_TYPE').AsString,2) then      //减少预算
  begin
    ShowMessage('更新预算失败，请联系管理员！');
    Exit;
  end;
  Ldata:= VarArrayCreate([0,1],varVariant);
//  if cds78.ChangeCount > 0 then LData[0]:=cds78.delta;
  if cds70.ChangeCount > 0 then LData[0]:= cds70.Delta;
  if cds362.ChangeCount > 0  then LData[1]:= cds362.Delta;
  if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['Data0070','Data0362']),LData) then
  begin
    ShowMessage('取消审核成功！！');
    cds70.MergeChangeLog;
    btnRefreshClick(nil);
  end
  else
    ShowMessage('取消审核失败！！');
end;

procedure TfrmMain_Mod29OrderManager.OnAffterModPost(ACds: TClientDataSet);
begin
  btnRefreshClick(nil);
end;

procedure TfrmMain_Mod29OrderManager.pmMainPopup(Sender: TObject);
var
  i:Integer;
begin
  inherited;
  if cdsMain.IsEmpty then
  begin
    for i:= 0 to pmMain.Items.Count - 1 do
    begin
      if i > 1 then
      pmMain.Items[i].Enabled:= False;
    end;
  end
  else
  begin
    for i:= 0 to pmMain.Items.Count - 1 do
    begin
      pmMain.Items[i].Enabled:= True;
    end;
    mniEdit.Enabled:= (cdsMain.FieldByName('status').Value = 8) or (cdsMain.FieldByName('status').Value = 1)
              or (cdsMain.FieldByName('status').Value = 2);
    mniEditDate.Enabled:= (cdsMain.FieldByName('status').Value = 8) or (cdsMain.FieldByName('status').Value = 1)
              or (cdsMain.FieldByName('status').Value = 5);
    mniAuth.Enabled:= cdsMain.FieldByName('status').Value = 8;
    mniUnAuth.Enabled:= cdsMain.FieldByName('status').Value = 5;
    mniStop.Enabled:= (cdsMain.FieldByName('status').Value = 1) or (cdsMain.FieldByName('status').Value = 8);
    mniStart.Enabled:= cdsMain.FieldByName('status').Value = 4;
    mniDel.Enabled:= (cdsMain.FieldByName('status').Value = 8) or (cdsMain.FieldByName('status').Value = 2)
              or (cdsMain.FieldByName('status').Value = 3) or (cdsMain.FieldByName('status').Value = 1);
    mniend.Enabled:= (cdsMain.FieldByName('status').Value = 5);
    mniReStart.Enabled:= (cdsMain.FieldByName('status').Value = 6);
    if cdsMain.FieldByName('CSI_USER_POINTER').AsVariant = null then  mniASK.Caption:= '询价'
    else mniASK.Caption:= '取消询价';
    mniCheck.Enabled:= not cdsMain.IsEmpty;
  end;
end;

function TfrmMain_Mod29OrderManager.PrintRep(Arkey: string): Boolean;
var
  LFrmS: TfrmReportS_Mod29;
  LfrmM: TfrmReportM_Mod29;
  LFileName: string;
begin
  //Result:= False;
  if cdsMain.FieldByName('PO_TYPE').AsString = 'S' then
  begin
    LFrmS:=TfrmReportS_Mod29.Create(Self);
    try
      LFrmS.GetData(Arkey);
      LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
        'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\物料采购_采购管理\', [rfReplaceAll]) +
        '采购单管理标准物料.fr3';
      LFrmS.repS.LoadFromFile(LFileName, true);
//      LfrmS.repS.PreviewOptions.ShowCaptions:=True;
      LfrmS.repS.PrepareReport(True);
//      LfrmS.repS.Print;
//      LfrmS.repS.Print;
      LFrmS.repS.ShowReport;
      Result:= True;
    finally
      LFrmS.Free;
    end;
  end
  else
  begin
    LfrmM:=TfrmReportM_Mod29.Create(Self);
    try
      LfrmM.GetData(Arkey);
      LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
        'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\物料采购_采购管理\', [rfReplaceAll]) +
        '采购单管理杂项物料.fr3';
      LfrmM.repM.LoadFromFile(LFileName, true);
//      LfrmM.repM.PreviewOptions.ShowCaptions:=False;
      LfrmM.repM.PrepareReport(True);
//      LfrmM.repM.Print;
//      LfrmM.repM.Print;
      LfrmM.repM.ShowReport;
      Result:= True;
    finally
      LfrmM.Free;
    end;
  end;
end;

procedure TfrmMain_Mod29OrderManager.rgPrintClick(Sender: TObject);
begin
  inherited;
  GetData;
end;

function TfrmMain_Mod29OrderManager.SendMsg(ASend: Boolean): Boolean;
var
  LSql,LSql2,LSql3:string;
  LCds:TClientDataSet;
begin
  Result:= False;
  LCds:=TClientDataSet.Create(self);
  try
    LSql:='SELECT USER_PTR FROM Data0077 INNER JOIN  ' + #13+
          '      DATA0015 ON data0077.warehouse_ptr = DATA0015.RKEY  ' + #13+
          '  WHERE (lower_limit <= ' + FloatToStr(cdsMain.FieldByName('SUB_TOTAL').Value
                                * cdsMain.FieldByName('EXCHANGE_RATE').Value) +')' + #13+
          '    AND (upper_limit >= ' + FloatToStr(cdsMain.FieldByName('SUB_TOTAL').Value
                                * cdsMain.FieldByName('EXCHANGE_RATE').Value) +')' + #13+
          '    AND data0015.rkey = ' + cdsMain.FieldByName('WAREHOUSE_POINTER').AsString + #13+
          '    AND data0077.purchase_type =  ' + QuotedStr(cdsMain.FieldByName('PURCHASE_TYPE').AsString) + #13+
          '  ORDER BY Data0015.ABBR_NAME,data0077.seq_no ';
    LSql2:= 'SELECT * FROM data0014 WHERE 1=0';
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql,LSql2]),[LCds,cds14]) then Exit;
    if not LCds.IsEmpty then
    begin
      cds14.Append;
      cds14.FieldByName('MESSAGE').Value:= '有一张采购单需要通过您的审批,采购人：'+
                                 cdsMain.FieldByName('employee_name').Value +
                                 '采购编号:' + cdsMain.FieldByName('po_number').Value;
      cds14.FieldByName('whosend').Value:= StrToInt(gVar.rkey73);
      cds14.FieldByName('IDKey').Value:= gFunc.CreateIDKey;
      cds14.Post;

      LSql:= 'SELECT * FROM DATA0078 WHERE po_ptr = ' + cdsMain.FieldByName('rkey').AsString;
      LSql2:= 'SELECT * FROM DATA0314 WHERE 1=0';
      LSql3:=  'SELECT * FROM DATA0078 WHERE 1 = 0';
      if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql,LSql2,LSql3]),[cds78,cds314,cds78_2]) then Exit;
      if not cds78.IsEmpty then
        while not cds78.Eof do cds78.Delete;

      LCds.First;
      while not Lcds.Eof do
      begin
        cds78_2.Append;
        cds78_2.FieldByName('po_ptr').Value:= cdsMain.FieldByName('rkey').AsInteger;
        cds78_2.FieldByName('user_ptr').Value:= LCds.FieldByName('user_ptr').Value;
        cds78_2.FieldByName('ranking').Value:= LCds.RecNo;
        if LCds.RecNo = 1 then cds78_2.FieldByName('auth_flag').Value:= 'Y'
        else  cds78_2.FieldByName('auth_flag').Value:= 'N';
        cds78_2.Post;

        if ASend = True then
        begin
          cds314.Append;
          cds314.FieldByName('emp_ptr').Value:= cds78_2.FieldByName('user_ptr').Value;
          cds314.FieldByName('D14_IDKey').Value:= cds14.FieldByName('IDKey').Value;
          cds314.Post;
        end;
        LCds.Next;
      end;
      Result:= True;
    end;
  finally
    LCds.Free;
  end;

end;

function TfrmMain_Mod29OrderManager.Update362(ARkey,AType:string;AFlag:Integer):Boolean;
var
  LSql,LSql362:string;
  LBudget:string;
  LCds:TClientDataSet;
begin
  Result:= False;
  LBudget:='';
  if AType = 'S' then
  begin
    LSql:= 'SELECT     dbo.Data0068.budget_ptr,dbo.Data0068.v_month   ' + #13 +
           '           , sum(dbo.Data0071.QUAN_ORD * dbo.Data0071.Tax_PRICE * dbo.Data0070.EXCHANGE_RATE) as price   ' + #13 +
           ' FROM         dbo.Data0071 INNER JOIN     ' + #13 +
           '                       dbo.Data0069 ON dbo.Data0071.RKEY69 = dbo.Data0069.RKEY INNER JOIN   ' + #13 +
           '                       dbo.Data0068 ON dbo.Data0069.PURCH_REQ_PTR = dbo.Data0068.RKEY  INNER JOIN  ' + #13 +
           '                       dbo.Data0070 ON dbo.Data0070.RKEY = dbo.Data0071.PO_PTR    ' + #13 +
           ' WHERE dbo.Data0071.PO_PTR = ' + ARkey    + #13 +
           ' GROUP BY dbo.Data0068.budget_ptr,dbo.Data0068.v_month ' ;
  end
  else
  begin
    LSql:='SELECT     dbo.Data0068.budget_ptr,dbo.Data0068.v_month    ' + #13 +
          '        , sum(dbo.Data0072.QUAN_ORD * dbo.Data0072.tax_PRICE * dbo.Data0070.EXCHANGE_RATE) as price   ' + #13 +
          '  FROM         dbo.Data0072 INNER JOIN   ' + #13 +
          '                        dbo.Data0204 ON dbo.Data0072.RKEY204 = dbo.Data0204.RKEY INNER JOIN   ' + #13 +
          '                        dbo.Data0068 ON dbo.Data0204.PURCHASE_REQ_PTR = dbo.Data0068.RKEY INNER JOIN ' + #13 +
          '                        dbo.Data0070 ON dbo.Data0070.RKEY = dbo.Data0072.POPTR    ' + #13 +
          '  WHERE dbo.Data0072.POPTR = ' + ARkey    + #13 +
          '  GROUP BY dbo.Data0068.budget_ptr,dbo.Data0068.v_month ';
  end;
  LCds:= TClientDataSet.Create(Self);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    if not LCds.IsEmpty then
    begin
      LCds.First;
      while not LCds.Eof do
      begin
        if Pos(Trim(LCds.FieldByName('budget_ptr').AsString),LBudget) = 0 then
          LBudget:= LBudget + Trim(LCds.FieldByName('budget_ptr').AsString);
        LCds.Next;
      end;
      LSql362:= ' SELECT * FROM DATA0362 WHERE rkey in (' + LBudget + ')';
      if not gSvrIntf.IntfGetDataBySql(LSql362,cds362) then Exit;
      LCds.First;
      while not LCds.Eof do
      begin
        if cds362.Locate('rkey',LCds.FieldByName('budget_ptr').Value,[]) then
        begin
          cds362.Edit;
          if AFlag = 1 then     //AFlag 表示是增加预算还是减少，1表示增加  2表示减少
            cds362.FieldByName('USED_PERIOD_' + LCds.FieldByName('v_month').AsString).Value:=
                    cds362.FieldByName('USED_PERIOD_' + LCds.FieldByName('v_month').AsString).Value
                    + LCds.FieldByName('price').Value
          else
            cds362.FieldByName('USED_PERIOD_' + LCds.FieldByName('v_month').AsString).Value:=
                    cds362.FieldByName('USED_PERIOD_' + LCds.FieldByName('v_month').AsString).Value
                    - LCds.FieldByName('price').Value ;
          cds362.Post;
        end;
        LCds.Next;
      end;
    end;
    Result:= True;
  finally
    LCds.Free;
  end;

end;

//procedure TfrmMain_Mod29.LoadCbb(ASql:string;ACbb:TComboBox);
//var
//  LCds:TClientDataSet;
//begin
//  LCds:= TClientDataSet.Create(nil);
//  try
//    if gSvrIntf.IntfGetDataBySql(ASql,LCds) then
//    begin
//      LCds.First;
//      while not LCds.Eof do
//      begin
//        ACbb.Items.AddObject(LCds.Fields[1].AsString,Pointer(LCds.Fields[0].AsInteger));
//        LCds.Next;
//      end;
//    end;
//  finally
//    LCds.Free;
//  end;
//end;

//procedure TfrmMain_Mod29.rkyCodeButtonClick(Sender: TObject);
//var
//  LFrm:TfrmSinglePickList;
//begin
////  inherited;
//  LFrm:= TfrmSinglePickList.Create(Self);
//  try
//    LFrm.InitWithPickID(29,1);
//    if LFrm.ShowModal = mrOK then
//    begin
////      rkyCode.Tag:= LFrm.cdsPick.FieldByName('rkey').AsInteger;
//////      ShowMessage(LFrm.cdsPick.FieldByName('CODE').AsString);
////      rkyCode.Text:= LFrm.cdsPick.FieldByName('CODE').AsString;
////      rkyCode.DisplayNoteLabel.Caption:=LFrm.cdsPick.FieldByName('SUPPLIER_NAME').AsString;
////      rkyCode.DisplayNoteLabel.Visible:=True;
//    end;
//  finally
//    LFrm.Free;
//  end;
//end;

end.

