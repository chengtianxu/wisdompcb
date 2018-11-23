unit qkBaseEditVGridFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseEditFrm, RzButton, Vcl.ExtCtrls,
  RzPanel, EhLibVCL, GridsEh, DBAxisGridsEh, DBVertGridsEh, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, System.Generics.Collections;

type
  Tfrmqkbaseeditvgrid = class(Tfrmqkbaseedit)
    pnlBase2: TPanel;
    veh1: TDBVertGridEh;
    ds1: TDataSource;
    spl1: TSplitter;
    pnlBaseForVEditGrid: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure veh1Rows0EditButtonClick(Sender: TObject; var Handled: Boolean);
    procedure veh1Rows0UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure btnCloseClick(Sender: TObject);
    procedure veh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    FTmpDic: TDictionary<string,int64>;
    FDsUIGridDetail: TFDMemTable;
    FDsUIGridMain: TFDMemTable;
    FDataSet: TFDMemTable;
    procedure SetDataSet(AValue: TFDMemTable);
    function _findrow(AFieldName: string):TFieldRowEh;
    procedure _DefaultGetTableData(ATable,AWhere: string);virtual;
  public
    { Public declarations }
    function CheckNotNull: Boolean;virtual;
    procedure SetToMousePositon;
    procedure InitGrid(AGridIDKey: Int64);virtual;

    property DataSet: TFDMemTable read FDataSet write SetDataSet;
  end;


implementation

uses
  qkSvrIntf.ClientIntf, qkFunc.Commfunc, qkBasePickFrm,ToolCtrlsEh, qkBasePickFrmTree;

{$R *.dfm}

{ Tfrmqkbaseeditvgrid }

procedure Tfrmqkbaseeditvgrid._DefaultGetTableData(ATable, AWhere: string);
const
  SPNAME = 'Sys_GetTableData';
var
  lds: TList<TFDMemTable>;
  lpms: TFDParams;
begin
  lpms := TFDParams.Create;
  try
    with lpms.Add do
    begin
      Name := '@TableName';
      Value := ATable;
    end;
    with lpms.Add do
    begin
      Name := '@Where';
      Value := AWhere;
    end;

    lds := dmSvrIntf.SpOpen(SPNAME,lpms);
    if lds = nil then
      Exit;
    if not qkCommfunc.CheckSPRetParam(lpms) then
      Exit;

    DataSet := lds[0];
  finally
    lpms.Free;
  end;
end;

procedure Tfrmqkbaseeditvgrid.btnCloseClick(Sender: TObject);
begin
  inherited;
  if ds1.DataSet <> nil then
  begin
    if ds1.DataSet.State in [dsEdit,dsInsert] then
      ds1.DataSet.Cancel;
  end;
end;

procedure Tfrmqkbaseeditvgrid.btnSaveClick(Sender: TObject);
begin
  if not CheckNotNull then Exit;
  inherited;
end;

function Tfrmqkbaseeditvgrid.CheckNotNull: Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to veh1.Rows.Count - 1 do
  begin
    if veh1.Rows[I].RowLabel.Font.Color = clRed then
    begin
      if veh1.Rows[I].EditText = '' then
      begin
        ShowMessage('红色为必填内容："' + veh1.Rows[I].RowLabel.Caption + '" 必须填写，不能为空');
        Exit;
      end;
    end;
  end;
  Result := True;
end;

procedure Tfrmqkbaseeditvgrid.FormCreate(Sender: TObject);
begin
  inherited;
  FDsUIGridMain := TFDMemTable.Create(Self);
  FDsUIGridDetail := TFDMemTable.Create(Self);
  FTmpDic := TDictionary<string,Int64>.Create();
end;


procedure Tfrmqkbaseeditvgrid.FormDestroy(Sender: TObject);
begin
  inherited;
  FTmpDic.Clear;
  FTmpDic.Free;
end;

procedure Tfrmqkbaseeditvgrid.InitGrid(AGridIDKey: Int64);
const
  SPNAME = 'UI_EditGridColumnInit';
var
  lds: tlist<TFDMemTable>;
  lpms: TFDParams;
  ltmpArr: TArray<string>;
  I,J: Integer;
  Lrow: TFieldRowEh;
begin

  lpms := TFDParams.Create;
  with lpms.Add do
  begin
    Name := '@IDKey';
    Value := AGridIDKey;
  end;
  lds := nil;
  try
    lds := dmSvrIntf.SpOpen(SPNAME,lpms);
    if lds = nil then
      exit;

    if not qkCommfunc.CheckSPRetParam(lpms) then
      Exit;

    FDsUIGridMain.Data := lds[0].Data;
    FDsUIGridDetail.Data := lds[1].Data;

    if FDsUIGridMain.IsEmpty then
      Exit;
    veh1.LabelColWidth := FDsUIGridMain.FieldByName('labelcolwidth').AsInteger;
    veh1.ReadOnly := FDsUIGridMain.FieldByName('readonly').AsBoolean;
    //Self.Width := FDsUIGridMain.FieldByName('width').AsInteger;
    //Self.Width := veh1.Width + 200;
    ltmpArr := FDsUIGridMain.FieldByName('Categories').AsString.Split([';']);
    veh1.RowCategories.Active := Length(ltmpArr) > 0;
    veh1.RowCategories.CategoryProps.Clear;
    for I := 0 to Length(ltmpArr)-1 do
    begin
      with veh1.RowCategories.CategoryProps.Add do
      begin
        Name := ltmpArr[I];
        DisplayText := ltmpArr[I];
        DefaultExpanded := True;
      end;
    end;

    veh1.Rows.Clear;
    while not FDsUIGridDetail.Eof do
    begin
      Lrow := veh1.Rows.Add;
      with FDsUIGridDetail do
      begin
        Lrow.Color := clWhite;
        Lrow.AlwaysShowEditButton := True;
        Lrow.FieldName := FieldByName('fieldname').AsString;
        Lrow.ReadOnly := FieldByName('readonly').AsBoolean;
        Lrow.CategoryName := FieldByName('CategorieName').AsString;
        Lrow.RowHeight := FieldByName('RowHeight').AsInteger;
        Lrow.EditMask := FieldByName('EditMask').AsString;
        Lrow.RowLabel.Caption := FieldByName('Title').AsString;
        if FieldByName('NotNull').AsBoolean then
        begin
          Lrow.RowLabel.Font.Color := clRed;
        end;
        Lrow.WordWrap := True;
        Lrow.OnUpdateData := veh1Rows0UpdateData;
        Lrow.KeyList.Clear;
        ltmpArr := FieldByName('keylist').AsString.Split([';']);
        for J := 0 to Length(ltmpArr) - 1 do
          Lrow.KeyList.Add(ltmparr[J]);
        Lrow.PickList.Clear;
        ltmpArr := FieldByName('picklist').AsString.Split([';']);
        for J := 0 to Length(ltmpArr) - 1 do
          Lrow.PickList.Add(ltmparr[J]);


        if FieldByName('PickID').AsLargeInt <> 0 then
        begin
          Lrow.ButtonStyle := cbsEllipsis;
          Lrow.EditButton.Hint := Lrow.FieldName;
          FTmpDic.Add(Lrow.EditButton.Hint,FieldByName('PickID').AsLargeInt);
          Lrow.OnEditButtonClick := veh1Rows0EditButtonClick;
        end;
      end;
      FDsUIGridDetail.Next;
    end;
    //必须最后设置visible
    FDsUIGridDetail.First;
    while not FDsUIGridDetail.Eof do
    begin
      lrow := veh1.FindFieldRow(FDsUIGridDetail.FieldByName('FieldName').AsString);
      if Lrow <> nil then
        lrow.Visible := FDsUIGridDetail.FieldByName('Visible').AsBoolean;
      FDsUIGridDetail.Next;
    end;

  finally
    qkCommfunc.ReleaseDsList(lds);
    lpms.Free;
  end;


end;

procedure Tfrmqkbaseeditvgrid.SetDataSet(AValue: TFDMemTable);
begin
  FDataSet := AValue;
  ds1.DataSet := FDataSet;
end;

procedure Tfrmqkbaseeditvgrid.SetToMousePositon;
begin
//  Self.Position := TPosition.poDesigned;
//  Self.Left := Mouse.CursorPos.X-10;
//  Self.top := Mouse.CursorPos.Y-50;
//  if Self.Left < 100 then
//    Self.Left := 100;
//  if self.Top < 100 then
//    Self.Top := 100;
end;

procedure Tfrmqkbaseeditvgrid.veh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ([ssAlt,ssCtrl] = Shift) and (Char(key) = 'S')  then
  begin
    ShowMessage('UI_EditGrid_Main: ' + #13 + FDsUIGridMain.FieldByName('IDKey').AsString);
  end;
end;

procedure Tfrmqkbaseeditvgrid.veh1Rows0EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  LFrm: TfrmqkBasepick;
  Lbtn: TEditButtonControlEh;
  Lrow: TFieldRowEh;
  LLinkField: string;

  LPickID: int64;
begin
  inherited;
  if DataSet.ReadOnly then
    Exit;
  Lbtn := Sender as TEditButtonControlEh;
  FDsUIGridDetail.Locate('FieldName',Lbtn.Hint,[loCaseInsensitive]);
  if FDsUIGridDetail.FieldByName('PickTreeList').AsBoolean then
    LFrm := TfrmqkbasePickTree.Create(Self)
  else
    LFrm := TfrmqkBasepick.Create(Self);
  try
    if not FTmpDic.TryGetValue(Lbtn.Hint,LPickID) then
      Exit;
    if LFrm.InitPick(LPickID) then
    begin
      Lrow := _findrow(Lbtn.Hint);
      if Lrow <> nil then
      begin
        if FDsUIGridDetail.Locate('FieldName',Lrow.FieldName,[loCaseInsensitive]) then
        begin
          LLinkField := FDsUIGridDetail.FieldByName('LinkFieldName').AsString;
          if LLinkField <> '' then
          begin
            FDataSet.Edit;
            FDataSet.FieldByName(LLinkField).Value := LFrm.RetKey;
            FDataSet.FieldByName(Lrow.FieldName).Value := LFrm.RetDisplay;
            FDataSet.Post;
          end else
          begin
            FDataSet.Edit;
            FDataSet.FieldByName(Lrow.FieldName).Value := LFrm.RetKey;
            FDataSet.Post;
          end;
        end;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure Tfrmqkbaseeditvgrid.veh1Rows0UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
const
  SPNAME = 'Sys_OpenSQL';
var
  Lrow: TFieldRowEh;
  lds: TList<TFDMemTable>;
  lpms: TFDParams;
  LSql: string;
  LLinkField: string;
  lpm: TFDParam;
begin
  inherited;
  Lrow := Sender as TFieldRowEh;
  if FDsUIGridDetail.Locate('FieldName',Lrow.FieldName,[loCaseInsensitive]) then
  begin
    LLinkField := FDsUIGridDetail.FieldByName('LinkFieldName').AsString;
    if LLinkField <> '' then
    begin
      Handled := True; //等于True则取消更新
      LSql := FDsUIGridDetail.FieldByName('CheckSql').AsString;
      if FDsUIGridDetail.FieldByName('CheckWhereQuoted').AsBoolean then
        LSql := StringReplace(LSql,':p1',QuotedStr(Text),[rfReplaceAll,rfIgnoreCase])
      else
        LSql := StringReplace(LSql,':p1',Text,[rfReplaceAll,rfIgnoreCase]);
      lpms := TFDParams.Create;
      lpm := lpms.Add;
      lpm.Name := '@Sqltxt';
      lpm.Value := LSql;
      lds := nil;
      try
        lds := dmSvrIntf.SpOpen(SPNAME,lpms);
        if lds = nil then
          exit;
        if not qkCommfunc.CheckSPRetParam(lpms) then
          Exit;

        if lds[0].IsEmpty then
        begin
          ShowMessage('无效的 ' + Lrow.FieldName);
          Exit;
        end;

        UseText := True;
        //mt1.Edit; 已经是编辑状态了
        FDataSet.FieldByName(LLinkField).Value := lds[0].FieldByName(FDsUIGridDetail.FieldByName('CheckRetKey').AsString).Value;
        //mt1.Post; 不需要提交，eh会自动提交
        Handled := False;
      finally
        lpms.Free;
        qkCommfunc.ReleaseDsList(lds);
      end;
    end;
  end;
end;

function Tfrmqkbaseeditvgrid._findrow(AFieldName: string): TFieldRowEh;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to veh1.RowCount - 1 do
  begin
    if veh1.Rows[I].FieldName = AFieldName then
    begin
      Result := veh1.Rows[I];
      Break;
    end;
  end;
end;

end.
