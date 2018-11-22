//工程等级设计，CTX
unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, DMFrm, Menus, EditFrm;

type
  TfrmMain = class(TForm)
    pnl1: TPanel;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExprotToExcel: TBitBtn;
    btnSearch: TBitBtn;
    btnFields: TBitBtn;
    edtFilter: TLabeledEdit;
    ehMaster: TDBGridEh;
    spl1: TSplitter;
    ehdetail: TDBGridEh;
    pmZD: TPopupMenu;
    mniZD: TMenuItem;
    pmEdit: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExprotToExcelClick(Sender: TObject);
    procedure btnFieldsClick(Sender: TObject);
    procedure edtFilterKeyPress(Sender: TObject; var Key: Char);
    procedure edtFilterChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ehMasterTitleClick(Column: TColumnEh);
    procedure pmEditPopup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
    FHotColumn: TColumnEh;
    procedure mniZDClick(Sender: TObject);
    function AddNewRecord(LFrm: TfrmEdit; Add82: Boolean = True): Boolean;
  public
    { Public declarations }
    procedure FillZD;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  WZ_gUnit, DB, ADODB;

{$R *.dfm}

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
begin
  DM1.adsMaster.Close;
  DM1.adsMaster.Open;
end;

procedure TfrmMain.btnExprotToExcelClick(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(ehdetail,Application.MainForm.Caption);
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
  ehMaster.Columns[LItem.Tag].Visible := LItem.Checked;
end;

procedure TfrmMain.FillZD;
var
  LCum: TColumnEh;
  LItem: TMenuItem;
  I: Integer;
begin
  pmZD.Items.Clear;
  for I := 0 to ehMaster.Columns.Count - 1 do
  begin
    LCum := ehMaster.Columns[I];
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

procedure TfrmMain.edtFilterChange(Sender: TObject);
var
  tmpstr,sFilter:string;
  DATASET:TCustomADoDATASET;
begin
  DATASET := TCustomAdoDataSet(ehMaster.DataSource.DataSet);
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

procedure TfrmMain.FormShow(Sender: TObject);
begin
  FillZD;
  btnRefreshClick(btnRefresh);
  ehMasterTitleClick(ehMaster.Columns[0]);
  if (gUser.User_Permit <> '2') and (gUser.User_Permit <> '4') then
  begin
    N1.Visible := False;
    N2.Visible := False;
    N4.Visible := False;
  end;

end;

procedure TfrmMain.ehMasterTitleClick(Column: TColumnEh);
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

procedure TfrmMain.pmEditPopup(Sender: TObject);
begin
  N2.Enabled := not DM1.adsMaster.IsEmpty;
  N3.Enabled := N2.Enabled;
  N4.Enabled := N4.Enabled;
end;

procedure TfrmMain.N1Click(Sender: TObject);
var
  LFrm: TfrmEdit;
begin
  LFrm := TfrmEdit.Create(Self);
  try
    LFrm.ads1.Parameters[0].Value := ' ';
    LFrm.ads1.Open;
    LFrm.cds1.Data := LFrm.dtstprvdr1.Data;

    LFrm.ads2.Parameters[0].Value := ' ';
    LFrm.ads2.Open;
    LFrm.cds2.Data := lfrm.dtstprvdr2.Data;

    if LFrm.ShowModal = mrok then
    begin
      if not DM1.con1.InTransaction then DM1.con1.BeginTrans;
      try
        if AddNewRecord(LFrm) then
        begin
          DM1.con1.CommitTrans;
          btnRefreshClick(btnRefresh);
        end else
        begin
          DM1.con1.RollbackTrans;
          ShowMessage('新增失败');
        end;
      finally
        if DM1.con1.InTransaction then dm1.con1.RollbackTrans;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.N2Click(Sender: TObject);
var
  LFrm: TfrmEdit;
begin
  LFrm := TfrmEdit.Create(Self);
  try
    LFrm.ads1.Parameters[0].Value := DM1.adsMaster.fieldbyname('grade_code').AsString;
    LFrm.ads1.Open;
    LFrm.cds1.Data := LFrm.dtstprvdr1.Data;

    LFrm.ads2.Parameters[0].Value := DM1.adsMaster.fieldbyname('grade_code').AsString;
    LFrm.ads2.Open;
    LFrm.cds2.Data := lfrm.dtstprvdr2.Data;

    LFrm.edtGradeCode.Text := DM1.adsMaster.fieldbyname('grade_code').AsString;
    LFrm.edtGrade_Name.Text := DM1.adsMaster.fieldbyname('grade_name').AsString;
    LFrm.edtGrade_Note.Text := DM1.adsMaster.fieldbyname('grade_remark').AsString;

    LFrm.edtGradeCode.Enabled := False;
        
    if LFrm.ShowModal = mrok then
    begin
      if not DM1.con1.InTransaction then DM1.con1.BeginTrans;
      try

        DM1.qrytmp.Close;
        DM1.qrytmp.SQL.Clear;
        DM1.qrytmp.SQL.Add('update data0082 set grade_name = '+ QuotedStr(LFrm.edtGrade_Name.Text) + ',grade_remark = '+ QuotedStr(LFrm.edtGrade_Note.Text) +' where grade_code = ' + QuotedStr(dm1.adsMaster.fieldbyname('grade_code').AsString));
        DM1.qrytmp.ExecSQL;

        DM1.qrytmp.Close;
        DM1.qrytmp.SQL.Clear;
        DM1.qrytmp.SQL.Add('delete from data0084 where grade_code = ' + QuotedStr(dm1.adsMaster.fieldbyname('grade_code').AsString));
        DM1.qrytmp.ExecSQL;

        DM1.qrytmp.Close;
        DM1.qrytmp.SQL.Clear;
        DM1.qrytmp.SQL.Add('delete from data0083 where grade_code = ' + QuotedStr(dm1.adsMaster.fieldbyname('grade_code').AsString));
        DM1.qrytmp.ExecSQL;


              
        if AddNewRecord(LFrm, False) then
        begin
          DM1.con1.CommitTrans;
          btnRefreshClick(btnRefresh);
        end else
        begin
          DM1.con1.RollbackTrans;
          ShowMessage('编辑失败');
        end;
      finally
        if DM1.con1.InTransaction then dm1.con1.RollbackTrans;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.N3Click(Sender: TObject);
var
  LFrm: TfrmEdit;
begin
  LFrm := TfrmEdit.Create(Self);
  try
    LFrm.ads1.Parameters[0].Value := DM1.adsMaster.fieldbyname('grade_code').AsString;
    LFrm.ads1.Open;
    LFrm.cds1.Data := LFrm.dtstprvdr1.Data;

    LFrm.ads2.Parameters[0].Value := DM1.adsMaster.fieldbyname('grade_code').AsString;
    LFrm.ads2.Open;
    LFrm.cds2.Data := lfrm.dtstprvdr2.Data;

    LFrm.edtGradeCode.Text := DM1.adsMaster.fieldbyname('grade_code').AsString;
    LFrm.edtGrade_Name.Text := DM1.adsMaster.fieldbyname('grade_name').AsString;
    LFrm.edtGrade_Note.Text := DM1.adsMaster.fieldbyname('grade_remark').AsString;

    LFrm.edtGradeCode.Enabled := False;
    LFrm.edtGrade_Name.Enabled := False;
    LFrm.edtGrade_Note.Enabled := False;
    LFrm.eh1.PopupMenu := nil;
    LFrm.eh2.PopupMenu := nil;
    LFrm.btnOK.Enabled := False;
    if LFrm.ShowModal = mrok then
    begin

    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
  if MessageBox(Handle,'确定要删除吗？','注意',MB_YESNO) = IDYES then
  begin
    DM1.qrytmp.Close;
    DM1.qrytmp.SQL.Clear;
    DM1.qrytmp.SQL.Add('delete from data0082 where grade_code = ' + QuotedStr(dm1.adsMaster.fieldbyname('grade_code').AsString));
    DM1.qrytmp.ExecSQL;
    btnRefreshClick(btnRefresh);
  end;
end;

function TfrmMain.AddNewRecord(LFrm: TfrmEdit; Add82: Boolean = True): Boolean;
begin
  try
    if Add82 then
    begin
      //新增82
      DM1.qrytmp.Close;
      dm1.qrytmp.SQL.Clear;
      DM1.qrytmp.SQL.Add('select * from data0082 where 1=0');
      DM1.qrytmp.Open;
      DM1.qrytmp.Append;
      DM1.qrytmp.FieldByName('grade_code').AsString := LFrm.edtGradeCode.Text;
      DM1.qrytmp.FieldByName('grade_name').AsString := LFrm.edtGrade_Name.Text;
      DM1.qrytmp.FieldByName('grade_remark').AsString := LFrm.edtGrade_Note.Text;
      DM1.qrytmp.Post;
    end;
        
    //新增83
    DM1.qrytmp.Close;
    dm1.qrytmp.SQL.Clear;
    DM1.qrytmp.SQL.Add('select * from data0083 where 1=0');
    DM1.qrytmp.Open;
    LFrm.cds1.First;
    while not LFrm.cds1.Eof do
    begin
      DM1.qrytmp.Append;
      DM1.qrytmp.FieldByName('grade_code').AsString := LFrm.edtGradeCode.Text;
      DM1.qrytmp.FieldByName('dept_ptr').AsInteger := LFrm.cds1.fieldbyname('dept_ptr').AsInteger;
      DM1.qrytmp.FieldByName('dept_note').AsString := LFrm.cds1.fieldbyname('dept_note').AsString;
      DM1.qrytmp.Post;
      lfrm.cds1.Next;
    end;

    //新增84
    DM1.qrytmp.Close;
    dm1.qrytmp.SQL.Clear;
    DM1.qrytmp.SQL.Add('select * from data0084 where 1=0');
    DM1.qrytmp.Open;
    LFrm.cds2.First;
    LFrm.cds1.First;
    while not LFrm.cds1.Eof do
    begin
      while not LFrm.cds2.Eof do
      begin
        DM1.qrytmp.Append;
        DM1.qrytmp.FieldByName('grade_code').AsString := LFrm.edtGradeCode.Text;
        DM1.qrytmp.FieldByName('dept_ptr').AsInteger := LFrm.cds2.fieldbyname('dept_ptr').AsInteger;
        DM1.qrytmp.FieldByName('seq_no').AsInteger := LFrm.cds2.fieldbyname('seq_no').AsInteger;
        DM1.qrytmp.FieldByName('parameter_ptr').AsInteger := LFrm.cds2.fieldbyname('parameter_ptr').AsInteger;
        DM1.qrytmp.FieldByName('tvalue').AsString := LFrm.cds2.fieldbyname('tvalue').AsString;
        DM1.qrytmp.Post;
        LFrm.cds2.Next;
      end;
      LFrm.cds1.Next;
    end;

    Result := True;
  except
    Result := False;
  end;
end;

end.
