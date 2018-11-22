unit BasePackPrintFrm_525;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrm, Vcl.ExtCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.Grids, Vcl.ValEdit, Data.DB,
  Datasnap.DBClient, Vcl.Mask, RzEdit, frxClass, frxDBSet, RzCmboBx, frxBarcode, frxBarcode2D,
  Bde.DBTables, System.Generics.Collections, Vcl.Buttons, frxDesgn;

type
  TfrmBasePackPrint_525 = class(TfrmBase)
    pnlDisplay: TPanel;
    pnl2: TPanel;
    cdsPackType: TClientDataSet;
    pnl1: TPanel;
    vePackInfo: TValueListEditor;
    pnl3: TPanel;
    pnl4: TPanel;
    btnPrintTag: TButton;
    edtCreateNum: TRzNumericEdit;
    lbl1: TLabel;
    pnlScanWO: TPanel;
    lbl2: TLabel;
    edtWOBar: TEdit;
    cdsPrintDetail: TClientDataSet;
    cdsPrintMain: TClientDataSet;
    cdsPrinter: TClientDataSet;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    UpdateSQL1: TUpdateSQL;
    pnlPackIDScan: TPanel;
    lbl3: TLabel;
    edtScanPackID: TEdit;
    edtMaxPCSNum: TRzNumericEdit;
    lbl4: TLabel;
    frxDesigner1: TfrxDesigner;
    procedure btnPrintTagClick(Sender: TObject);
    procedure edtWOBarKeyPress(Sender: TObject; var Key: Char);
    procedure vePackInfoDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure vePackInfoEditButtonClick(Sender: TObject);
    procedure edtScanPackIDKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitVE(APackID: Integer);virtual;
    procedure GetData(APackID: Integer);virtual;
    function BefortPrintCheck: Boolean;virtual;
  public
    { Public declarations }
    FPrinterCBX: TRzComboBox;
    FPackID: Integer;
    FReportFile: string;
    FPackType: Integer;//0-内箱；1-外箱
    FInPackList: TList<integer>;
    procedure InitPack(APackID: Integer);virtual;
    procedure BeforeSaveToDB; virtual;
    function SaveToDB: Boolean;virtual;
    procedure PrintTag;virtual;
    function GetWOInfoDS(ACds: TClientDataSet): Boolean;virtual;
    procedure OnAfterPickFrm(APickRetValue: string);virtual;
    procedure DesignReportFile;virtual;
  end;
implementation

uses
  uCommFunc, uBaseSinglePickListFrm;

{$R *.dfm}

{ TfrmBasePackPrint_525 }

procedure TfrmBasePackPrint_525.BeforeSaveToDB;
begin

end;



function TfrmBasePackPrint_525.BefortPrintCheck: Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to vePackInfo.RowCount - 1 do
  begin
    if cdsPackType.Locate('ParamName',vePackInfo.Keys[I],[loCaseInsensitive]) then
    begin
      if cdsPackType.FieldByName('NotNull').AsInteger = 1 then
      begin
        if vePackInfo.Values[vePackInfo.Keys[I]].Trim = '' then
        begin
          ShowMessage(cdsPackType.FieldByName('ParamName').AsString + ' 不可以为空');
          Exit;
        end;
      end;

    end;
  end;
  if vePackInfo.FindRow('PCS数量',I) then
  begin
    if StrToIntDef(vePackInfo.Values['PCS数量'],-1) <= 0 then
    begin
      ShowMessage('请确认数量是否正确');
      Exit;
    end;
  end;
  Result := True;
end;

procedure TfrmBasePackPrint_525.btnPrintTagClick(Sender: TObject);
var
  I: Integer;
  LNowTime: TDateTime;
  J: Integer;
  LLinMainFieldArr: TDictionary<Integer,string>;
begin
  inherited;
  if not BefortPrintCheck then Exit;

  LLinMainFieldArr := TDictionary<Integer,string>.create;
  try
  cdsPackType.First;
  while not cdsPackType.Eof do
  begin
    if cdsPackType.FieldByName('LinkMainField').AsString <> '' then
    begin
      if cdsPrintMain.FindField(cdsPackType.FieldByName('LinkMainField').AsString) <> nil then
      begin
        if vePackInfo.FindRow(cdsPackType.FieldByName('ParamName').AsString,J) then
        begin
          LLinMainFieldArr.Add(J,cdsPackType.FieldByName('LinkMainField').AsString);
//          SetLength(LLinMainFieldArr,Length(LLinMainFieldArr)+1);
//          LLinMainFieldArr[High(LLinMainFieldArr)] := cdsPackType.FieldByName('LinkMainField').AsString;
        end;
      end;
    end;
    cdsPackType.Next;
  end;

  LNowTime := gFunc.GetSvrDateTime();
  for I := 0 to edtCreateNum.IntValue - 1 do
  begin
    cdsPrintMain.Append;
    cdsPrintMain.FieldByName('IDKey').AsString := gFunc.CreateIDKey;
    cdsPrintMain.FieldByName('PackID').AsInteger := FPackID;
    cdsPrintMain.FieldByName('PrintTime').AsDateTime := LNowTime;
    cdsPrintMain.FieldByName('D73_Ptr').AsString := gVar.rkey73;
    cdsPrintMain.FieldByName('bPrint').AsInteger := 1;
    for J in LLinMainFieldArr.Keys do
    begin
      cdsPrintMain.FieldByName(LLinMainFieldArr.Items[J]).AsString := Trim(vePackInfo.Values[vePackInfo.Keys[J]]);
    end;
    cdsPrintMain.Post;
    for J := 0 to vePackInfo.RowCount - 1 do
    begin
      if cdsPackType.Locate('ParamName',vePackInfo.Keys[J],[loCaseInsensitive])
      then
      begin
        cdsPrintDetail.Append;
        cdsPrintDetail.FieldByName('MainIDkey').AsString := cdsPrintMain.FieldByName('IDKey').AsString;
        cdsPrintDetail.FieldByName('ParamID').AsInteger := cdsPackType.FieldByName('ParamID').AsInteger;
        cdsPrintDetail.FieldByName('ParamValue').AsString := Trim(vePackInfo.Values[vePackInfo.Keys[J]]);
        cdsPrintDetail.Post;
      end;
    end;
  end;

  BeforeSaveToDB;
  if SaveToDB then
  begin
    PrintTag;
    GetData(FPackID);
  end;

  finally
    LLinMainFieldArr.Free;
  end;
end;

procedure TfrmBasePackPrint_525.DesignReportFile;
begin
  inherited;
  frxReport1.Clear;
  frxReport1.LoadFromFile(FReportFile,True);
  frxReport1.DataSets.Clear;
  frxReport1.DataSets.Add(Self.frxDBDataset1);
//  frxReport1.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Reports\库存管理_成品进出\新包装标签打印\' +  + '.fr3');
  frxReport1.DesignReport();
end;

procedure TfrmBasePackPrint_525.edtScanPackIDKeyPress(Sender: TObject; var Key: Char);
var
  LSql: string;
  LCds: TClientDataSet;
begin
  inherited;
  if Key = #13 then
  begin
    if StrToIntDef(edtScanPackID.Text,-1) < 0 then
    begin
      ShowMessage('无效的内箱条码');
      Exit;
    end;
    if FInPackList.IndexOf(StrToIntDef(edtScanPackID.Text,-1)) > 0 then
    begin
      ShowMessage('请勿重复扫描');
      Exit;
    end else
      FInPackList.Add(StrToIntDef(edtScanPackID.Text,-1));

    if StrToIntDef(vePackInfo.Values['PCS数量'],0) > StrToIntDef(edtMaxPCSNum.Text,-1) then
    begin
      ShowMessage('已经超出设置数量');
      Exit;
    end;


    LSql := StringReplace(UpdateSQL1.InsertSQL.Text,':p1',edtScanPackID.Text,[rfReplaceAll, rfIgnoreCase]);
    LCds := TClientDataSet.Create(Self);
    LCds.DisableControls;
    try
//      if gSvrIntf.IntfGetDataBySql(LSql,LCds) then
//      begin
//        while not LCds.Eof do
//        begin
//          if vePackInfo.Values[LCds.FieldByName('ParamName').AsString].Trim = '' then
//          begin
//            vePackInfo.Values[LCds.FieldByName('ParamName').AsString] := LCds.FieldByName('Param').AsString;
//          end;
//          if cdsPackType.Locate('ParamName',LCds.FieldByName('ParamName').AsString,[loCaseInsensitive]) then
//          begin
//
//
//            if lcds.FieldByName('PackScanCheck').AsString <>  then
//
//          end;
//          if LCds.FieldByName('ParamName').AsString = 'PCS数量' then
//          begin
//            vePackInfo.Values['PCS数量'] := IntToStr(StrToIntDef(vePackInfo.Values['PCS数量'],0) + LCds.FieldByName('ParamValue').AsInteger);
//          end;
//
//          LCds.Next;
//        end;
//      end;
    finally
      LCds.Free;
    end;
  end;
end;

procedure TfrmBasePackPrint_525.edtWOBarKeyPress(Sender: TObject;
  var Key: Char);
var
  LCds: TClientDataSet;
  LDataArr: OleVariant;
  //LSql: string;
  I: Integer;
  LField: TField;
  LAbc36LotNo: string;
begin
  inherited;
  if Key = #13 then
  begin
    edtWOBar.SelectAll;
    LCds := TClientDataSet.Create(Self);
    LCds.DisableControls;
    try
      if not GetWOInfoDS(LCds) then Exit;

      if not LCds.IsEmpty then
      begin
        LDataArr := VarArrayCreate([0,1],varVariant);
        LDataArr[1] := LCds.FieldByName('rkey06').AsInteger;
        if not gSvrIntf.IntfspExec('funcDecToABC36',LDataArr) then
        begin
          Exit;
        end else
        begin
          LAbc36LotNo := VarToStrDef(LDataArr[0],'');
          vePackInfo.Values['LotNo'] := LAbc36LotNo;
        end;

        for I := 0 to vePackInfo.RowCount - 1 do
        begin
          if cdsPackType.Locate('ParamName',vePackInfo.Keys[I],[loCaseInsensitive]) then
          begin
            if cdsPackType.FieldByName('usedefault').AsInteger = 1 then
             Continue;
          end;

          LField := LCds.FindField(vePackInfo.Keys[i]);
          if LField <> nil then
          begin
            vePackInfo.Values[vePackInfo.Keys[i]] := LField.AsString;
          end;
        end;

      end else
      begin
        ShowMessage('没有该作业单信息');
        Exit;
      end;

    finally
      LCds.Free;
    end;
  end;
end;

procedure TfrmBasePackPrint_525.FormCreate(Sender: TObject);
begin
  inherited;
  FInPackList := TList<Integer>.Create;
  //frxReport1.DataSetName := FReportFile;
end;

procedure TfrmBasePackPrint_525.FormDestroy(Sender: TObject);
begin
  inherited;
  FInPackList.Free;
end;

procedure TfrmBasePackPrint_525.GetData(APackID: Integer);
var
  LSqlMain: string;
  LSqlDetail: string;
  LSqlPackType: string;
begin
  FPackID := APackID;
  LSqlMain := 'select * from Pack_PrintMain where 1=0';
  LSqlDetail := 'select * from Pack_PrintDetail where 1=0';
  LSqlPackType := ' select * from Pack_PrintTypeDef where PackID = ' + IntToStr(APackID) +
                  ' order by NotNull Desc,PickID Desc,Seqno ASC,ReadOnly Desc';
  if gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSqlMain,LSqlDetail,LSqlPackType]),[cdsPrintMain,cdsPrintDetail,cdsPackType]) then
  begin

  end;
  cdsPrintMain.DisableControls;
  cdsPrintDetail.DisableControls;
  cdsPackType.DisableControls;
end;

function TfrmBasePackPrint_525.GetWOInfoDS(ACds: TClientDataSet): Boolean;
var
  LSql: string;
begin
  //Result := False;
  LSql := StringReplace(UpdateSQL1.DeleteSQL.Text,':p1',QuotedStr(edtWOBar.Text),[rfReplaceAll, rfIgnoreCase]);
  Result := gSvrIntf.IntfGetDataBySql(LSql,ACds);
end;

procedure TfrmBasePackPrint_525.InitPack(APackID: Integer);
begin
  FPackID := APackID;
  GetData(APackID);
  InitVE(APackID);
end;

procedure TfrmBasePackPrint_525.InitVE(APackID: Integer);
var
  LStrArr: TArray<string>;
  LStr: string;
  LItemPrpo: TItemProp;
begin
  cdsPackType.First;
  while not cdsPackType.Eof do
  begin
    vePackInfo.InsertRow(cdsPackType.FieldByName('ParamName').AsString,cdsPackType.FieldByName('DefaultValue').AsString,True);
    LItemPrpo := vePackInfo.ItemProps[cdsPackType.FieldByName('ParamName').AsString];

    if cdsPackType.FieldByName('dropdownvalues').AsString <> '' then
    begin
      LItemPrpo.EditStyle := esPickList;
      LStrArr := cdsPackType.FieldByName('dropdownvalues').AsString.Split([';']);
      for LStr in LStrArr do
        LItemPrpo.PickList.Add(LStr);
    end else
    if cdsPackType.FieldByName('PickID').AsString <> '' then
    begin
      LItemPrpo.EditStyle := esEllipsis;
    end;

    if cdsPackType.FieldByName('EditMask').AsString <> '' then
    begin
      LItemPrpo.EditMask := cdsPackType.FieldByName('EditMask').AsString;
    end;

    if cdsPackType.FieldByName('Readonly').AsInteger = 1 then
    begin
      LItemPrpo.ReadOnly := True;
    end else
      LItemPrpo.ReadOnly := False;

    cdsPackType.Next;
  end;

end;

procedure TfrmBasePackPrint_525.OnAfterPickFrm(APickRetValue: string);
begin

end;

procedure TfrmBasePackPrint_525.PrintTag;
var
  LSql: string;
  LIDKey: string;
begin
  cdsPrintMain.First;
  while not cdsPrintMain.Eof do
  begin
    if LIDKey = '' then
      LIDKey := '('
    else
      LIDKey := LIDKey + ',';
    LIDKey := LIDKey  + '''' + QuotedStr(cdsPrintMain.FieldByName('IDKey').AsString) + '''';
    cdsPrintMain.Next;
  end;
  LIDKey := LIDKey + ')';
  LSql := StringReplace(cdsPrinter.CommandText,':PPackID',IntToStr(FPackID),[rfReplaceAll, rfIgnoreCase]);
  LSql := StringReplace(LSql,':PIDKey',LIDKey,[rfReplaceAll, rfIgnoreCase]);
  //ShowMessage(LSql);
  if gSvrIntf.IntfGetDataBySql(LSql,cdsPrinter) then
  begin
    frxReport1.Clear;
    frxReport1.LoadFromFile(FReportFile,True);
    frxReport1.DataSets.Clear;
    frxReport1.DataSets.Add(Self.frxDBDataset1);
    frxReport1.PrintOptions.Printer := FPrinterCBX.Items[FPrinterCBX.ItemIndex];
    frxReport1.PrintOptions.ShowDialog := False;
    frxReport1.PrepareReport;
    frxReport1.Print;
  end;
end;



function TfrmBasePackPrint_525.SaveToDB: Boolean;
var
  LData: OleVariant;
begin
  Result := False;
  LData := VarArrayCreate([0,1],varVariant);
  if cdsPrintMain.State in [dsEdit,dsInsert] then cdsPrintMain.Post;
  if cdsPrintDetail.State in [dsEdit,dsInsert] then cdsPrintDetail.Post;

  if cdsPrintMain.ChangeCount > 0 then
    LData[0] := cdsPrintMain.Delta;
  if cdsPrintDetail.ChangeCount > 0 then
    LData[1] := cdsPrintDetail.Delta;

  if gSvrIntf.IntfPostModData('公共基础',FModID,LData) then
  begin
    Result := True;
    cdsPrintMain.MergeChangeLog;
    cdsPrintDetail.MergeChangeLog;
  end;

//  if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['Pack_PrintMain','Pack_PrintDetail']),LData) then
//  begin
//    Result := True;
//    cdsPrintMain.MergeChangeLog;
//    cdsPrintDetail.MergeChangeLog;
//  end;

end;

procedure TfrmBasePackPrint_525.vePackInfoDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  inherited;
  //if ACol = 1 then
  begin
    if cdsPackType.Locate('ParamName',vePackInfo.Keys[ARow],[loCaseInsensitive]) then
    begin
      if cdsPackType.FieldByName('ReadOnly').AsInteger <> 0 then
      begin
        vePackInfo.Canvas.Brush.Color := clMoneyGreen;
      end;
      if cdsPackType.FieldByName('NotNull').AsInteger <> 0 then
      begin
        vePackInfo.Canvas.Font.Color := clRed;
      end;
      vePackInfo.Canvas.FillRect(Rect);
      vePackInfo.canvas.textout(rect.Left+1,rect.Top+1,vePackInfo.cells[Acol,ARow]); //output text
    end;
  end;
end;

procedure TfrmBasePackPrint_525.vePackInfoEditButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
  I: Integer;
  LRow: Integer;
begin
  inherited;
  if cdsPackType.Locate('ParamName',vePackInfo.Keys[vePackInfo.Row],[loCaseInsensitive]) then
  begin
    LFrm := TfrmSinglePickList.Create(Self);
    try
      if LFrm.InitWithPickID(FModID,cdsPackType.fieldbyname('PickID').asinteger) then
      begin
        if LFrm.ShowModal = mrOk then
        begin
          for I := 0 to LFrm.cdsPick.Fields.Count - 1 do
          begin
            if vePackInfo.FindRow(LFrm.cdsPick.Fields[I].FieldName,LRow) then
            begin
              vePackInfo.Cells[1,LRow] := VarToStrDef(LFrm.cdsPick.Fields[I].Value,'');
            end;
          end;
          OnAfterPickFrm(vePackInfo.Cells[1,vePackInfo.Row]);
        end;
      end;
    finally
      LFrm.Free;
    end;
  end;
end;

end.
