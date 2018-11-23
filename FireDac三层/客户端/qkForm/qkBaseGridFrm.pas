unit qkBaseGridFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzPanel, System.Generics.Collections,
  FireDAC.Comp.Client, FireDAC.Stan.Param, EhLibFireDAC, Vcl.StdCtrls,DBGridEhImpExp,
  SearchPanelsEh, Vcl.Mask, DBCtrlsEh, Vcl.DBCtrls, Vcl.Menus,FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, RzEdit, RzBtnEdt, RzDBEdit;

type
  TfrmqkbaseGrid = class(TfrmqkBase)
    pnlbase: TPanel;
    ds1: TDataSource;
    pnlbaseGrid: TPanel;
    eh1: TDBGridEh;
    mtCustomerCol: TFDMemTable;
    pnlbaseforGrid: TPanel;
    procedure eh1Columns0EditButtonClick(Sender: TObject; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure eh1TitleClick(Column: TColumnEh);
    procedure eh1CellClick(Column: TColumnEh);
    procedure eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eh1ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
  private
    { Private declarations }
    FDataSet: TFDMemTable;
    FColDs: TFDMemTable;
    FGridIDKey: Int64;
    function GetSet: TFDMemTable;
    procedure SetDataSet(AValue: TFDMemTable);
    procedure DBGridEh1DrawTitleCell(Grid: TCustomDBGridEh; ACanvas: TCanvas; const ARect: TRect; Params:  TDBGridDrawTitleCellParamsEh; var Processed: Boolean);
  public
    { Public declarations }
    FHotCol: TColumnEh;
    procedure InitGrid(ARightModID: int64; AGridIDKey: Int64);
    procedure LoadCustomerDefCol;
    procedure SaveCustomerDefCol;
    procedure ExportToExcel(AEh: TDBGridEh);overload;
    procedure ExportToExcel;overload;
    procedure Search(AStr: string);
    property DataSet: TFDMemTable read GetSet write SetDataSet;
    property ColDs: TFDMemTable read FColDs;
  end;

implementation
uses
  qkSvrIntf.ClientIntf, qkFunc.Commfunc;

{$R *.dfm}

{ TForm1 }

procedure TfrmqkbaseGrid.DBGridEh1DrawTitleCell(Grid: TCustomDBGridEh;
  ACanvas: TCanvas; const ARect: TRect; Params: TDBGridDrawTitleCellParamsEh;
  var Processed: Boolean);
begin
  if params.Column = FHotCol then
  begin
    Params.Color := clHighlight;
    Grid.DrawTitleCellBackground(ACanvas, ARect, Params);
  end;
end;

procedure TfrmqkbaseGrid.eh1CellClick(Column: TColumnEh);
begin
  inherited;
  if FHotCol <> Column then
  begin
    FHotCol := Column;
    eh1.InvalidateTitle;
  end;
end;

procedure TfrmqkbaseGrid.eh1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
  SaveCustomerDefCol;
end;

procedure TfrmqkbaseGrid.eh1Columns0EditButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
  inherited;
  //
end;

procedure TfrmqkbaseGrid.eh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ([ssAlt,ssCtrl] = Shift) and (Char(key) = 'S')  then
  begin
    ShowMessage('UI_Grid_ColumMain: ' + #13 + FGridIDKey.ToString);
  end;
end;

procedure TfrmqkbaseGrid.eh1TitleClick(Column: TColumnEh);
begin
  inherited;
  FHotCol := Column;
  eh1.SelectedField := Column.Field;
end;

procedure TfrmqkbaseGrid.ExportToExcel(AEh: TDBGridEh);
var
  Ldlg: TSaveDialog;
begin
  Ldlg := TSaveDialog.Create(Self);
  Ldlg.DefaultExt := 'xlsx';
  Ldlg.Filter := 'Excel 2007文件|*.xlsx|Excel 99-03文件|*.xls';
  try
    if Ldlg.Execute() then
    begin
      if Ldlg.FileName <> '' then
      begin
        ExportDBGridEhToXlsx(AEh,Ldlg.FileName,[]);
      end;
    end;
  finally
    Ldlg.Free;
  end;
end;

procedure TfrmqkbaseGrid.ExportToExcel;
begin
  ExportToExcel(eh1);
end;

procedure TfrmqkbaseGrid.FormCreate(Sender: TObject);
begin
  inherited;
  eh1.OnDrawTitleCell := DBGridEh1DrawTitleCell;
end;

function TfrmqkbaseGrid.GetSet: TFDMemTable;
begin
  Result := FDataSet;
end;

procedure TfrmqkbaseGrid.InitGrid(ARightModID: int64;AGridIDKey: Int64);
const
  SPNAME = 'UI_GridColumnInit';
var
  LdsLst: tlist<TFDMemTable>;
  Lcol: TColumnEh;
  I: Integer;
  LsArr: TArray<string>;
  LPms: TFDParams;

  LRightArr1,LRightArr2: TArray<string>;
  LColright: Boolean;
begin
  FGridIDKey := AGridIDKey;
  LdsLst := nil;
  LPms := TFDParams.Create;
  with LPms.Add do
  begin
    Name := '@IDKey';
    Value := AGridIDKey;
  end;
  with LPms.Add do
  begin
    Name := '@userIDKey';
    Value := qkVar.LoginIDKey;
  end;
  try
  try
    LdsLst := dmSvrIntf.SpOpen(SPNAME,LPms);
    mtCustomerCol.Close;
    mtCustomerCol.AppendData(LDsLst[2].Data);
    mtCustomerCol.MergeChangeLog;
    if LdsLst = nil then
      Exit;
    if LdsLst[0].IsEmpty then
      Exit;
    with LdsLst[0] do
    begin
      if FieldByName('CustomerDef').AsBoolean then //界面添加的列自定义设置
        Exit;
      eh1.SearchPanel.Enabled := FieldByName('SearchPanel').AsBoolean;
      if eh1.SearchPanel.Enabled then
        eh1.SearchPanel.Location := splGridTopEh
      else
        eh1.SearchPanel.Location := splExternal;
      eh1.STFilter.Visible := FieldByName('STFilter').AsBoolean;
      eh1.TitleParams.MultiTitle := FieldByName('MutiTitle').AsBoolean;
      eh1.DrawMemoText := FieldByName('DrawMemtext').AsBoolean;
      eh1.ReadOnly := FieldByName('ReadOnly').AsBoolean;
    end;

    LRightArr1 := qkRight.ModRights(ARightModID);
    eh1.Columns.Clear;
    with LdsLst[1] do
    begin
      First;
      while not Eof do
      begin
        //权限显示列
        if FieldByName('visiblerights').AsString <> '' then
        begin
          LColright := False;
          LRightArr2 := FieldByName('visiblerights').AsString.Split([';']);
          for I := 0 to Length(LRightArr2) - 1 do
          begin
            if qkCommfunc.StrInArr(LRightArr2[I],LRightArr1) then
            begin
              LColright := True;
              Break;
            end;
          end;
        end else
          LColright := True;

        if not LColright then
        begin
          LdsLst[1].Next;
          Continue;
        end;


        Lcol := eh1.Columns.Add;
        if FHotCol = nil then
        begin
          FHotCol := Lcol;
          eh1.SelectedIndex := 0;
        end;
        with Lcol do
        begin
          if FieldByName('Sum').AsBoolean then
          begin
            eh1.SumList.Active := True;
            eh1.FooterRowCount := 1;
            Lcol.Footer.ValueType := TFooterValueType.fvtSum;
          end;
          Lcol.Visible := FieldByName('Visible').AsBoolean;
          Title.Caption := FieldByName('title').AsString;
          Lcol.Width := FieldByName('width').AsInteger;
          FieldName := FieldByName('FieldName').AsString;
          ReadOnly := FieldByName('ReadOnly').AsBoolean;
          Lcol.Checkboxes := FieldByName('CheckBox').AsBoolean;
          if FieldByName('pickid').AsLargeInt <> 0 then
          begin
            Tag := FieldByName('pickid').AsLargeInt;
            OnEditButtonClick := eh1Columns0EditButtonClick;
          end;
          LsArr := FieldByName('PickList').AsString.Split([';']);
          PickList.Clear;
          for I := 0 to Length(LsArr) - 1 do
            PickList.Add(lsarr[I]);
          LsArr := FieldByName('Keylist').AsString.Split([';']);
          KeyList.Clear;
          for I := 0 to Length(LsArr) - 1 do
            KeyList.Add(lsarr[I]);
        end;
        Next;
      end;
    end;
    eh1.FrozenCols := LdsLst[0].FieldByName('FrozenCols').AsInteger;
    FColDs := LdsLst[1];


    //读取用户自定义的排序
    LoadCustomerDefCol;
  except
    on E: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
  finally
    LPms.Free;
    qkCommfunc.ReleaseDsList(LdsLst);
  end;
end;

procedure TfrmqkbaseGrid.SaveCustomerDefCol;
var
  I: Integer;
  LCol: TColumnEh;
  LKeyArr: TArray<Int64>;
begin
  while not mtCustomerCol.IsEmpty do
  begin
    mtCustomerCol.Delete;
  end;
  if not qkCommfunc.CreateIDKey(eh1.Columns.Count,LKeyArr) then exit;
  for I := 0 to eh1.Columns.Count - 1 do
  begin
    LCol := eh1.Columns[I];
//    if mtCustomerCol.Locate('FieldName',LCol.FieldName,[loCaseInsensitive]) then
//      mtCustomerCol.Edit
//    else
    begin
      mtCustomerCol.Append;
      mtCustomerCol.FieldByName('IDKey').AsLargeInt := LKeyArr[I];
      mtCustomerCol.FieldByName('gUserIDkey').AsLargeInt := qkVar.LoginIDKey;
      mtCustomerCol.FieldByName('GridMainIDKey').AsLargeInt := FGridIDKey;
    end;
    mtCustomerCol.FieldByName('Idx').AsInteger := LCol.Index;
    mtCustomerCol.FieldByName('Visible').AsBoolean := LCol.Visible;
    mtCustomerCol.FieldByName('FieldName').AsString := LCol.FieldName;
    mtCustomerCol.FieldByName('Width').AsInteger := LCol.Width;
    mtCustomerCol.Post;
  end;
  dmSvrIntf.PostDataByTable(mtCustomerCol,'gSys_User_GridColCustDef');
end;

procedure TfrmqkbaseGrid.Search(AStr: string);
begin
  eh1.SearchPanel.SearchingText := AStr;
  eh1.SearchPanel.RestartFind;
  eh1.SearchPanel.Active := True;
  eh1.SearchPanel.ApplySearchFilter;
end;

procedure TfrmqkbaseGrid.LoadCustomerDefCol;
var
  I: Integer;
  LCol: TColumnEh;
begin
  if mtCustomerCol.IsEmpty then
  begin
    SaveCustomerDefCol;
    exit;
  end;
  mtCustomerCol.First;
  while not mtCustomerCol.Eof do
  begin
    LCol := eh1.FindFieldColumn(mtCustomerCol.FieldByName('FieldName').AsString);
    if LCol <> nil then
    begin
      LCol.Width := mtCustomerCol.FieldByName('Width').AsInteger;
      if mtCustomerCol.FieldByName('Idx').AsInteger > eh1.Columns.Count - 1 then
        LCol.Index := eh1.Columns.Count - 1
      else
        LCol.Index := mtCustomerCol.FieldByName('Idx').AsInteger;
      LCol.Visible := mtCustomerCol.FieldByName('Visible').AsBoolean;
    end;
    mtCustomerCol.Next;
  end;

end;

procedure TfrmqkbaseGrid.SetDataSet(AValue: TFDMemTable);
begin
  ds1.DataSet := AValue;
  FDataSet := AValue;
end;

end.
