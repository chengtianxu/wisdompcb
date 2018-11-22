unit BOMBaoJiaDeptMainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Vcl.Menus, Data.DB, Datasnap.DBClient, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, DM,
  Datasnap.Provider, EhLibVCL;

type
  TfrmMainBOMBaoJiaDept = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    edtFilter: TEdit;
    ehMain: TDBGridEh;
    cdsMain: TClientDataSet;
    dsMain: TDataSource;
    pm1: TPopupMenu;
    mniEdit: TMenuItem;
    mniN2: TMenuItem;
    strngfldMainIDKey: TStringField;
    intgrfldMainD34_ptr: TIntegerField;
    strngfldMainDEPT_CODE: TStringField;
    strngfldMainDEPT_NAME: TStringField;
    mniNew: TMenuItem;
    btn3: TBitBtn;
    strngfldMainP2: TStringField;
    strngfldMainP3: TStringField;
    strngfldMainP4: TStringField;
    strngfldMainP5: TStringField;
    pm2: TPopupMenu;
    mniN4: TMenuItem;
    mniN5: TMenuItem;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure ehMainTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mniNewClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniN2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure mniN4Click(Sender: TObject);
    procedure mniN5Click(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
  private
    { Private declarations }
    FHotColum: TColumnEh;
  public
    { Public declarations }
    procedure GetData;
  end;

var
  frmMainBOMBaoJiaDept: TfrmMainBOMBaoJiaDept;

implementation
uses
  DBImpl,DataIntf, Pick_Item_Single, BOMBaoJiaDeptEditFrm, BOMBaoJia2Dtable,
  BOMBaoJiaCommonCalcstrFrm, WZ_gUnit;

{$R *.dfm}

{ TfrmMainBOMBaoJiaDept }

procedure TfrmMainBOMBaoJiaDept.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainBOMBaoJiaDept.btn2Click(Sender: TObject);
begin
  GetData;
end;

procedure TfrmMainBOMBaoJiaDept.btn3Click(Sender: TObject);
begin
  pm2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmMainBOMBaoJiaDept.edtFilterChange(Sender: TObject);
begin
  if FHotColum = nil then FHotColum := ehMain.Columns[0];
  if Trim(edtFilter.Text) <> '' then
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

procedure TfrmMainBOMBaoJiaDept.ehMainTitleClick(Column: TColumnEh);
begin
  FHotColum := Column;
  lbl1.Caption := FHotColum.Title.Caption;
end;

procedure TfrmMainBOMBaoJiaDept.FormShow(Sender: TObject);
begin
  ehMainTitleClick(ehMain.Columns[0]);
  GetData;
end;

procedure TfrmMainBOMBaoJiaDept.GetData;
var
  IBP02: IData;
  lsql: string;
begin
  lsql := ' select bp02.*,d34.DEPT_CODE,d34.DEPT_NAME from BOMPrice02 bp02 ' +
          ' INNER JOIN data0034 d34 ON d34.RKEY = bp02.D34_ptr ' +
          ' order by d34.DEPT_CODE asc' ;
  IBP02 := TBP02.Create;
  IBP02.SetSql(lsql);
  cdsMain.Data := IBP02.GetData;
end;

procedure TfrmMainBOMBaoJiaDept.mniEditClick(Sender: TObject);
var
  LFrm: TfrmBOMBaoJiaDeptEdit;
begin
  LFrm := TfrmBOMBaoJiaDeptEdit.Create(Self);
  try
    LFrm.FIDKey := cdsMain.FieldByName('idkey').AsString;
    LFrm.FD34_Ptr := cdsMain.FieldByName('d34_ptr').AsString;
    if LFrm.ShowModal = mrOk then
    begin
      btn2Click(btn2);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMainBOMBaoJiaDept.mniN2Click(Sender: TObject);
var
  LFrm: TfrmBOMBaoJiaDeptEdit;
begin
  LFrm := TfrmBOMBaoJiaDeptEdit.Create(Self);
  try
    LFrm.FIDKey := cdsMain.FieldByName('idkey').AsString;
    LFrm.FD34_Ptr := cdsMain.FieldByName('d34_ptr').AsString;
    LFrm.btn1.Enabled := False;
    LFrm.cdsbp02.ReadOnly := True;
    LFrm.mniEditParem.Enabled :=False;
    LFrm.mniEditCaiLiao.Enabled := False;
    //LFrm.eh1.PopupMenu := nil;
    //LFrm.eh2.PopupMenu := nil;
    if LFrm.ShowModal = mrOk then
    begin

    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMainBOMBaoJiaDept.mniNewClick(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
  IBP02: IData;
  LCds: TClientDataSet;

  LTmp: ITmp;
  LCdsTmp: TClientDataSet;
begin
  LIn.Fields := 'dept_code/工序代码/150,dept_name/工序名称/150';
  LIn.Sqlstr := 'select data0034.rkey as rkey34,dept_code,Dept_name from data0034 where ttype = 1 and ACTIVE_FLAG = 0' ;
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  LCds := TClientDataSet.Create(Self);
  LCdsTmp := TClientDataSet.Create(Self);
  LTmp := TTmp.Create;
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      LCdsTmp.Data := LTmp.SqlOpen('select 1 from bomprice02 where d34_ptr = ' +  LFrm.adsPick1.FieldByName('rkey34').AsString);
      if not LCdsTmp.IsEmpty then
      begin
        ShowMessage('已经存在相同工序');
        Exit;
      end;

//      if cdsMain.Locate('d34_ptr',LFrm.adsPick1.FieldByName('rkey34').AsInteger,[loCaseInsensitive]) then
//      begin
//        ShowMessage('已经存在相同工序');
//        Exit;
//      end;

      IBP02 := TBP02.Create;
      IBP02.SetSql('select * from bomprice02 where idkey is null');
      LCds.Data := IBP02.GetData;

      LCds.Append;
      LCds.FieldByName('idkey').AsString := IBP02.CreateKeyID;
      LCds.FieldByName('d34_ptr').AsInteger := LFrm.adsPick1.FieldByName('rkey34').AsInteger;
      LCds.Post;

      if IBP02.PostData(LCds.Delta) then
      begin
        ShowMessage('保存成功');
        btn2Click(btn2);
      end else
        ShowMessage('保存失败');

    end;
  finally
    LFrm.Free;
    LCds.Free;
  end;
end;

procedure TfrmMainBOMBaoJiaDept.mniN4Click(Sender: TObject);
var
  LFrm: TfrmBOMBaoJiaEdit2Dtable;
begin
  LFrm := TfrmBOMBaoJiaEdit2Dtable.Create(Self);
  try
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMainBOMBaoJiaDept.mniN5Click(Sender: TObject);
var
  LFrm: TfrmBOMBaoJiaCommonCalcstr;
begin
  LFrm := TfrmBOMBaoJiaCommonCalcstr.Create(Self);
  lfrm.btn1.Enabled := gUser.User_Permit = '4';
  try
    LFrm.GetData;
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMainBOMBaoJiaDept.pm1Popup(Sender: TObject);
begin
  mniEdit.Enabled := gUser.User_Permit = '4';
  mniNew.Enabled := gUser.User_Permit = '4';
end;

end.
