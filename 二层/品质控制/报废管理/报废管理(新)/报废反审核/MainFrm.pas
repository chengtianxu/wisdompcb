unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DM, DB, DBGridEh, ADODB,
  Menus;

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
    pmZD: TPopupMenu;
    mniZD: TMenuItem;
    pm1: TPopupMenu;
    mniViewInfo: TMenuItem;
    mniN7: TMenuItem;
    mniTY: TMenuItem;
    mniNTY: TMenuItem;
    mniN3: TMenuItem;
    mniN4: TMenuItem;
    mniN5: TMenuItem;
    rgStatus: TRadioGroup;
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
    procedure pm1Popup(Sender: TObject);
    procedure btnFieldsClick(Sender: TObject);
    procedure mniZDClick(Sender: TObject);
    procedure mniViewInfoClick(Sender: TObject);
    procedure mniTYClick(Sender: TObject);
    procedure mniNTYClick(Sender: TObject);
  private
    { Private declarations }
    FHotColumn: TColumnEh;
    FFrmMainSql,FWhere, FStatus: string;
    procedure FillZD;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  WZ_gUnit, gFilterFrm, DateUtils, Pick_Item_Single, ViewInfoFrm, ReturnNoteFrm,
  gBFUnit;

{$R *.dfm}

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
begin
  dm1.adsFrmMain.Close;
  case rgStatus.ItemIndex of
    0:
    begin
      FStatus := ' AND (D549.Status=1 OR D549.Status=2)';
    end;
    1:
    begin
      FStatus := ' AND (D549.Status=0)';
    end;
    2:
    begin
      FStatus := ' AND (D549.Status=-1 OR D549.Status=-2)';
    end;
    3:
    begin
      FStatus := '';
    end;
  else
    FStatus := '';
  end;   
  dm1.adsFrmMain.CommandText := FFrmMainSql + FWhere + FStatus + ' ORDER BY D549.SQTime DESC ';
  dm1.adsFrmMain.Open;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  mniTY.Visible := StrToInt(gUser.User_Permit) >= 2 ;
  mniNTY.Visible := StrToInt(gUser.User_Permit) >= 2;

  FillZD;
  FWhere := ' WHERE D549.SQTIME >= ' + QuotedStr(gDateTimeToStr(StartOfTheMonth(Now))) +
            ' AND D549.SQTIME <= ' + QuotedStr(gDateTimeToStr(IncDay(Now,1))) + ' AND D549.TTYPE = 0 ';

  btnRefreshClick(btnRefresh);
  ehFrmMainTitleClick(ehFrmMain.Columns[0]);
  gBFUnit.gCon := DM1.con1;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FFrmMainSql := dm1.adsFrmMain.CommandText + ' ';
end;

procedure TfrmMain.ehFrmMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Column.Field.DataSet.FieldByName('Status').AsString = '已审核') then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color := clMoneyGreen;
    TDBGridEh(Sender).Canvas.FillRect(Rect);
    TDBGridEh(Sender).Canvas.TextOut(Rect.Left+2,Rect.Top+1,Column.Field.AsString);
  end else
  if (Column.Field.DataSet.FieldByName('Status').AsString = '退回，审核未通过')
  then
  begin
    TDBGridEh(Sender).Canvas.Brush.Color := clSilver;
    TDBGridEh(Sender).Canvas.FillRect(Rect);
    TDBGridEh(Sender).Canvas.TextOut(Rect.Left+2,Rect.Top+1,Column.Field.AsString);
  end;
end;

procedure TfrmMain.btnExprotToExcelClick(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(ehFrmMain,'报废反审核');
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
  I: Integer;
begin
  frmFilter.InitFrm([
  ehFrmMain.Columns[0],
  ehFrmMain.Columns[1],
  ehFrmMain.Columns[3]
  ]);
  if frmFilter.ShowModal = mrOK then
  begin
    FWhere := ' WHERE D549.SQTIME >= ' + QuotedStr(gDateTimeToStr(DateOf(frmFilter.dtp1.Date) + TimeOf(frmFilter.dtp2.Time))) +
              ' AND D549.SQTIME <= ' + QuotedStr(gDateTimeToStr(DateOf(frmFilter.dtp3.Date) + TimeOf(frmFilter.dtp4.Time))) + ' AND D549.TTYPE = 0 ';

    for I := 0 to frmFilter.lvRet.Items.Count - 1 do
    begin
      FWhere := FWhere + ' AND ' + frmFilter.lvRet.Items[I].SubItems[1] + frmFilter.lvRet.Items[I].SubItems[0];
    end;
    btnRefreshClick(btnRefresh);
  end;
end;

procedure TfrmMain.pm1Popup(Sender: TObject);
begin
  mniViewInfo.Enabled := dm1.adsFrmMain.RecNo <> -1;;
  mniTY.Enabled := dm1.adsFrmMain.RecNo <> -1;
  mniNTY.Enabled := dm1.adsFrmMain.RecNo <> -1;
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

procedure TfrmMain.mniViewInfoClick(Sender: TObject);
var
  LQry: TADOQuery;
  LFrm: TfrmViewInfo;
begin
  LQry := TADOQuery.Create(Self);
  try
    LQry.Connection := DM1.con1;
    LQry.SQL.Clear;
    LQry.SQL.Add('SELECT D549.MRB_NO, D06.WORK_ORDER_NUMBER,D34SQ.DEPT_CODE SQDEPTCODE,D34SQ.DEPT_NAME SQDEPTNAME, ');
    LQry.SQL.Add(' D34FS.DEPT_CODE FSDEPTCODE, D34FS.DEPT_NAME FSDEPTNAME,D549.QTY_REJECT,');
    LQry.SQL.Add(' D39.REJ_CODE,D39.REJECT_DESCRIPTION,D549.PANELS,D05_SR.EMPLOYEE_NAME,');
    LQry.SQL.Add(' D549.TDATETIME,D15.abbr_name, ');
    LQry.SQL.Add(' CASE D39.REJ_TYPE WHEN 0 THEN ''工厂报废'' WHEN 1 THEN ''供应商报废'' WHEN 2 THEN ''客户报废'' ');
    LQry.SQL.Add(' WHEN 3 THEN ''市场报废'' WHEN 4 THEN ''其他'' END AS REJ_TYPE ');
    LQry.SQL.Add(' FROM Data0549 D549 ');
    LQry.SQL.Add(' INNER JOIN Data0006 D06 ON D549.WO_PTR = D06.RKey ');
    LQry.SQL.Add(' INNER JOIN Data0034 D34SQ ON D34SQ.RKey = D549.DEPT_PTR ');
    LQry.SQL.Add(' INNER JOIN Data0034 D34FS ON D34FS.RKey = D549.RESP_DEPT_PTR ');
    LQry.SQL.Add(' INNER JOIN Data0039 D39 ON D39.RKey = D549.REJECT_PTR ');
    LQry.SQL.Add(' INNER JOIN Data0005 D05_SR ON D549.EMPL_PTR = D05_SR.RKey ');
    LQry.SQL.Add(' INNER JOIN Data0015 D15 ON D549.warehouse_ptr = D15.RKey ');
    LQry.SQL.Add(' WHERE D549.RKey = ' + DM1.adsFrmMain.FieldByName('RKey549').AsString);
    LQry.Open;
    LFrm := TfrmViewInfo.Create(Self);
    try
      LFrm.sg1.ColWidths[0] := 100;
      LFrm.sg1.ColWidths[1] := 230;
      with LFrm.sg1 do
      begin
        RowCount := 12;
        Cells[1,0] := LQry.FieldByName('WORK_ORDER_NUMBER').AsString;
        Cells[0,0] := '作业单号';

        Cells[1,1] := LQry.FieldByName('SQDEPTCODE').AsString;
        Cells[0,1] := '报废申请工序代码';

        Cells[1,2] := LQry.FieldByName('SQDEPTNAME').AsString;
        Cells[0,2] := '报废申请工序名';

        Cells[1,3] := LQry.FieldByName('FSDEPTCODE').AsString;
        Cells[0,3] := '责任部门代码';

        Cells[1,4] := LQry.FieldByName('FSDEPTNAME').AsString;
        Cells[0,4] := '责任部门名';

        Cells[1,5] := LQry.FieldByName('QTY_REJECT').AsString;
        Cells[0,5] := '报废PCS数';

        Cells[1,6] := LQry.FieldByName('PANELS').AsString;
        Cells[0,6] := '报废PNL数';

        Cells[1,7] := LQry.FieldByName('REJ_CODE').AsString;
        Cells[0,7] := '缺陷代码';

        Cells[1,8] := LQry.FieldByName('REJECT_DESCRIPTION').AsString;
        Cells[0,8] := '缺陷描述';

        Cells[1,9] := LQry.FieldByName('REJ_TYPE').AsString;
        Cells[0,9] := '缺陷类型';

        Cells[1,10] := LQry.FieldByName('EMPLOYEE_NAME').AsString;
        Cells[0,10] := '报废输入员';

        Cells[1,11] := LQry.FieldByName('TDATETIME').AsString;
        Cells[0,11] := '报废日期';

        Cells[1,12] := LQry.FieldByName('abbr_name').AsString;
        Cells[0,12] := '报废工厂';
      end;
      LFrm.ShowModal;
    finally
      LFrm.Free;
    end;
  finally
    LQry.Close;
    LQry.Free;
  end;
end;

procedure TfrmMain.mniTYClick(Sender: TObject);
begin
  if DM1.SqlOpen('SELECT Status FROM Data0549 WHERE RKey=' + DM1.adsFrmMain.FieldByName('RKey549').AsString) then
  begin
    if (DM1.qrytmp.FieldByName('Status').AsInteger <> 0) then
    begin
      ShowMessage('审核失败！申请状态只能为待审才可以通过');
      Exit;
    end;
  end;

  //
  if InPD then
  begin
    ShowMessage('盘点中禁止操作');
    Exit;
  end;
  //
  if IsKuaYue(DM1.adsFrmMain.FieldByName('RKey58').AsString) then
  begin
    ShowMessage('财务已经结算跨月，禁止操作');
    Exit;
  end;
  //
  if IsWaiFa(DM1.adsFrmMain.fieldbyname('rkey06').AsString) then
  begin
    ShowMessage('外发中禁止操作');
    Exit;
  end; 

  if UnDoBF(dm1.adsFrmMain.fieldbyname('RKey58').AsString, dm1.adsFrmMain.fieldbyname('rkey549').AsString) then
  begin
    ShowMessage('反审核成功');
    dm1.adsFrmMain.Requery();
  end
  else
    ShowMessage('反审核失败');  
end;

procedure TfrmMain.mniNTYClick(Sender: TObject);
var
  tmpS,s: string;
begin
  if DM1.SqlOpen('SELECT Status FROM Data0549 WHERE RKey=' + DM1.adsFrmMain.FieldByName('RKey549').AsString) then
  begin
    if (DM1.qrytmp.FieldByName('Status').AsInteger <> 0) then
    begin
      ShowMessage('退回失败！申请状态只能为待审才可以退回');
      Exit;
    end;  
  end;
  if ShowReturnNoteFrm(Self, s) then
  begin
    tmpS := 'UPDATE Data0549 SET Status = -1, SH_D05_PTR =' + gUser.User_Ptr + 
        ',SHTime= getdate(), SHNote=' + QuotedStr(S) +
        ' WHERE RKey=' + DM1.adsFrmMain.FieldByName('RKey549').AsString +
        ' AND (Status = 0 OR Status = -1)';
    if DM1.SqlExec(tmpS) then
    begin
      DM1.adsFrmMain.Requery();
    end else
      ShowMessage('退回失败!');
  end;  
end;

end.
