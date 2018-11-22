unit BOMBaoJia2Dtable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, DM, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  Vcl.Menus, DataIntf, EhLibVCL;

type
  TfrmBOMBaoJiaEdit2Dtable = class(TForm)
    pnl1: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    eh1: TDBGridEh;
    cdsBP12: TClientDataSet;
    dsBP12: TDataSource;
    strngfldBP12IDKey: TStringField;
    strngfldBP12TName: TStringField;
    intgrfldBP12XCount: TIntegerField;
    intgrfldBP12YCount: TIntegerField;
    intgrfldBP12VType: TIntegerField;
    pm1: TPopupMenu;
    mniNew: TMenuItem;
    mniEdit: TMenuItem;
    mniDele: TMenuItem;
    intgrfldBP12Xtype: TIntegerField;
    intgrfldBP12Ytype: TIntegerField;
    intgrfldBP12YVType: TIntegerField;
    mniView: TMenuItem;
    procedure pm1Popup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniNewClick(Sender: TObject);
    procedure mniDeleClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniViewClick(Sender: TObject);
  private
    { Private declarations }
    IBP12: IData;
  public
    { Public declarations }
    procedure GetData();
  end;

var
  frmBOMBaoJiaEdit2Dtable: TfrmBOMBaoJiaEdit2Dtable;

implementation

uses
  DBImpl, BOMBaoJiaAdd2DTableFrm, BOMBaoJia2DTableEditFrm, WZ_gUnit;

{$R *.dfm}

procedure TfrmBOMBaoJiaEdit2Dtable.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmBOMBaoJiaEdit2Dtable.btn2Click(Sender: TObject);
begin
  GetData;
end;

procedure TfrmBOMBaoJiaEdit2Dtable.FormCreate(Sender: TObject);
begin
  IBP12 := TBP12.Create;
end;

procedure TfrmBOMBaoJiaEdit2Dtable.FormShow(Sender: TObject);
begin
  GetData;
end;

procedure TfrmBOMBaoJiaEdit2Dtable.GetData;
begin
  IBP12.SetSql('select * from bomprice12');
  cdsBP12.Data := IBP12.GetData;
end;

procedure TfrmBOMBaoJiaEdit2Dtable.mniNewClick(Sender: TObject);
var
  LFrm: TfrmBOMBaoJiaAdd2dTable;
begin
  LFrm := TfrmBOMBaoJiaAdd2dTable.Create(Self);
  try
    if LFrm.ShowModal = mrOk then
    begin
      if cdsBP12.Locate('TName',LFrm.edt1.Text,[loCaseInsensitive]) then
      begin
        ShowMessage('已经存在相同表明,保存失败');
        Exit;
      end;
      cdsBP12.Append;
      cdsBP12.FieldByName('IDKey').AsString := IBP12.CreateKeyID;
      cdsBP12.FieldByName('TName').AsString := LFrm.edt1.Text;
      cdsBP12.Post;
      if IBP12.PostData(cdsBP12.Delta) then
      begin
        ShowMessage('保存成功');
        cdsBP12.MergeChangeLog;
        GetData;
      end else
        ShowMessage('保存失败');
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBOMBaoJiaEdit2Dtable.mniEditClick(Sender: TObject);
var
  LFrm: TfrmBOMBaoJia2DTableEdit;
begin
  LFrm := TfrmBOMBaoJia2DTableEdit.Create(Self);
  try
    LFrm.FIDKey := cdsBP12.FieldByName('idkey').AsString;
    LFrm.FCol := cdsBP12.FieldByName('XCount').AsInteger;
    LFrm.FRow := cdsBP12.FieldByName('YCount').AsInteger;
    LFrm.se1.Value := LFrm.FRow;
    LFrm.se2.Value := LFrm.FCol;
    LFrm.rgXValueType.ItemIndex := cdsBP12.FieldByName('xvtype').AsInteger;
    LFrm.rgYValueType.ItemIndex := cdsBP12.FieldByName('Yvtype').AsInteger;
    lfrm.cbxXType.ItemIndex := cdsbp12.FieldByName('Xtype').AsInteger;
    lfrm.cbxYtype.ItemIndex := cdsbp12.FieldByName('YType').asinteger;
    if LFrm.ShowModal = mrOk then
    begin
      cdsBP12.Edit;
      cdsBP12.FieldByName('XCount').AsInteger := LFrm.sg1.ColCount;
      cdsBP12.FieldByName('YCount').AsInteger := LFrm.sg1.RowCount;
      cdsBP12.FieldByName('Xvtype').AsInteger := LFrm.rgXValueType.ItemIndex;
      cdsBP12.FieldByName('Yvtype').AsInteger := LFrm.rgYValueType.ItemIndex;
      cdsbp12.FieldByName('Xtype').AsInteger := lfrm.cbxXType.ItemIndex;
      cdsbp12.FieldByName('YType').asinteger := lfrm.cbxYtype.ItemIndex;
      cdsBP12.Post;
      if PostdataByInterface(cdsBP12,IBP12) then
        cdsBP12.MergeChangeLog;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBOMBaoJiaEdit2Dtable.mniDeleClick(Sender: TObject);
begin
  if MessageBoxA(Handle,'确定删除吗','提示',MB_YESNO) = IDYES then
  begin
    cdsBP12.Delete;
    if IBP12.PostData(cdsBP12.Delta) then
    begin
      ShowMessage('删除成功');
      cdsBP12.MergeChangeLog;
    end else
      ShowMessage('删除失败');
  end;
end;

procedure TfrmBOMBaoJiaEdit2Dtable.mniViewClick(Sender: TObject);
var
  LFrm: TfrmBOMBaoJia2DTableEdit;
begin
  LFrm := TfrmBOMBaoJia2DTableEdit.Create(Self);
  try
    LFrm.FIDKey := cdsBP12.FieldByName('idkey').AsString;
    LFrm.FCol := cdsBP12.FieldByName('XCount').AsInteger;
    LFrm.FRow := cdsBP12.FieldByName('YCount').AsInteger;
    LFrm.se1.Value := LFrm.FRow;
    LFrm.se2.Value := LFrm.FCol;
    LFrm.rgXValueType.ItemIndex := cdsBP12.FieldByName('xvtype').AsInteger;
    LFrm.rgYValueType.ItemIndex := cdsBP12.FieldByName('Yvtype').AsInteger;
    lfrm.cbxXType.ItemIndex := cdsbp12.FieldByName('Xtype').AsInteger;
    lfrm.cbxYtype.ItemIndex := cdsbp12.FieldByName('YType').asinteger;
    LFrm.btn1.Enabled := False;
    if LFrm.ShowModal = mrOk then
    begin

    end;
  finally
    LFrm.Free;
  end;
end;
procedure TfrmBOMBaoJiaEdit2Dtable.pm1Popup(Sender: TObject);
begin
  mniEdit.Enabled := not cdsBP12.IsEmpty;
  mniDele.Enabled := not cdsBP12.IsEmpty;

  mniEdit.Enabled := gUser.User_Permit = '4';
  mniNew.Enabled := gUser.User_Permit = '4';
  mniDele.Enabled := gUser.User_Permit = '4';

end;

end.
