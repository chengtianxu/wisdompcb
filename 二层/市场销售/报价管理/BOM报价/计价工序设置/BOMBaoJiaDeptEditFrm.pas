unit BOMBaoJiaDeptEditFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, Vcl.ExtCtrls, RzPanel, RzTabs,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh, Data.DB, Datasnap.DBClient,DM, Datasnap.Provider,DataIntf,
  Vcl.Menus, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzDBEdit, RzLabel, Vcl.DBCtrls,
  EhLibVCL;

type
  TfrmBOMBaoJiaDeptEdit = class(TForm)
    RzPanel1: TRzPanel;
    btn1: TRzButton;
    btn2: TRzButton;
    pg1: TRzPageControl;
    ts1: TRzTabSheet;
    ts2: TRzTabSheet;
    ts3: TRzTabSheet;
    eh1: TDBGridEh;
    cdsbp03: TClientDataSet;
    dsbp03: TDataSource;
    strngfldcdsbp03IDKey: TStringField;
    strngfldcdsbp03BP02_ptr: TStringField;
    intgrfldcdsbp03D34_ptr: TIntegerField;
    intgrfldcdsbp03D278_ptr: TIntegerField;
    strngfldcdsbp03Param_Value: TStringField;
    strngfldcdsbp03param_code: TStringField;
    strngfldcdsbp03param_name: TStringField;
    strngfldcdsbp03unitcode: TStringField;
    strngfldcdsbp03datatype: TStringField;
    pm1: TPopupMenu;
    mniNewParam: TMenuItem;
    mniEditParem: TMenuItem;
    mniDeleParam: TMenuItem;
    eh2: TDBGridEh;
    cdsBP04: TClientDataSet;
    dsBP04: TDataSource;
    pm2: TPopupMenu;
    mniNewCaiLiao: TMenuItem;
    mniEditCaiLiao: TMenuItem;
    mniDeleCailiao: TMenuItem;
    strngfldBP04IDKey: TStringField;
    strngfldBP04BP02_ptr: TStringField;
    intgrfldBP04D34_ptr: TIntegerField;
    intgrfldBP04D496_ptr: TIntegerField;
    strngfldBP04calcstr: TStringField;
    strngfldBP04groupname: TStringField;
    strngfldBP04groupdesc: TStringField;
    lbl1: TRzLabel;
    cdsbp02: TClientDataSet;
    dsbp02: TDataSource;
    lbl2: TRzLabel;
    lbl3: TRzLabel;
    lbl4: TRzLabel;
    strngfldcdsbp02IDKey: TStringField;
    intgrfldcdsbp02D34_ptr: TIntegerField;
    strngfldcdsbp02P2: TStringField;
    strngfldcdsbp02P3: TStringField;
    strngfldcdsbp02P4: TStringField;
    strngfldcdsbp02P5: TStringField;
    lbl5: TLabel;
    mmoP3: TRzDBMemo;
    mmoP4: TRzDBMemo;
    mmoP5: TRzDBMemo;
    mmoP6: TRzDBMemo;
    strngfldBP04MP_calcstr: TStringField;
    cdsbp03color: TStringField;
    mniView: TMenuItem;
    mniViewCaiLiao: TMenuItem;
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniNewParamClick(Sender: TObject);
    procedure mniEditParemClick(Sender: TObject);
    procedure mniDeleParamClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure mniNewCaiLiaoClick(Sender: TObject);
    procedure mniEditCaiLiaoClick(Sender: TObject);
    procedure mniDeleCailiaoClick(Sender: TObject);
    procedure cdsbp03AfterScroll(DataSet: TDataSet);
    procedure mniViewClick(Sender: TObject);
    procedure mniViewCaiLiaoClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure pm2Popup(Sender: TObject);
  private
    { Private declarations }
    IBP03: IData;
    IBP04: IData;
    IBP02: IData;
  public
    { Public declarations }
    FIDKey: string;
    FD34_Ptr: string;
    procedure GetData;
  end;

var
  frmBOMBaoJiaDeptEdit: TfrmBOMBaoJiaDeptEdit;

implementation
uses
  DBImpl,Pick_Item_Single, BOMBaoJiaDeptAddParamFrm, BOMBaoJiaDeptEditAddMGroup, WZ_gUnit;
{$R *.dfm}

procedure TfrmBOMBaoJiaDeptEdit.btn1Click(Sender: TObject);
begin
  dm1.con1.BeginTrans;
  try
    if not PostdataByInterface(cdsbp02,IBP02) then Exit;
    if not PostdataByInterface(cdsbp03,IBP03) then Exit;
    if not PostdataByInterface(cdsbp04,IBP04) then Exit;

    dm1.con1.CommitTrans;
    cdsbp02.MergeChangeLog;
    cdsBP03.MergeChangeLog;
    cdsBP04.MergeChangeLog;
    ShowMessage('保存成功');
    ModalResult := mrOk;
  finally
    if dm1.con1.InTransaction then
    begin
      dm1.con1.RollbackTrans;
      ShowMessage('保存失败');
    end;
  end;
end;

procedure TfrmBOMBaoJiaDeptEdit.btn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmBOMBaoJiaDeptEdit.cdsbp03AfterScroll(DataSet: TDataSet);
var
  Ltmp: ITmp;
  LCds: TClientDataSet;
begin
  LCds := TClientDataSet.Create(Self);
  Ltmp := TTmp.Create;
  try
    LCds.Data := Ltmp.SqlOpen('select tvalue from data0338 where parameter_ptr=' + IntToStr(cdsbp03.FieldByName('d278_ptr').AsInteger));
    eh1.Columns[4].PickList.Clear;
    while not LCds.Eof do
    begin
      eh1.Columns[4].PickList.Add(lcds.FieldByName('tvalue').AsString);
      LCds.Next;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmBOMBaoJiaDeptEdit.FormCreate(Sender: TObject);
begin
  IBP03 := TBP03.Create;
  IBP04 := TBP04.Create;
  IBP02 := TBP02.Create;
end;

procedure TfrmBOMBaoJiaDeptEdit.FormShow(Sender: TObject);
begin
  pg1.ActivePageIndex := 0;
  GetData;
  btn1.Enabled := gUser.User_Permit = '4';
end;

procedure TfrmBOMBaoJiaDeptEdit.GetData;
begin
  IBP02.SetSql('select * from bomprice02 where idkey = ' + QuotedStr(FIDKey));
  cdsbp02.Data := IBP02.GetData;
  IBP03.SetSql('select * from bomprice03 where bp02_ptr = ' + QuotedStr(FIDKey) + ' order by d278_ptr asc');
  cdsbp03.Data := IBP03.GetData;
  IBP04.SetSql('select * from bomprice04 where bp02_ptr = ' + QuotedStr(FIDKey) + ' order by d496_ptr asc');
  cdsBP04.Data := IBP04.GetData;
end;

procedure TfrmBOMBaoJiaDeptEdit.mniNewCaiLiaoClick(Sender: TObject);
var
  LFrm: TfrmBOMBaoJiaDeptEditMGroup;
begin
  LFrm := TfrmBOMBaoJiaDeptEditMGroup.Create(Self);
  try
    if LFrm.ShowModal = mrOk then
    begin
      if cdsbp04.Locate('d496_ptr',LFrm.edt1.Tag,[loCaseInsensitive]) then
      begin
        ShowMessage('请勿重复添加材料');
        Exit;
      end;

      cdsbp04.Append;
      cdsbp04.FieldByName('idkey').AsString := IBP04.CreateKeyID;
      cdsbp04.FieldByName('bp02_ptr').AsString := FIDKey;
      cdsbp04.FieldByName('d34_ptr').AsString := FD34_Ptr;
      cdsbp04.FieldByName('d496_ptr').AsInteger := LFrm.edt1.Tag;
      cdsbp04.FieldByName('calcstr').AsString := LFrm.mmoUseCalc.Text;
      cdsbp04.FieldByName('MP_calcstr').AsString := LFrm.mmoMPCalc.Text;
      cdsbp04.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBOMBaoJiaDeptEdit.mniEditCaiLiaoClick(Sender: TObject);
var
  LFrm: TfrmBOMBaoJiaDeptEditMGroup;
begin
  LFrm := TfrmBOMBaoJiaDeptEditMGroup.Create(Self);
  try
    LFrm.btn1.Visible := False;
    LFrm.edt1.Tag := cdsbp04.FieldByName('d496_ptr').AsInteger;
    LFrm.edt1.Text := cdsBP04.FieldByName('groupdesc').AsString;
    LFrm.mmoUseCalc.Text := cdsbp04.FieldByName('calcstr').AsString;
    LFrm.mmoMPCalc.Text := cdsbp04.FieldByName('MP_calcstr').AsString;
    if LFrm.ShowModal = mrOk then
    begin
      cdsbp04.Edit;
      cdsbp04.FieldByName('calcstr').AsString := LFrm.mmoUseCalc.Text;
      cdsbp04.FieldByName('MP_calcstr').AsString := LFrm.mmoMPCalc.Text;
      cdsbp04.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBOMBaoJiaDeptEdit.mniDeleCailiaoClick(Sender: TObject);
begin
  cdsBP04.Delete;
end;

procedure TfrmBOMBaoJiaDeptEdit.mniNewParamClick(Sender: TObject);
var
  LFrm: TfrmBOMBaoJiaDeptAddParam;
begin
  LFrm := TfrmBOMBaoJiaDeptAddParam.Create(Self);
  try
    if LFrm.ShowModal = mrOk then
    begin
      if cdsbp03.Locate('d278_ptr',LFrm.edt1.Tag,[loCaseInsensitive]) then
      begin
        ShowMessage('请勿重复添加参数');
        Exit;
      end;

      cdsbp03.Append;
      cdsbp03.FieldByName('idkey').AsString := IBP03.CreateKeyID;
      cdsbp03.FieldByName('bp02_ptr').AsString := FIDKey;
      cdsbp03.FieldByName('d34_ptr').AsString := FD34_Ptr;
      cdsbp03.FieldByName('d278_ptr').AsInteger := LFrm.edt1.Tag;
      cdsbp03.FieldByName('param_value').AsString := LFrm.edt2.Text;
      cdsbp03.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBOMBaoJiaDeptEdit.mniEditParemClick(Sender: TObject);
var
  LFrm: TfrmBOMBaoJiaDeptAddParam;
begin
  LFrm := TfrmBOMBaoJiaDeptAddParam.Create(Self);
  try
    LFrm.btn1.Visible := False;
    LFrm.edt1.Tag :=  cdsbp03.FieldByName('d278_ptr').AsInteger;
    LFrm.edt1.Text := cdsbp03.FieldByName('param_code').AsString;
    LFrm.edt2.Text := cdsbp03.FieldByName('param_value').AsString;
    if LFrm.ShowModal = mrOk then
    begin
      cdsbp03.Edit;
      cdsbp03.FieldByName('param_value').AsString := LFrm.edt2.Text;
      cdsbp03.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBOMBaoJiaDeptEdit.mniDeleParamClick(Sender: TObject);
begin
  cdsbp03.Delete;
end;

procedure TfrmBOMBaoJiaDeptEdit.mniViewCaiLiaoClick(Sender: TObject);
var
  LFrm: TfrmBOMBaoJiaDeptEditMGroup;
begin
  LFrm := TfrmBOMBaoJiaDeptEditMGroup.Create(Self);
  try
    LFrm.btn1.Visible := False;
    LFrm.edt1.Tag := cdsbp04.FieldByName('d496_ptr').AsInteger;
    LFrm.edt1.Text := cdsBP04.FieldByName('groupdesc').AsString;
    LFrm.mmoUseCalc.Text := cdsbp04.FieldByName('calcstr').AsString;
    LFrm.mmoMPCalc.Text := cdsbp04.FieldByName('MP_calcstr').AsString;
    LFrm.btn2.Enabled := False;
    if LFrm.ShowModal = mrOk then
    begin

    end;
  finally
    LFrm.Free;
  end;
end;
procedure TfrmBOMBaoJiaDeptEdit.mniViewClick(Sender: TObject);
var
  LFrm: TfrmBOMBaoJiaDeptAddParam;
begin
  LFrm := TfrmBOMBaoJiaDeptAddParam.Create(Self);
  try
    LFrm.btn1.Visible := False;
    LFrm.edt1.Tag :=  cdsbp03.FieldByName('d278_ptr').AsInteger;
    LFrm.edt1.Text := cdsbp03.FieldByName('param_code').AsString;
    LFrm.edt2.Text := cdsbp03.FieldByName('param_value').AsString;
    LFrm.btn2.Enabled := False;
    if LFrm.ShowModal = mrOk then
    begin
//      cdsbp03.Edit;
//      cdsbp03.FieldByName('param_value').AsString := LFrm.edt2.Text;
//      cdsbp03.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBOMBaoJiaDeptEdit.pm1Popup(Sender: TObject);
begin
  if gUser.User_Permit <> '4' then
  begin
    mniNewParam.Enabled := False;
    mniDeleParam.Enabled := False;
    mniEditParem.Enabled := False;
  end;
end;

procedure TfrmBOMBaoJiaDeptEdit.pm2Popup(Sender: TObject);
begin
  if gUser.User_Permit <> '4' then
  begin
    mniNewCaiLiao.Enabled := False;
    mniEditCaiLiao.Enabled := False;
    mniDeleCailiao.Enabled := False;
  end;
end;

end.
