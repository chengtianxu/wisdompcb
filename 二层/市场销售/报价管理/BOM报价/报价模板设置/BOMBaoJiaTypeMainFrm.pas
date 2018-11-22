unit BOMBaoJiaTypeMainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Data.DB, Datasnap.DBClient, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Menus,
  EhLibVCL;

type
  TfrmMainBOMBaoJiaType = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    edtFilter: TEdit;
    ehMain: TDBGridEh;
    cdsMain: TClientDataSet;
    dsMain: TDataSource;
    pm1: TPopupMenu;
    N1: TMenuItem;
    mniN2: TMenuItem;
    mniN3: TMenuItem;
    mniN4: TMenuItem;
    mniCOpy: TMenuItem;
    btnEditReport: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure ehMainTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure mniN2Click(Sender: TObject);
    procedure mniN3Click(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure mniN4Click(Sender: TObject);
    procedure mniCOpyClick(Sender: TObject);
    procedure btnEditReportClick(Sender: TObject);
  private
    { Private declarations }
    FHotColum: TColumnEh;
  public
    { Public declarations }
    procedure GetData;
  end;

var
  frmMainBOMBaoJiaType: TfrmMainBOMBaoJiaType;

implementation

uses
  DBImpl,DataIntf, BOMBaojiaTypeEditFrm, BOMBaoJiaAddNewType, DM, BOMBaoJiaTypeAddGolbParamFrm;

{$R *.dfm}

{ TfrmMainBOMBaoJiaType }

procedure TfrmMainBOMBaoJiaType.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainBOMBaoJiaType.btn2Click(Sender: TObject);
begin
  GetData;
end;

procedure TfrmMainBOMBaoJiaType.btnEditReportClick(Sender: TObject);
var
  LFrm: TfrmBOMBaoJiaTypeAddGolbParam;
begin
  LFrm := TfrmBOMBaoJiaTypeAddGolbParam.Create(Self);
  try
    LFrm.GetData;
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMainBOMBaoJiaType.edtFilterChange(Sender: TObject);
begin
  if FHotColum = nil then FHotColum := ehMain.Columns[0];
  if Trim(UpperCase(edtFilter.Text)) <> '' then
  begin
    if FHotColum.Field.DataType in [ftString, ftWideString] then
    begin
      cdsMain.Filter := FHotColum.FieldName + ' like ''%' + Trim(UpperCase(edtFilter.Text)) + '%''';
      cdsMain.Filtered := True;
    end else
    if FHotColum.Field.DataType in [ftSmallint, ftInteger] then
    begin
      cdsMain.Filter := FHotColum.FieldName + ' >=' + Trim(UpperCase(edtFilter.Text));
      cdsMain.Filtered := True;
    end;

  end else
    cdsMain.Filtered := False;
end;

procedure TfrmMainBOMBaoJiaType.ehMainTitleClick(Column: TColumnEh);
begin
  FHotColum := Column;
  lbl1.Caption := FHotColum.Title.Caption;
end;

procedure TfrmMainBOMBaoJiaType.FormShow(Sender: TObject);
begin
  ehMainTitleClick(ehMain.Columns[0]);
  GetData;
end;

procedure TfrmMainBOMBaoJiaType.GetData;
var
  BP00: IData;
begin
  BP00 := TBP00.Create;
  BP00.SetSql('select * from BomPrice00');
  cdsMain.Data := BP00.GetData;
end;

procedure TfrmMainBOMBaoJiaType.mniCOpyClick(Sender: TObject);
var
  LFrm: TfrmBOMBaoJiaAddNewType;
  LSql: string;
  LCds, lcds2: TClientDataSet;
  LBP00,LBP05,LBP01,LBP15: TClientDataSet;
  LIBP00,LIBP05,LIBP01,LIBP15: IData;
  LTmp: ITmp;
  LTagIDKey: string;
  I: Integer;
  LField: TField;
begin
  LFrm := TfrmBOMBaoJiaAddNewType.Create(Self);
  LCds := TClientDataSet.Create(Self);
  lcds2 := TClientDataSet.Create(Self);
  LBP00 := TClientDataSet.Create(Self);
  LBP01 := TClientDataSet.Create(Self);
  LBP05 := TClientDataSet.Create(Self);
  LBP15 := TClientDataSet.Create(Self);
  LTmp := TTmp.Create;
  LIBP00 := TBP00.Create;
  LIBP01 := TBP01.Create;
  LIBP05 := TBP05.Create;
  LIBP15 := tbp15.Create;
  try
    if LFrm.ShowModal = mrOk then
    begin
      //
      LSql := 'select * from bomprice00 where bpname = ' + QuotedStr(LFrm.edt1.Text);
      LCds.Data := LTmp.SqlOpen(LSql);
      if not LCds.IsEmpty then
      begin
        ShowMessage('已经存在该名称的模板,错误');
        Exit;
      end;

      //
      LIBP00.SetSql('select * from bomprice00 where 1=0');
      LIBP01.SetSql('select * from bomprice01 where 1=0');
      LIBP05.SetSql('select * from bomprice05 where 1=0');
      LIBP15.SetSql('select * from bomprice15 where 1=0');
      LBP00.Data := LIBP00.GetData;
      LBP01.Data := LIBP01.GetData;
      LBP05.Data := LIBP05.GetData;
      LBP15.Data := LIBP15.GetData;

      //bp00
      LTagIDKey := cdsMain.FieldByName('idkey').AsString;
      LCds.Data := LTmp.SqlOpen('select * from bomprice00 where idkey = ' + QuotedStr(LTagIDKey));
      LCds.First;
      while not LCds.Eof do
      begin
        LBP00.Append;
        for I := 0 to LBP00.Fields.Count - 1 do
        begin
          LField := LCds.FindField(LBP00.Fields[I].FieldName);
          if LField <> nil then
            LBP00.Fields[I].Value := LField.Value;
        end;
        LBP00.FieldByName('IDKey').AsString := LIBP00.CreateKeyID;
        lbp00.FieldByName('bpname').AsString := LFrm.edt1.Text;
        LBP00.Post;
        LCds.Next;
      end;

      //BP01

      LCds.Data := LTmp.SqlOpen('select * from bomprice01 where bp00_ptr = ' + QuotedStr(LTagIDKey));
      LCds.First;
      while not LCds.Eof do
      begin
        LBP01.Append;
        for I := 0 to LBP01.Fields.Count - 1 do
        begin
          LField := LCds.FindField(LBP01.Fields[I].FieldName);
          if LField <> nil then
            LBP01.Fields[I].Value := LField.Value;
        end;
        LBP01.FieldByName('IDKey').AsString := LIBP01.CreateKeyID;
        LBP01.FieldByName('bp00_ptr').AsString := LBP00.FieldByName('idkey').AsString;
        LBP01.Post;

        //BP15
        lcds2.Data := LTmp.SqlOpen('select * from bomprice15 where bp01_ptr = ' + QuotedStr(LCds.FieldByName('idkey').AsString));
        lcds2.First;
        while not lcds2.Eof do
        begin
          LBP15.Append;
          for I := 0 to LBP15.Fields.Count - 1 do
          begin
            LField := lcds2.FindField(LBP15.Fields[I].FieldName);
            if LField <> nil then
              LBP15.Fields[I].Value := LField.Value;
          end;
          LBP15.FieldByName('IDKey').AsString := LIBP15.CreateKeyID;
          LBP15.FieldByName('bp00_ptr').AsString := LBP00.FieldByName('idkey').AsString;
          LBP15.FieldByName('bp01_ptr').AsString := LBP01.FieldByName('idkey').AsString;
          LBP15.Post;
          lcds2.Next;
        end;


        LCds.Next;
      end;

      //BP05
      LCds.Data := LTmp.SqlOpen('select * from bomprice05 where bp00_ptr = ' + QuotedStr(LTagIDKey));
      LCds.First;
      while not LCds.Eof do
      begin
        LBP05.Append;
        for I := 0 to LBP05.Fields.Count - 1 do
        begin
          LField := LCds.FindField(LBP05.Fields[I].FieldName);
          if LField <> nil then
            LBP05.Fields[I].Value := LField.Value;
        end;
        LBP05.FieldByName('IDKey').AsString := LIBP05.CreateKeyID;
        LBP05.FieldByName('bp00_ptr').AsString := LBP00.FieldByName('idkey').AsString;
        LBP05.Post;
        LCds.Next;
      end;


      dm1.con1.BeginTrans;

      if not PostdataByInterface(LBP00,LIBP00) then Exit;
      if not PostdataByInterface(LBP01,LIBP01) then Exit;
      if not PostdataByInterface(LBP05,LIBP05) then Exit;
      if not PostdataByInterface(LBP15,LIBP15) then Exit;

      dm1.con1.CommitTrans;

      cdsMain.Append;
      cdsMain.FieldByName('idkey').AsString := LBP00.FieldByName('idkey').AsString;
      cdsMain.FieldByName('bpname').AsString := LBP00.FieldByName('bpname').AsString;
      cdsMain.Post;

      ShowMessage('复制成功');
    end;
  finally
    if dm1.con1.InTransaction then
      dm1.con1.RollbackTrans;
    LFrm.Free;
    LCds.Free;
    lcds2.Free;
    LBP00.Free;
    LBP01.Free;
    LBP05.Free;
    LBP15.Free;
  end;
end;

procedure TfrmMainBOMBaoJiaType.mniN2Click(Sender: TObject);
var
  LFrm: TfrmBomBaoJiaTypeEdit;
begin
  LFrm := TfrmBomBaoJiaTypeEdit.Create(Self);
  LFrm.FIDKey := cdsMain.FieldByName('idkey').AsString;
  try
    LFrm.btn1.Enabled := False;
    LFrm.btn9.Enabled := False;
    LFrm.btn10.Enabled := False;
    LFrm.btn11.Enabled := False;
    LFrm.ehBP01.PopupMenu := nil;
    LFrm.ehBP05.PopupMenu := nil;
    LFrm.GetData(LFrm.FIDKey);
    if LFrm.ShowModal = mrOk then
    begin

    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMainBOMBaoJiaType.mniN3Click(Sender: TObject);
var
  LFrm: TfrmBOMBaoJiaAddNewType;
  IBP00: IData;
begin
  LFrm := TfrmBOMBaoJiaAddNewType.Create(Self);
  try
    if LFrm.ShowModal = mrOk then
    begin
      if cdsMain.Locate('bpname',LFrm.edt1.Text,[loCaseInsensitive]) then
      begin
        ShowMessage('已经存在');
        Exit;
      end;
      IBP00 := TBP00.Create;
      IBP00.SetSql('select * from bomprice00');

      cdsMain.Append;
      cdsMain.FieldByName('idkey').AsString := IBP00.CreateKeyID;
      cdsMain.FieldByName('bpname').AsString := LFrm.edt1.Text;
      cdsMain.Post;

      if PostdataByInterface(cdsMain,IBP00) then
      begin
        ShowMessage('新增成功');
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMainBOMBaoJiaType.mniN4Click(Sender: TObject);
var
  IBP00: IData;
begin
  if MessageBoxA(Handle,'确定要删除吗','提示',mb_yesno) = IDYES then
  begin
    IBP00 := TBP00.Create;
    IBP00.SetSql('select * from bomprice00 where idkey = ' + QuotedStr(cdsMain.FieldByName('idkey').AsString));
    cdsMain.Delete;
    if PostdataByInterface(cdsMain,IBP00) then
    begin
      ShowMessage('删除成功');
    end else
      ShowMessage('删除失败');
  end;
end;

procedure TfrmMainBOMBaoJiaType.N1Click(Sender: TObject);
var
  LFrm: TfrmBomBaoJiaTypeEdit;
begin
  LFrm := TfrmBomBaoJiaTypeEdit.Create(Self);
  LFrm.FIDKey := cdsMain.FieldByName('idkey').AsString;
  try
    LFrm.GetData(LFrm.FIDKey);
    if LFrm.ShowModal = mrOk then
    begin

    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMainBOMBaoJiaType.pm1Popup(Sender: TObject);
begin
  mniN2.Enabled := not cdsMain.IsEmpty;
  n1.Enabled := not cdsMain.IsEmpty;
  mniN4.Enabled := not cdsMain.IsEmpty;
  mniCOpy.Enabled := not cdsMain.IsEmpty;
end;

end.
