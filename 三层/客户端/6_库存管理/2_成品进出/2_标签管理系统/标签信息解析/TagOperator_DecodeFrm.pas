unit TagOperator_DecodeFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseOperatorFrm_Mod531, Vcl.ExtCtrls,
  Vcl.StdCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.Menus, Data.DB,
  Datasnap.DBClient, Bde.DBTables;

type
  TfrmTagOperator_Decode = class(TfrmBaseOperator_Mod531)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    edtScanBar: TLabeledEdit;
    mmo1: TMemo;
    cdsTagDecode: TClientDataSet;
    dsTagDecode: TDataSource;
    pmOperator: TPopupMenu;
    mniTagDecode: TMenuItem;
    pnl6: TPanel;
    mmoDecodeErr: TMemo;
    lbl2: TLabel;
    pnl5: TPanel;
    cbxDB: TComboBox;
    lblLineNum: TLabel;
    btnOperator: TButton;
    lbl1: TLabel;
    ehTagDecode: TDBGridEh;
    mniEXCEL1: TMenuItem;
    mniSumPack: TMenuItem;
    mniClearMemo: TMenuItem;
    mniInStock: TMenuItem;
    mniOutStock: TMenuItem;
    procedure edtScanBarKeyPress(Sender: TObject; var Key: Char);
    procedure mniTagDecodeClick(Sender: TObject);
    procedure btnOperatorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniEXCEL1Click(Sender: TObject);
    procedure mniClearMemoClick(Sender: TObject);
    procedure mniSumPackClick(Sender: TObject);
    procedure mniInStockClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadSvrIni;
    procedure LoadLocalIni;
  public
    { Public declarations }
  end;


implementation

uses
  System.IniFiles, System.StrUtils, uCommFunc, TagOperator_SumPackColumnFrm, TagOperator_SumPackFrm,
  InOutStockFrm_Mod525;

{$R *.dfm}

procedure TfrmTagOperator_Decode.btnOperatorClick(Sender: TObject);
var
  LPoint: TPoint;
begin
  inherited;
  LPoint := pnl5.ClientToScreen(Point(btnOperator.Left + btnOperator.Width,btnOperator.Top));
  if pmoperator.Items.Count > 0 then
    pmoperator.Popup(LPoint.X,LPoint.Y);
end;

procedure TfrmTagOperator_Decode.edtScanBarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    if mmo1.Lines.IndexOf(edtScanBar.Text) = -1 then
    begin
      mmo1.Lines.Add(edtScanBar.Text);
    end;
    lblLineNum.Caption := IntToStr(mmo1.Lines.Count);
    edtScanBar.Text := '';
    edtScanBar.SetFocus;
  end;
end;

procedure TfrmTagOperator_Decode.FormCreate(Sender: TObject);
begin
  inherited;
  LoadSvrIni;
  LoadLocalIni;
end;

procedure TfrmTagOperator_Decode.LoadLocalIni;
var
  Lini: TIniFile;
  LFileName: string;
  LS: TStringList;
  LStr: string;
begin
  LFileName := ExtractFilePath(ParamStr(0)) + 'ClientConfig.ini';
  if not fileexists(LFileName) then
  begin
    ShowMessage('没有找到ClientConfig.ini配置文件，加载INI失败');
    Exit;
  end;

  Lini := TIniFile.Create(LFileName);
  LS := TStringList.Create;
  try
    Lini.ReadSection('LogDB', LS);
    for LStr in LS do
    begin
      if cbxDB.Items.IndexOf(LStr) > 0 then
      begin
        cbxDB.ItemIndex := cbxDB.Items.IndexOf(LStr);
        Break;
      end;
    end;
  finally
    Lini.Free;
    LS.Free;
  end;

end;

procedure TfrmTagOperator_Decode.LoadSvrIni;
var
  Lini: TIniFile;
  LFileName: string;
  LS: TStringList;
  LStr: string;
begin
  LFileName := ExtractFilePath(ParamStr(0)) + 'ERPLauncher.ini';
  if not fileexists(LFileName) then
  begin
    ShowMessage('没有找到ERPLauncher.ini配置文件，加载INI失败');
    Exit;
  end;

  Lini := TIniFile.Create(LFileName);
  LS := TStringList.Create;
  try
    Lini.ReadSectionValues('DBList', LS);
    for LStr in LS do
    begin
      //FDBList.Add(SplitString(LStr, '=')[0], SplitString(LStr, '=')[1]);
      cbxDB.Items.Add(SplitString(LStr, '=')[0]);
    end;
    if cbxDB.Items.Count > 0 then
      cbxDB.ItemIndex := 0;

  finally
    Lini.Free;
    LS.Free;
  end;
end;

procedure TfrmTagOperator_Decode.mniClearMemoClick(Sender: TObject);
begin
  inherited;
  mmo1.Clear;
  mmoDecodeErr.Clear;
  //cdsTagDecode.Close;
  cdsTagDecode.EmptyDataSet;
  //cdsTagDecode.Open;
end;

procedure TfrmTagOperator_Decode.mniEXCEL1Click(Sender: TObject);
begin
  inherited;
  gFunc.Export_dbGridEH_to_Excel(ehTagDecode);
end;

procedure TfrmTagOperator_Decode.mniInStockClick(Sender: TObject);
var
  LFrm: TfrmInOutStock_Mod525;
  I: Integer;
begin
  inherited;
  ShowMessage('暂不支持');
  Exit;
  LFrm := TfrmInOutStock_Mod525.Create(Self);
  try
    LFrm.FType := 0;
    LFrm.FTagDB := cbxDB.Text;
    LFrm.btnPost.Caption := '入库';
    LFrm.cdsDispaly.Data := cdsTagDecode.Data;
    LFrm.lblAllNum.Caption := IntToStr(LFrm.cdsDispaly.RecordCount);
    for I := 0 to LFrm.eh1.Columns.Count - 1 do
      LFrm.eh1.Columns[I].Width := 90;
    if LFrm.ShowModal = mrOk then
    begin

    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmTagOperator_Decode.mniSumPackClick(Sender: TObject);
var
  LFrm: TfrmTagOperator_SumPackColumn;
  I: Integer;
  LField: TFieldDef;
  LCheckField: string;
  LCheckFieldArr: TArray<string>;
  LCheckFieldValueArr: array of string;
begin
  inherited;
  LFrm := TfrmTagOperator_SumPackColumn.Create(Self);
  try
    for I := 0 to cdsTagDecode.Fields.Count - 1 do
    begin
      LFrm.cds1.AppendRecord([False,cdsTagDecode.Fields[I].FieldName]);
    end;
    if LFrm.ShowModal = mrOk then
    begin
      if frmTagOperator_SumPack <> nil then
        FreeAndNil(frmTagOperator_SumPack);
      frmTagOperator_SumPack := TfrmTagOperator_SumPack.Create(Self);

      {$REGION '创建字段'}
      frmTagOperator_SumPack.cdsMain.FieldDefs.Clear;
      frmTagOperator_SumPack.cdsMain.FieldDefs.BeginUpdate;
      LField := frmTagOperator_SumPack.cdsMain.FieldDefs.AddFieldDef;
      LField.Name := 'PackCount';
      LField.DataType := ftInteger;
      lfield.CreateField(frmTagOperator_SumPack.cdsMain);

      LFrm.cds1.First;
      while not LFrm.cds1.Eof do
      begin
        if LFrm.cds1.FieldByName('checked').AsBoolean then
        begin
          LField := frmTagOperator_SumPack.cdsMain.FieldDefs.AddFieldDef;
          LField.Name := LFrm.cds1.FieldByName('SumColumn').AsString;
          LField.DataType := ftString;
          lfield.CreateField(frmTagOperator_SumPack.cdsMain);

          LCheckField := LCheckField + LFrm.cds1.FieldByName('SumColumn').AsString + ';';
          SetLength(LCheckFieldValueArr,Length(LCheckFieldValueArr)+1);
        end;
        LFrm.cds1.Next;
      end;

      frmTagOperator_SumPack.cdsMain.FieldDefs.EndUpdate;
      Delete(LCheckField,Length(LCheckField),1);
      LCheckFieldArr := LCheckField.Split([';']);
      frmTagOperator_SumPack.cdsMain.CreateDataSet;
      frmTagOperator_SumPack.ehMain.DataSource := nil;
      frmTagOperator_SumPack.ehMain.DataSource := frmTagOperator_SumPack.dsMain;
      frmTagOperator_SumPack.cdsMain.Open;
      {$ENDREGION}

      frmTagOperator_SumPack.cdsMain.DisableControls;
      cdsTagDecode.DisableControls;
      try
        cdsTagDecode.First;
        while not cdsTagDecode.Eof do
        begin
          for I := 0 to Length(LCheckFieldArr)-1 do
          begin
            LCheckFieldValueArr[I] := cdsTagDecode.FieldByName(LCheckFieldArr[I]).AsString;
          end;
          if frmTagOperator_SumPack.cdsMain.Locate(LCheckField,LCheckFieldValueArr,[loCaseInsensitive]) then
          begin
            frmTagOperator_SumPack.cdsMain.Edit;
            frmTagOperator_SumPack.cdsMain.FieldByName('PackCount').AsInteger := frmTagOperator_SumPack.cdsMain.FieldByName('PackCount').AsInteger + 1;
            frmTagOperator_SumPack.cdsMain.Post;
            frmTagOperator_SumPack.cdsMain.MergeChangeLog;
          end else
          begin
            frmTagOperator_SumPack.cdsMain.Append;
            frmTagOperator_SumPack.cdsMain.FieldByName('PackCount').AsInteger := 1;
            for I := 0 to Length(LCheckFieldArr)-1 do
            begin
              frmTagOperator_SumPack.cdsMain.FieldByName(LCheckFieldArr[I]).AsString := cdsTagDecode.FieldByName(LCheckFieldArr[I]).AsString;
            end;
            frmTagOperator_SumPack.cdsMain.Post;
            frmTagOperator_SumPack.cdsMain.MergeChangeLog;
          end;
          cdsTagDecode.Next;
        end;
      finally
        frmTagOperator_SumPack.cdsMain.EnableControls;
        cdsTagDecode.EnableControls;
      end;
      frmTagOperator_SumPack.Show;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmTagOperator_Decode.mniTagDecodeClick(Sender: TObject);
var
  LDecodeErr: TArray<string>;
  I: Integer;
begin
  inherited;
  if not gFunc.CheckUserAuth(1,FModID) then Exit;
  mmoDecodeErr.Lines.Clear;
  DecodeTagInfo(cbxDB.Text,mmo1.Lines.ToStringArray,cdsTagDecode,LDecodeErr);
  if Length(LDecodeErr) <> 0 then
  begin
    for I := 0 to Length(LDecodeErr) - 1 do
      mmoDecodeErr.Lines.Add(LDecodeErr[I]);
  end;
  for I := 0 to ehTagDecode.Columns.Count -1 do
  begin
    ehTagDecode.Columns[I].Width := 120;
  end;

end;

end.
