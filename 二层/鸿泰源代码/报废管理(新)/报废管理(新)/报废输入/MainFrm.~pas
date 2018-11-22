unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DM, DB, DBGridEh, ADODB,
  Menus, gBFUnit;

type
  TfrmMain = class(TForm)
    pnl2: TPanel;
    pnl1: TPanel;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExprotToExcel: TBitBtn;
    btnSearch: TBitBtn;
    btnFields: TBitBtn;
    edtFilter: TLabeledEdit;
    ds1: TDataSource;
    ehFrmMain: TDBGridEh;
    pm1: TPopupMenu;
    mniNew: TMenuItem;
    mniChangeQXDM: TMenuItem;
    mniChangeGCDM: TMenuItem;
    mniFSH: TMenuItem;
    mniView: TMenuItem;
    pmZD: TPopupMenu;
    mniZD: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ehFrmMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure btnExprotToExcelClick(Sender: TObject);
    procedure ehFrmMainTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure edtFilterKeyPress(Sender: TObject; var Key: Char);
    procedure btnSearchClick(Sender: TObject);
    procedure mniNewClick(Sender: TObject);
    procedure mniChangeQXDMClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure mniChangeGCDMClick(Sender: TObject);
    procedure mniFSHClick(Sender: TObject);
    procedure mniViewClick(Sender: TObject);
    procedure btnFieldsClick(Sender: TObject);
    procedure mniZDClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    FHotColumn: TColumnEh;
    FFrmMainSql,FWhere: string;
    procedure FillZD;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  WZ_gUnit, gFilterFrm, DateUtils, NewFrm, Pick_Item_Single, FSHReqFrm;

{$R *.dfm}

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
begin
  dm1.adsFrmMain.Close;
  dm1.adsFrmMain.CommandText := FFrmMainSql + FWhere + ' AND D58.TTYPE = 0 ORDER BY D58.TDATETIME DESC ';
  dm1.adsFrmMain.Open;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  mniNew.Visible := (gUser.User_Permit ='2') or (gUser.User_Permit ='4');
  mniChangeQXDM.Visible := (gUser.User_Permit = '2') or (gUser.User_Permit = '4');
  //mniChangeGCDM.Visible := (gUser.User_Permit ='2') or (gUser.User_Permit ='4');
  mniFSH.Visible := (gUser.User_Permit = '2') or (gUser.User_Permit = '4');

  FillZD;
  FWhere := ' WHERE D58.TDATETIME >=getdate() AND D58.TDATETIME <= dateadd(day,1,getdate()) ';
  btnRefreshClick(btnRefresh);

  ehFrmMainTitleClick(ehFrmMain.Columns[0]);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FFrmMainSql := dm1.adsFrmMain.CommandText + ' ';
  gCon := dm1.con1;
end;

procedure TfrmMain.ehFrmMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (not Column.Field.DataSet.FieldByName('D549Status').IsNull) then
  begin
    if Column.Field.DataSet.FieldByName('D549Status').AsInteger = 0 then
      TDBGridEh(Sender).Canvas.Brush.Color := clSilver
    else
    if Column.Field.DataSet.FieldByName('D549Status').AsInteger < 0 then
      TDBGridEh(Sender).Canvas.Brush.Color := clRed;
    TDBGridEh(Sender).Canvas.FillRect(Rect);
    TDBGridEh(Sender).Canvas.TextOut(Rect.Left+2,Rect.Top+1,Column.Field.AsString);
  end;
end;

procedure TfrmMain.btnExprotToExcelClick(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(ehFrmMain,'报废管理');
end;

procedure TfrmMain.ehFrmMainTitleClick(Column: TColumnEh);
begin
  FHotColumn := Column;
  edtFilter.EditLabel.Caption := FHotColumn.Title.Caption;

if (Column.Title.SortMarker = smNoneEh) or (Column.Title.SortMarker = smDownEh) then
begin
  TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
  Column.Title.SortMarker := smUpEh;
end
else
if Column.Title.SortMarker = smUpEh then
begin
  TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' DESC';
  Column.Title.SortMarker := smDownEh;
end ;

end;

procedure TfrmMain.edtFilterChange(Sender: TObject);
var
  tmpstr,sFilter:string;
  DATASET:TCustomADoDATASET;
begin
  DATASET := TCustomAdoDataSet(ehFrmMain.DataSource.DataSet);
  if not DATASET.Active then Exit;
  tmpstr:= trim(edtFilter.Text);
  if TmpStr='' then
  begin
    DATASET.Filtered:= False;
  end else
  begin
    if (FHotColumn.Field.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '*'+uppercase(TmpStr)+'*';
      DATASET.Filter := FHotColumn.Field.FieldName+' Like '+ QuotedStr(sFilter);
      DATASET.Filtered:= true;
    end else
    if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      try
        StrToFloat(tmpstr);
      except
        DATASET.Filtered := False;
        Exit;
      end;
      sFilter := FHotColumn.Field.FieldName+'>='+TmpStr;
      DATASET.Filter := sFilter;
      DATASET.Filtered:= true;
    end else
    if FHotColumn.Field.DataType in [ftDate, ftDateTime] then
    begin
      try
        tmpstr := FormatDateTime('YYYY-MM-DD hh:mm:ss',StrToDateTime(TmpStr));
      except
        Exit;
      end;
      sFilter := '>='+QuotedStr(TmpStr);
      DATASET.Filter := FHotColumn.Field.FieldName + sFilter;
      DATASET.Filtered:= true;
    end;
  end;
end;

procedure TfrmMain.edtFilterKeyPress(Sender: TObject; var Key: Char);
begin
  if FHotColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftLargeint] then
  begin
    if (length((Sender as TLabeledEdit).Text)=20) and (key<>chr(8)) then Abort;
    if Key='.' then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TLabeledEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TLabeledEdit).text)>0 then
      if (key='-') then abort;
  end else
  if  FHotColumn.Field.DataType in [ftFloat, ftCurrency, ftBCD] then
  begin
    if (length((Sender as TLabeledEdit).Text)=20) and (key<>chr(8)) then Abort;
    if (pos('.',(Sender as TLabeledEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TLabeledEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TLabeledEdit).text)>0 then
      if (key='-') then abort;
  end ;
end;

procedure TfrmMain.btnSearchClick(Sender: TObject);
var
  LFrm: TfrmFilter;
  I: Integer;
begin
  LFrm := TfrmFilter.Create(Self);
  try
    LFrm.InitFrm([
    ehFrmMain.Columns[0],
    ehFrmMain.Columns[1],
    ehFrmMain.Columns[3],
    ehFrmMain.Columns[8],
    ehFrmMain.Columns[10],
    ehFrmMain.Columns[13],
    ehFrmMain.Columns[18],
    ehFrmMain.Columns[19]
    ]);
    if LFrm.ShowModal = mrOK then
    begin
      FWhere := 'WHERE D58.TDATETIME BETWEEN ' + QuotedStr(gDateTimeToStr(DateOf(LFrm.dtp1.Date) + TimeOf(LFrm.dtp2.Time)))
          + ' AND ' + QuotedStr(gDateTimeToStr(DateOf(LFrm.dtp3.Date) + TimeOf(LFrm.dtp4.Time)));
      for I := 0 to LFrm.lvRet.Items.Count - 1 do
      begin
        FWhere := FWhere + ' AND ' + LFrm.lvRet.Items[I].SubItems[1] + LFrm.lvRet.Items[I].SubItems[0];
      end;
      btnRefreshClick(btnRefresh);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.mniNewClick(Sender: TObject);
var
  LFrm: TfrmNew;
  LUser15Ptr: string;
begin
  if InPD then
  begin
    ShowMessage('盘点中禁止操作');
    Exit;
  end;
  LFrm := TfrmNew.Create(Self);
  LFrm.FType06 := (Sender as TMenuItem).Tag;           //add by zsp 2017-04-01


  //如果用户绑定工厂则
  LUser15Ptr := GetUser15Ptr(gUser.User_Longin_Ptr);
  if LUser15Ptr <> '' then
  begin
    dm1.QryTmpOpen('SELECT RKey,ABBR_NAME FROM Data0015 WHERE RKey = ' + LUser15Ptr);
    LFrm.cbxBFGC.Items.AddObject(dm1.qrytmp.FieldByName('ABBR_NAME').AsString,
        TOBJECT(dm1.qrytmp.FieldByName('RKey').AsInteger));
    LFrm.cbxBFGC.Enabled := False;
  end else
  begin
    //添加工厂
    dm1.qrytmp.Close;
    dm1.qrytmp.SQL.Clear;
    dm1.qrytmp.SQL.Add('SELECT * FROM Data0015');
    dm1.qrytmp.Open;
    while not dm1.qrytmp.Eof do
    begin
      LFrm.cbxBFGC.Items.AddObject(dm1.qrytmp.FieldByName('ABBR_NAME').AsString,
          TOBJECT(dm1.qrytmp.FieldByName('RKey').AsInteger));
      dm1.qrytmp.Next;
    end;
  end;
  if LFrm.cbxBFGC.Items.Count > 0 then LFrm.cbxBFGC.ItemIndex := 0;
  //
  LFrm.InitFrm;
  try
    LFrm.ShowModal;
    btnRefreshClick(btnRefresh);
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.mniChangeQXDMClick(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LInPut: PDlgInput;
begin

  if InFSHLock(dm1.adsFrmMain.fieldbyname('rkey58').AsString) then
  begin
    ShowMessage('反审核锁定中禁止操作');
    Exit;
  end;

  LFrm := TfrmPick_Item_Single.Create(Self);
  LInPut.AdoConn := dm1.con1;
  try
    LInPut.KeyField := 'RKEY';
    LInPut.Fields := 'REJ_CODE/缺陷代码/100,REJECT_DESCRIPTION/缺陷名称/150,rej_type/报废类别/150';
    LInPut.Sqlstr := 'SELECT RKEY, REJ_CODE, REJECT_DESCRIPTION,'+
                  'case rej_type when 0 then ''工厂报废'' '+
                  'when 1 then ''供应商报废'' '+
                  'when 2 then ''客户报废'' '+
                  'when 3 then ''市场报废'' '+
                  'when 4 then ''其它'' '+
                  'end as rej_type FROM Data0039';
    LFrm.InitForm_New(LInPut);
    if LFrm.ShowModal = MrOK then
    begin
      if MessageBox(Handle,PChar('是否修改缺陷代码为  ' + LFrm.adsPick1.fieldbyname('REJECT_DESCRIPTION').asstring),'修改缺陷代码',MB_YESNO) = IDYES then
      begin
        dm1.qrytmp.Close;
        dm1.qrytmp.SQL.Clear;
        dm1.qrytmp.SQL.Add('UPDATE Data0058 SET REJECT_PTR = ' + LFrm.adsPick1.fieldbyname('RKEY').AsString + ' WHERE RKey=');
        dm1.qrytmp.SQL.Add(dm1.adsFrmMain.fieldbyname('RKey58').AsString);
        dm1.qrytmp.ExecSQL;
        dm1.adsFrmMain.Requery();
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.pm1Popup(Sender: TObject);
begin
  mniChangeQXDM.Enabled := dm1.adsFrmMain.RecNo <> -1;
  mniChangeGCDM.Enabled := dm1.adsFrmMain.RecNo <> -1;
  mniFSH.Enabled := dm1.adsFrmMain.RecNo <> -1;
  mniView.Enabled := dm1.adsFrmMain.RecNo <> -1;
  N2.Enabled:=DM1.adsFrmMain.RecNo<>-1;                                                
end;

procedure TfrmMain.mniChangeGCDMClick(Sender: TObject);
begin
  if InFSHLock(dm1.adsFrmMain.fieldbyname('rkey58').AsString) then
  begin
    ShowMessage('反审核锁定中禁止操作');
    Exit;
  end;
  //
  if InPD then
  begin
    ShowMessage('盘点中禁止操作');
    Exit;
  end;
  //
  if IsKuaYue(dm1.adsFrmMain.fieldbyname('rkey58').AsString) then
  begin
    ShowMessage('财务已经结算跨月，禁止操作');
    Exit;
  end;
  //
  if IsWaiFa(dm1.adsFrmMain.fieldbyname('RKey06').AsString) then
  begin
    ShowMessage('外发中禁止操作');
    Exit;
  end;
end;

procedure TfrmMain.mniFSHClick(Sender: TObject);
var
  LFrm: TfrmFSHReq1;
begin
  if InFSHLock(dm1.adsFrmMain.fieldbyname('rkey58').AsString) then
  begin
    ShowMessage('反审核锁定中禁止操作');
    Exit;
  end;
  //
  if InPD then
  begin
    ShowMessage('盘点中禁止操作');
    Exit;
  end;
  //
  if IsKuaYue(dm1.adsFrmMain.fieldbyname('RKey58').AsString) then
  begin
    ShowMessage('财务已经结算跨月，禁止操作');
    Exit;
  end;
  //
  if IsWaiFa(dm1.adsFrmMain.fieldbyname('RKey06').AsString) then
  begin
    ShowMessage('外发中禁止操作');
    Exit;
  end;

  if IsGuoShu(dm1.adsFrmMain.fieldbyname('RKey06').AsString,dm1.adsFrmMain.FieldByName('STEPNOW').AsInteger) then
  begin
    LFrm := TfrmFSHReq1.Create(Self);
    try
      LFrm.InitFrm;
      if LFrm.ShowModal = mrOK then
        dm1.adsFrmMain.Requery();    
    finally
      LFrm.Free;
    end;
  end else
  begin
    if UnDoBF(dm1.adsFrmMain.fieldbyname('RKey58').AsString) then
    begin
      ShowMessage('反审核成功');
      dm1.adsFrmMain.Requery();
    end
    else
      ShowMessage('反审核失败');
  end;
end;

procedure TfrmMain.mniViewClick(Sender: TObject);
var
  LFrm: TfrmNew;
begin
  LFrm := TfrmNew.Create(Self);
  try
    LFrm.ShowBFInfo(dm1.adsFrmMain.fieldbyname('RKey58').AsString);
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.btnFieldsClick(Sender: TObject);
begin
  pmZD.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmMain.mniZDClick(Sender: TObject);
var
  LItem: TMenuItem;
begin
  LItem := (Sender as TMenuItem);
  LItem.Checked := not LItem.Checked;
  ehFrmMain.Columns[LItem.Tag].Visible := LItem.Checked;
end;

procedure TfrmMain.FillZD;
var
  LCum: TColumnEh;
  LItem: TMenuItem;
  I: Integer;
begin
  pmZD.Items.Clear;
  for I := 0 to ehFrmMain.Columns.Count - 1 do
  begin
    LCum := ehFrmMain.Columns[I];
    if LCum.Visible then
    begin
      LCum.Title.TitleButton := True;
      LItem := TMenuItem.Create(pmZD);
      LItem.Caption := LCum.Title.Caption;
      LItem.Checked := LCum.Visible;
      LItem.OnClick := mniZDClick;
      LItem.Tag := LCum.Index;
      pmZD.Items.Add(LItem);
    end;
  end;
end;

procedure TfrmMain.N2Click(Sender: TObject);
var
  DFrm: TfrmPick_Item_Single;
  DInPut: PDlgInput;
begin

  if InFSHLock(dm1.adsFrmMain.fieldbyname('rkey58').AsString) then
  begin
    ShowMessage('反审核锁定中禁止操作');
    Exit;
  end;

  DFrm := TfrmPick_Item_Single.Create(Self);
  DInPut.AdoConn := dm1.con1;
  try
    DInPut.KeyField := 'RKEY';
    DInPut.Fields := 'DEPT_CODE/工序代码/150,DEPT_NAME/部门名称/250';
    DInPut.Sqlstr := 'SELECT RKEY,DEPT_CODE,DEPT_NAME '+
                     'FROM Data0034   where TTYPE in(1,4) ';
    DFrm.InitForm_New(DInPut);
    if DFrm.ShowModal = MrOK then
    begin
      if MessageBox(Handle,PChar('是否修改责任工序代码为  ' + DFrm.adsPick1.fieldbyname('DEPT_CODE').asstring),'修改责任工序代码',MB_YESNO) = IDYES then
      begin
        dm1.qrytmp.Close;
        dm1.qrytmp.SQL.Clear;
        dm1.qrytmp.SQL.Add('UPDATE Data0058 SET RESP_DEPT_PTR = ' + DFrm.adsPick1.fieldbyname('RKEY').AsString + ' WHERE RKey=');
        dm1.qrytmp.SQL.Add(dm1.adsFrmMain.fieldbyname('RKey58').AsString);
        dm1.qrytmp.ExecSQL;
        dm1.adsFrmMain.Requery();
      end;
    end;
  finally
    DFrm.Free;
  end;

end;

end.
