unit qkBaseMainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzPanel, System.ImageList, Vcl.ImgList,
  RzButton, qkBaseGridFrm, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, qkSvrIntf.ClientIntf,
  qkFunc.Commfunc, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzLabel, rzCommon, RzBtnEdt,
  Vcl.ComCtrls, RzDTP, RzCmboBx, Vcl.Menus, Vcl.DBCtrls, RzDBEdit, System.Generics.Collections;

type
  TfrmqkBaseMain = class(TfrmqkbaseGrid)
    mt1: TFDMemTable;
    pnlWhere: TPanel;
    pnlWhereBtn: TPanel;
    btnWhereOk: TRzBitBtn;
    btnWhereClose: TRzBitBtn;
    pmZD: TPopupMenu;
    pmMain: TPopupMenu;
    mniNew: TMenuItem;
    mniEdit: TMenuItem;
    mniView: TMenuItem;
    mniDele: TMenuItem;
    pnlTop: TPanel;
    pnlFilter: TPanel;
    edtSearch: TRzEdit;
    lblFilter: TLabel;
    lbl1: TLabel;
    lblModID: TLabel;
    pnlTopTool: TPanel;
    btnDisplay: TRzBitBtn;
    btnWhere: TRzBitBtn;
    btnExportXls: TRzBitBtn;
    btnRefresh: TRzBitBtn;
    btn1: TRzBitBtn;
    procedure edtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportXlsClick(Sender: TObject);
    procedure btnWhereClick(Sender: TObject);
    procedure edtWhereButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbxWHereChange(Sender: TObject);
    procedure edtWhereExit(Sender: TObject);
    procedure dtpWhereChange(Sender: TObject);
    procedure btnWhereCloseClick(Sender: TObject);
    procedure btnWherePickIdClick(Sender: TObject);
    procedure eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eh1CellClick(Column: TColumnEh);
    procedure btnDisplayClick(Sender: TObject);
    procedure mniZDClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure mniNewClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniViewClick(Sender: TObject);
    procedure mniDeleClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    FWhereDs: TFDMemTable;
    procedure mniSaveCustomDefColClick(Sender: TObject);
    procedure GenernalWhere;
    procedure InitWherePanel;
  public
    { Public declarations }
    FWhere: string;
    FAddWhereLst: TDictionary<string,string>; //例子: and a=b
    FMainSqlIDKey: Int64;
    FNotCheckEnterRight: Boolean;
    procedure FillZD; virtual;
    procedure InitMainFrm(AModID: int64;AMainSqlIDKey: Int64);virtual;
    procedure GetData;virtual;

  end;

implementation

uses
  system.DateUtils, qkBasePickFrm;

{$R *.dfm}


{ TfrmqkBaseMain }

procedure TfrmqkBaseMain.btnWherePickIdClick(Sender: TObject);
var
  Ledt: TRzButtonEdit;
begin
  inherited;
  Ledt := Sender as TRzButtonEdit;
  with TfrmqkBasepick.Create(Self) do
  begin
    if initPick(Ledt.Tag,Ledt.Text) then
    begin
      Ledt.Text :=  VarToStr(RetKey);
//      if FWhereds.Locate('FieldName',Ledt.Hint,[loCaseInsensitive]) then
//      begin
//        FWhereDs.Edit;
//        FWhereDs.FieldByName('value').AsString := RetKey;
//        FWhereDs.Post;
//        FWhereDs.MergeChangeLog;
//      end;
    end;
    free;
  end;
end;

procedure TfrmqkBaseMain.btn1Click(Sender: TObject);
begin
  inherited;
  qkCommfunc.CloseModTab;
end;

procedure TfrmqkBaseMain.btnDisplayClick(Sender: TObject);
begin
  inherited;
  pmZD.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmqkBaseMain.btnExportXlsClick(Sender: TObject);
begin
  inherited;
  ExportToExcel(eh1);
end;

procedure TfrmqkBaseMain.btnRefreshClick(Sender: TObject);
begin
  inherited;
  GetData;
end;

procedure TfrmqkBaseMain.btnWhereClick(Sender: TObject);
begin
  inherited;
  pnlWhere.Visible := not pnlWhere.Visible;
end;

procedure TfrmqkBaseMain.btnWhereCloseClick(Sender: TObject);
begin
  inherited;
  pnlWhere.Visible := False;
end;

procedure TfrmqkBaseMain.cbxWhereChange(Sender: TObject);
var
  Lcbx: TRzComboBox;
  LKeyArr: TArray<string>;
begin
  inherited;
  Lcbx := sender as TRzComboBox;
  if FWhereds.Locate('FieldName',Lcbx.Hint,[loCaseInsensitive]) then
  begin
    LKeyArr := FWhereDs.FieldByName('keylist').AsString.Split([';']);
    FWhereDs.Edit;
    if Lcbx.ItemIndex <= High(LKeyArr) then
    begin
      FWhereDs.FieldByName('value').AsString := LKeyArr[Lcbx.ItemIndex];
    end else
    begin
      FWhereDs.FieldByName('value').AsString := Lcbx.Text;
    end;
    FWhereDs.Post;
    FWhereDs.MergeChangeLog;
  end;
end;


procedure TfrmqkBaseMain.dtpWhereChange(Sender: TObject);
var
  LDtp: TDateTimePicker;
  LStrArr: TArray<string>;
  I: Integer;
begin
  inherited;
  LDtp := sender as TDateTimePicker;
  if FWhereds.Locate('FieldName',LDtp.Hint,[loCaseInsensitive]) then
  begin
    LStrArr := FWhereDs.FieldByName('value').AsString.Split([';']);
    if Length(LStrArr) < 2 then
      SetLength(LStrArr,2);
    if LDtp.Tag = 1 then
    begin
      LStrArr[0] := qkCommfunc.DateTimeToStr(LDtp.DateTime);
    end;
    if LDtp.Tag = 2 then
    begin
      LStrArr[1] := qkCommfunc.DateTimeToStr(LDtp.DateTime);    
    end;
    for I := 0 to Length(LStrArr) - 1 do
    begin
      if LStrArr[I] = '' then
        LStrArr[i] := 'Null';
    end;
    FWhereDs.Edit;
    FWhereDs.FieldByName('value').AsString := LStrArr[0] + ';' + LStrArr[1];
    FWhereDs.Post;
    FWhereDs.MergeChangeLog;
  end;
end;

procedure TfrmqkBaseMain.edtWhereButtonClick(Sender: TObject);
begin
  inherited;
  GenernalWhere;
  GetData;
end;

procedure TfrmqkBaseMain.edtWhereExit(Sender: TObject);
var
  Ledt: TRzEdit;
begin
  inherited;
  Ledt := sender as TRzEdit;
  if FWhereds.Locate('FieldName',Ledt.Hint,[loCaseInsensitive]) then
  begin
    FWhereDs.Edit;
    FWhereDs.FieldByName('value').AsString := Ledt.Text;
    FWhereDs.Post;
    FWhereDs.MergeChangeLog;
  end;
end;

procedure TfrmqkBaseMain.eh1CellClick(Column: TColumnEh);
begin
  inherited;
  lblFilter.Caption := FHotCol.Title.Caption + ':';
end;

procedure TfrmqkBaseMain.eh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ([ssAlt,ssCtrl] = Shift) and (Char(key) = 'S')  then
  begin
    ShowMessage('UI_MainSql: ' + #13 + FMainsqlIDKey.ToString);
  end;
  inherited;

end;

procedure TfrmqkBaseMain.edtSearchKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Search(edtSearch.Text);
    lbl1.Caption := '记录数：' + mt1.RecordCount.ToString;
  end;
end;

procedure TfrmqkBaseMain.FillZD;
var
  LCum: TColumnEh;
  LItem: TMenuItem;
  I: Integer;
begin
  pmZD.Items.Clear;
  for I := 0 to eh1.Columns.Count - 1 do
  begin
    LCum := eh1.Columns[I];
    LCum.Title.TitleButton := True;
    LItem := TMenuItem.Create(pmZD);
    LItem.Caption := LCum.Title.Caption;
    LItem.Checked := LCum.Visible;
    LItem.OnClick := mniZDClick;
    LItem.Tag := LCum.Index;
    pmZD.Items.Add(LItem);
  end;
  {$REGION '个人设置'}
  LItem := TMenuItem.Create(pmZD);
  LItem.Caption := '-';//LCum.Title.Caption;
  //LItem.Checked := LCum.Visible;
  //LItem.OnClick := mniZDClick;
  //LItem.Tag := LCum.Index;
  pmZD.Items.Add(LItem);
  LItem := TMenuItem.Create(pmZD);
  LItem.Caption := '保存设置';
  LItem.OnClick := mniSaveCustomDefColClick;
  pmZD.Items.Add(LItem);
  {$ENDREGION}


end;

procedure TfrmqkBaseMain.FormCreate(Sender: TObject);
begin
  inherited;
  FWhere := ' 1=1 ';
  FWhereDs := TFDMemTable.Create(Self);
  FWhereDs.DisableControls;
  FWhereDs.CachedUpdates := True;
  FAddWhereLst := TDictionary<string,string>.Create;
end;

procedure TfrmqkBaseMain.FormDestroy(Sender: TObject);
begin
  inherited;
  FWhereDs.Free;
  FAddWhereLst.Free;
end;

procedure TfrmqkBaseMain.GenernalWhere;
var
  LField: TField;
  LValue: string;
  LWhereField: string;
  //bQuoted: Boolean;
  Ltmp: string;
  Larr: TArray<string>;
begin
  FWhere := '';
  FWhereDs.First;
  while not FWhereDs.Eof do
  begin
    LValue := '';
    Lfield := mt1.Fields.FindField(FWhereDs.FieldByName('FieldName').AsString);
    if Lfield <> nil then
    begin
      LWhereField := FWhereDs.FieldByName('WhereName').AsString;
      if LWhereField = '' then
        LWhereField := FWhereDs.FieldByName('FieldName').AsString; 
      //bQuoted := FWhereDs.FieldByName('QuotedStr').AsBoolean;
      Ltmp := FWhereDs.FieldByName('value').AsString;
      if Lfield.DataType in [ftString, ftWideString, ftFixedChar] then
      begin
        LValue := LWhereField + ' LIKE ' + QuotedStr('%'+ltmp + '%')
      end else
      if Lfield.DataType in [ftSmallint, ftInteger, ftLargeint,ftShortint,ftByte, ftBoolean] then
      begin
        LValue := LWhereField + ' = ' + Ltmp;
      end else
      if Lfield.DataType in [ftFloat, ftCurrency, ftSingle] then
      begin
        LValue := LWhereField + ' = ' + Ltmp;        
      end else
      if Lfield.DataType in [ftDate,ftTime,ftDateTime,ftTimeStamp] then
      begin
        Larr := ltmp.Split([';']);
        LValue := LWhereField + ' BETWEEN ' + QuotedStr(larr[0]) + ' AND ' + QuotedStr(larr[1]) ;
      end else
      begin
        ShowMessage(LField.FieldName + ' 不支持的类型');
      end;

      if FWhere = '' then
        FWhere := LValue
      else
      begin
        if LValue <> '' then
          FWhere := FWhere + ' AND ' + LValue;
      end;
    end;
    FWhereDs.Next;
  end;
end;

function GetDictoryText(ADct: TDictionary<string,string>): string;
var
  LArr: TArray<string>;
  I: Integer;
begin
  LArr := ADct.Values.ToArray;
  for I := 0 to Length(LArr)-1 do
  begin
    Result := Result + ' ' + LArr[I] + ' ';
  end;
end;

procedure TfrmqkBaseMain.GetData;
const
  SPNAME = 'UI_MainSqlExec';
var
  LDslst: tlist<TFDMemTable>;
  LPms: TFDParams;
begin
  LDslst := nil;
  LPms := TFDParams.Create;
  try
    try
    with LPms.Add do
    begin
      Name := '@IDKey';
      Value := FMainSqlIDKey;
    end;
    with LPms.Add do
    begin
      Name := '@Where';
      if FWhere = '' then
        FWhere := '(1=1)';
      Value := FWhere + ' ' + GetDictoryText(FAddWhereLst);
    end;
    mt1.Close;
    LDslst := dmSvrIntf.SpOpen(SPNAME,LPms);

    if not qkCommfunc.CheckSPRetParam(LPms) then
    begin
      Exit;
    end;

    if LDslst.Count > 0 then
    begin
      mt1.Data := LDslst[0].Data;
      mt1.MergeChangeLog;
    end;
    lbl1.Caption := '记录数：' + mt1.RecordCount.ToString;
    except
      on E: Exception do
      begin
        ShowMessage(e.Message);
      end;
    end;
  finally
    qkCommfunc.ReleaseDsList(LDslst);
    LPms.Free;
  end;
end;

procedure TfrmqkBaseMain.InitMainFrm(AModID: int64;AMainSqlIDKey: Int64);
const
  SPNAME = 'UI_MainSqlInit';
var
  Lpms: TFDParams;
  LdsList: TList<TFDMemTable>;
begin
  if FNotCheckEnterRight = False then
    if not qkRight.CheckOperatorRight(AModID,qkConst.Right_Enter) then Exit;

  ModID := AModID;
  FMainSqlIDKey := AMainSqlIDKey;
  LdsList := nil;
  Lpms := TFDParams.Create;
  with Lpms.Add do
  begin
    Name := '@IDkey';
    Value := AMainSqlIDKey;
  end;
  with Lpms.Add do
  begin
    Name := '@Where';
    Value := FWhere;
  end;
  try
  try
    LdsList := dmSvrIntf.SpOpen(SPNAME,Lpms);

    if not LdsList[0].IsEmpty then //GridColum
    begin
      InitGrid(AModID,LdsList[0].FieldByName('GridIDKey').AsLargeInt);
    end;
    FWhereDs.Data := LdsList[1].Data;
    GetData;
    DataSet := mt1;
    InitWherePanel;
    lblModID.Caption := modid.ToString;

    FillZD;
    if eh1.Columns.Count > 0 then
      lblFilter.Caption := eh1.Columns[0].Title.Caption;
  except
    on E: Exception do
      ShowMessage(e.Message);
  end;
  finally
    Lpms.Free;
    qkCommfunc.ReleaseDsList(LdsList);
  end;
end;



procedure TfrmqkBaseMain.InitWherePanel;
type
  TMAINWHEREPNLTYPE = (ptStr=0,ptInt=1,ptFloat=2,ptDate=3);
 procedure AddStrIntFloatPnl(ACaption,AFieldName: string;Apt: TMAINWHEREPNLTYPE;ApickID: Int64);
  var
    Lpnl: TPanel;
    Lbl: TLabel;
    LEdt: TWinControl;
    Lcbx: TRzComboBox;
    LstrArr: TArray<string>;
    I: Integer;
  begin
    Lpnl := TPanel.Create(pnlWhere);
    Lpnl.BorderWidth := 2;
    Lpnl.Align := alTop;
    Lpnl.Height := 25;
    Lpnl.ParentColor := True;
    lpnl.Parent := pnlWhere;
    Lpnl.Top := 9999;

    Lbl := TLabel.Create(Lpnl);
    Lbl.ParentFont := True;
    Lbl.ParentColor := true;
    Lbl.Align := alLeft;
    Lbl.Layout := tlCenter;
    Lbl.Caption := ACaption;
    Lbl.Parent := lpnl;

    if FWhereDs.FieldByName('PickList').AsString <> '' then
    begin
      Lcbx := TRzComboBox.Create(Lpnl);
      Lcbx.Hint := AFieldName;
      lcbx.ShowHint := False;
      Lcbx.Style := csDropDownList;
      Lcbx.Parent := Lpnl;
      LstrArr := FWhereDs.FieldByName('PickList').AsString.Split([';']);
      Lcbx.Items.Clear;
      for I := 0 to Length(LstrArr) - 1 do
      begin
        Lcbx.Items.Add(lstrarr[I]);
      end;
      Lcbx.Align := alClient;
      Lcbx.OnChange := cbxWHereChange;
    end else
    begin
      if Apt in [ptInt,ptFloat] then
      begin
        LEdt := TRzNumericEdit.Create(Lpnl);
        (LEdt as TRzNumericEdit).IntegersOnly := Apt = ptInt;
        LEdt.Parent := Lpnl;
      end
      else
      begin
        LEdt := TRzButtonEdit.Create(Lpnl);
        LEdt.Parent := Lpnl;
        if ApickID <> 0 then
        begin
          LEdt.Tag := ApickID;
          (LEdt as TRzButtonEdit).OnButtonClick := btnWherePickIdClick;
          (LEdt as TRzButtonEdit).ButtonVisible := True;
        end else
        begin
          (LEdt as TRzButtonEdit).ButtonVisible := False;
        end;
        (LEdt as TRzButtonEdit).OnExit := edtWhereExit;
      end;
      LEdt.Hint := AFieldName;
      LEdt.ShowHint := False;
      LEdt.Align := alClient;
      LEdt.Parent := Lpnl;
    end;
    Lpnl.Tag := Integer(Apt);
    lpnl.Hint := AFieldName;    
  end;
  procedure AddDateWherePnl(ACaption,AFieldName: string;Apt: TMAINWHEREPNLTYPE);
  var
    Lpnl,lpnl2,Lpnl3: TPanel;
    Lbl: TLabel;
    LEdt1,LEdt2: TDateTimePicker;
  begin
    Lpnl := TPanel.Create(pnlWhere);
    Lpnl.BorderWidth := 2;
    Lpnl.Align := alTop;
    Lpnl.Height := 80;
    Lpnl.ParentColor := True;
    lpnl.Parent := pnlWhere;
    Lpnl.Top := 9999;

    Lbl := TLabel.Create(Lpnl);
    Lbl.ParentFont := True;
    Lbl.ParentColor := true;
    Lbl.Align := alTop;
    Lbl.Layout := tlCenter;
    Lbl.Caption := ACaption ;//+ '(开始结束)';
    Lbl.Parent := Lpnl;
    
    Lpnl2 := TPanel.Create(Lpnl);
    Lpnl2.BorderWidth := 2;
    Lpnl2.Align := alTop;
    Lpnl2.Height := 30;
    Lpnl2.ParentColor := True;
    Lpnl2.Parent := lpnl;
    Lpnl2.Top := 9999;

    Lpnl3 := TPanel.Create(Lpnl);
    Lpnl3.BorderWidth := 2;
    Lpnl3.Align := alTop;
    Lpnl3.Height := 30;
    Lpnl3.ParentColor := True;
    Lpnl3.Parent := lpnl;
    Lpnl3.Top := 9999;
  

    Lbl := TLabel.Create(Lpnl2);
    Lbl.ParentFont := True;
    Lbl.ParentColor := true;
    Lbl.Align := alLeft;
    Lbl.Layout := tlCenter;
    Lbl.Caption := '始：';
    Lbl.Parent := Lpnl2;    
    
    Lbl := TLabel.Create(Lpnl3);
    Lbl.ParentFont := True;
    Lbl.ParentColor := true;
    Lbl.Align := alLeft;
    Lbl.Layout := tlCenter;
    Lbl.Caption := '终：';
    Lbl.Parent := Lpnl3;
      
    
    LEdt1 := TDateTimePicker.Create(lpnl2);
    LEdt1.Date := IncDay(Now,-7);
    LEdt1.Time := 0;
    LEdt1.Align := alClient;
    LEdt1.Parent := Lpnl2;
    LEdt1.Hint := AFieldName;
    LEdt1.ShowHint := False;
    LEdt1.Tag := 1;
    LEdt1.OnChange := dtpWhereChange;
    dtpWhereChange(LEdt1);

    LEdt2 := TDateTimePicker.Create(lpnl3);
    LEdt2.Date := IncDay(Now,1);
    LEdt2.Time := StrToTime('23:59:59');
    LEdt2.Align := alClient;
    LEdt2.Parent := Lpnl3;
    LEdt2.Hint := AFieldName;
    LEdt2.ShowHint := False;
    LEdt2.Tag := 2;
    LEdt2.OnChange := dtpWhereChange;
    dtpWhereChange(LEdt2);
    
    Lpnl.Tag := Integer(Apt);
    lpnl.Hint := AFieldName;
  end;
var
  LField: TField;
begin
  FWhereDs.First;
  while not FWhereDs.Eof do
  begin
    Lfield := mt1.Fields.FindField(FWhereDs.FieldByName('FieldName').AsString);
    if Lfield <> nil then
    begin
      if Lfield.DataType in [ftString, ftWideString, ftFixedChar] then
      begin
        AddStrIntFloatPnl(FWhereds.FieldByName('Title').AsString,Lfield.FieldName,ptStr,
          FWhereDs.FieldByName('pickid').AsLargeInt);
      end else
      if Lfield.DataType in [ftSmallint, ftInteger, ftLargeint,ftShortint,ftByte, ftBoolean] then
      begin
        AddStrIntFloatPnl(FWhereds.FieldByName('Title').AsString,Lfield.FieldName,ptInt,
          FWhereDs.FieldByName('pickid').AsLargeInt);
      end else
      if Lfield.DataType in [ftFloat, ftCurrency, ftSingle] then
      begin
        AddStrIntFloatPnl(FWhereds.FieldByName('Title').AsString,Lfield.FieldName,ptFloat,
          FWhereDs.FieldByName('pickid').AsLargeInt);
      end else
      if Lfield.DataType in [ftDate,ftTime,ftDateTime,ftTimeStamp] then
      begin
        AddDateWherePnl(FWhereds.FieldByName('Title').AsString,Lfield.FieldName,ptDate);
      end else
      begin
        ShowMessage(LField.FieldName + ' 不支持的类型');
      end;
    end;
    FWhereDs.Next;
  end;
  pnlWhereBtn.Top := 999;
end;

procedure TfrmqkBaseMain.mniDeleClick(Sender: TObject);
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then
    Abort;
end;

procedure TfrmqkBaseMain.mniEditClick(Sender: TObject);
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then
    Abort;
end;

procedure TfrmqkBaseMain.mniNewClick(Sender: TObject);
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then
    Abort;
end;

procedure TfrmqkBaseMain.mniSaveCustomDefColClick(Sender: TObject);
begin
  SaveCustomerDefCol;
  qkDialog.OperSucc;
end;

procedure TfrmqkBaseMain.mniViewClick(Sender: TObject);
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then
    Abort;
end;

procedure TfrmqkBaseMain.mniZDClick(Sender: TObject);
var
  LItem: TMenuItem;
begin
  inherited;
  LItem := (Sender as TMenuItem);
  LItem.Checked := not LItem.Checked;
  eh1.Columns[LItem.Tag].Visible := LItem.Checked;
  SaveCustomerDefCol;
end;

procedure TfrmqkBaseMain.pmMainPopup(Sender: TObject);
begin
  inherited;
  qkCommfunc.PopMenuEnableSet(pmMain,DataSet);
end;

end.
