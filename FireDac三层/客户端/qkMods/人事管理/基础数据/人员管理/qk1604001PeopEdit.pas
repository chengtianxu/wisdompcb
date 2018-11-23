unit qk1604001PeopEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseEditFrm, RzTabs, RzButton,
  Vcl.ExtCtrls, RzPanel, RzDBEdit, Vcl.StdCtrls, Vcl.Mask, RzEdit, Data.DB,
  RzLabel, RzCommon, RzDBBnEd, RzRadGrp, RzDBRGrp, RzRadChk, RzDBChk, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, qkSvrIntf.ClientIntf,qkFunc.Commfunc, qkBasePickFrm,
  Vcl.DBCtrls, RzCmboBx, RzDBCmbo, EhLibVCL, DBCtrlsEh, Vcl.ExtDlgs,  Vcl.Imaging.jpeg,
  Vcl.Buttons;

type
  Tfrmqk1604001PeopEdit = class(Tfrmqkbaseedit)
    pnl1: TPanel;
    pnl2: TPanel;
    pgc1: TRzPageControl;
    tsTabSheet1: TRzTabSheet;
    dsPeop: TDataSource;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl1: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    edtPeopIDCode: TRzDBButtonEdit;
    edtChsName: TRzDBEdit;
    rgSex: TRzDBRadioGroup;
    dtpIDCardEnableTime: TRzDBDateTimeEdit;
    edtDeptName: TRzDBButtonEdit;
    edtIDCard: TRzDBButtonEdit;
    lbl9: TLabel;
    dtpbirthday: TRzDBDateTimeEdit;
    lbl10: TLabel;
    edtChsName1: TRzDBEdit;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    cbxnation: TRzDBComboBox;
    btn1: TRzButton;
    dtpbirthday1: TRzDBDateTimeEdit;
    dtpLocal_ondutyTime: TRzDBDateTimeEdit;
    lbl8: TLabel;
    lbl14: TLabel;
    edtEngName: TRzDBEdit;
    edtEngName1: TRzDBEdit;
    lbl15: TLabel;
    mmoBakNote: TRzDBMemo;
    lbl16: TLabel;
    cbxnation1: TRzDBComboBox;
    dtpLocal_BeTrueDatetime: TRzDBDateTimeEdit;
    lbl17: TLabel;
    lbl18: TLabel;
    cbxEduLv: TRzDBComboBox;
    cbxmarriage: TRzDBComboBox;
    lbl19: TLabel;
    lbl20: TLabel;
    edtChsName2: TRzDBEdit;
    lblOnOff: TLabel;
    dsPhoto: TDataSource;
    mtPhoto: TFDMemTable;
    dlgOpenPic1: TOpenPictureDialog;
    img1: TImage;
    tsTabSheet3: TRzTabSheet;
    lbl63: TLabel;
    lbl71: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl64: TLabel;
    lbl62: TLabel;
    lbl61: TLabel;
    lbl60: TLabel;
    lbl72: TLabel;
    lbl69: TLabel;
    lbl68: TLabel;
    lbl65: TLabel;
    lbl66: TLabel;
    lbl67: TLabel;
    lbl70: TLabel;
    lbl43: TLabel;
    lbl49: TLabel;
    lbl48: TLabel;
    lbl47: TLabel;
    lbl46: TLabel;
    lbl45: TLabel;
    lbl44: TLabel;
    lbl42: TLabel;
    lbl41: TLabel;
    lbl40: TLabel;
    edt_RecoCompany: TRzDBEdit;
    edt_RecoAddr: TRzDBEdit;
    edt_recoTel: TRzDBEdit;
    edt_recoName: TRzDBEdit;
    edt_AssTel: TRzDBEdit;
    edt_AssName: TRzDBEdit;
    edt_AddrCard: TRzDBEdit;
    edt_Rsight: TRzDBEdit;
    edt_Lsight: TRzDBEdit;
    edt_BandNo: TRzDBEdit;
    edt_BankName: TRzDBEdit;
    edt_Height: TRzDBEdit;
    edt_school: TRzDBEdit;
    edt_major: TRzDBEdit;
    edt_lag: TRzDBEdit;
    edt_Csocs: TRzDBEdit;
    edt_socs: TRzDBEdit;
    edt_PFund: TRzDBEdit;
    edt_RPName: TRzDBEdit;
    edt_RPTel: TRzDBEdit;
    edt_RPAddr: TRzDBEdit;
    edt_RPRelation: TRzDBEdit;
    pgc2: TRzPageControl;
    tsTabSheet2: TRzTabSheet;
    cbxBloodType: TRzDBComboBox;
    tsTabSheet4: TRzTabSheet;
    mmoHistory: TRzDBMemo;
    dtpEduDate: TRzDBDateTimeEdit;
    lbl23: TLabel;
    edtWorkName: TRzDBButtonEdit;
    cbxActiveERP: TRzDBCheckBox;
    mtgSysUser: TFDMemTable;
    mtSysUserMod: TFDMemTable;
    dsgSysUser: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure mt1adsfValidate(Sender: TField);
    procedure mt2adsfValidate(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure edtDeptNameButtonClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure dsPhotoDataChange(Sender: TObject; Field: TField);
    procedure edtWorkNameButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FDsGPeop: TFDMemTable;
    FEditType: Integer;//0-新增。1-编辑  2-查看
    function CheckgIDCardExist(AIDCard: string): Boolean;
    function SaveCheck: boolean;
    function CreateNewGH: string;//新工号
    function SetRightsWithDept: Boolean;
  end;


implementation

uses
  qkBasePickFrmTree, System.Generics.Collections, System.StrUtils;

{$R *.dfm}

procedure Tfrmqk1604001PeopEdit.btn1Click(Sender: TObject);
var
  LBlob: TBlobField;
begin
  inherited;
  if dlgOpenPic1.Execute(Self.Handle) then
  begin
    if qkCommfunc.GetFileSize(dlgOpenPic1.FileName) > 1024 * 100 then
    begin
      raise Exception.Create('上传的图片大小最大不能超过100K');
    end;
    LBlob := mtPhoto.FieldByName('Photo') as TBlobField;
    mtPhoto.Edit;
    LBlob.LoadFromFile(dlgOpenPic1.FileName);
    mtPhoto.Post;
  end;
end;

procedure Tfrmqk1604001PeopEdit.btnCloseClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure Tfrmqk1604001PeopEdit.btnSaveClick(Sender: TObject);
begin
  if not qkCommfunc.CheckErrChar(FDsGPeop.FieldByName('PeopIDCode').AsString) then exit;
  if not SaveCheck then
    Exit;

  {$REGION 'HR'}
  qkCommfunc.SetCurrIDKey(FDsGPeop);
  qkCommfunc.SetFK(mtPhoto,FDsGPeop.FieldByName('IDKey').AsLargeInt);
  {$ENDREGION}

  {$REGION 'ERP权限'}
  if FEditType = 0 then //新增
  begin
    if mtgSysUser.IsEmpty then
      mtgSysUser.Append
    else
      mtgSysUser.Edit;
    mtgSysUser.FieldByName('LoginName').AsString := FDsGPeop.FieldByName('PeopIDCode').AsString;
    mtgSysUser.FieldByName('HRPeopIDkey').AsString := FDsGPeop.FieldByName('IDkey').AsString;
    mtgSysUser.FieldByName('FullName').AsString := FDsGPeop.FieldByName('CHSname').AsString;
    mtgSysUser.FieldByName('PassWord').AsString := qkCommfunc.MD5Print(FDsGPeop.FieldByName('PeopIDCode').AsString);
    mtgSysUser.FieldByName('FullName').AsString := FDsGPeop.FieldByName('CHSname').AsString;
    qkCommfunc.SetCurrIDKey(mtgSysUser);
    mtgSysUser.Post;
  end else
  begin
    if mtgSysUser.FieldByName('LoginName').AsString <> FDsGPeop.FieldByName('PeopIDCode').AsString then
    begin
      mtgSysUser.Edit;
      mtgSysUser.FieldByName('LoginName').AsString := FDsGPeop.FieldByName('PeopIDCode').AsString;
      mtgSysUser.Post;
    end;
  end;
  qkCommfunc.SetFK(mtSysUserMod,mtgSysUser.FieldByName('IDKey').AsLargeInt,'UserIDKey');

  {$ENDREGION}
  inherited;
end;

function Tfrmqk1604001PeopEdit.CheckgIDCardExist(AIDCard: string): Boolean;
begin
  qkTmp.mtfree;
  qkDataIntf.GetTableData(qkTmp.mt,'gHR_Peop', ' IDCard = ' + AIDCard.QuotedString);
  Result := not qkTmp.mt.IsEmpty;
end;


function Tfrmqk1604001PeopEdit.CreateNewGH: string;
var
  LSeed: string;
begin
  qkTmp.ClearAll;
  qkTmp.Dslst := dmSvrIntf.SqlOpen('3',qkTmp.Pms);
  if qkTmp.Dslst = nil then
    exit;

  lseed := qkTmp.Dslst[0].FieldByName('GH').AsString;
  Result := LSeed;
end;

procedure Tfrmqk1604001PeopEdit.dsPhotoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  qkCommfunc.LoadPictureFromField(TBlobField(mtPhoto.FieldByName('Photo')),img1.Picture);
end;

procedure Tfrmqk1604001PeopEdit.edtDeptNameButtonClick(Sender: TObject);
var
  LFrm: TfrmqkBasepickTree;
begin
  inherited;
  if not FDsGPeop.ReadOnly then
  begin
    LFrm := TfrmqkBasepickTree.Create(Self);
    try
      if LFrm.InitPick(88880003) then
      begin
        FDsGPeop.Edit;
        FDsGPeop.FieldByName('Local_DeptIDKey').Value := LFrm.RetKey;
        FDsGPeop.FieldByName('DeptName').Value := LFrm.RetDisplay;
        FDsGPeop.FieldByName('workname').AsString := '';
        FDsGPeop.FieldByName('local_deptWorkIDkey').Value := null;
        FDsGPeop.Post;
      end;
    finally
      lfrm.Free;
    end;
  end;
end;


procedure Tfrmqk1604001PeopEdit.edtWorkNameButtonClick(Sender: TObject);
var
  LFrm: TfrmqkBasepick;
begin
  inherited;
  if not FDsGPeop.ReadOnly then
  begin
    LFrm := TfrmqkBasepick.Create(Self);
    try
      if LFrm.InitPick(88880001,FDsGPeop.FieldByName('local_deptIDKey').AsLargeInt.ToString) then
      begin
        FDsGPeop.Edit;
        FDsGPeop.FieldByName('Local_DeptWorkIDKey').Value := LFrm.RetKey;
        FDsGPeop.FieldByName('workName').Value := LFrm.RetDisplay;
        FDsGPeop.Post;
      end;
    finally
      lfrm.Free;
    end;
  end;
end;

procedure Tfrmqk1604001PeopEdit.FormCreate(Sender: TObject);
begin
  inherited;
  FDsGPeop := qkCommfunc.CreateDS(Self);
  dsPeop.DataSet := FDsGPeop;

  PostTableArr := 'gHR_Peop;gHR_Peop_Photo;gSys_User;Sys_User_Mod';
  PostDsList.Add(FDsGPeop);
  PostDsList.Add(mtPhoto);
  PostDsList.Add(mtgSysUser);
  PostDsList.Add(mtSysUserMod);
end;

procedure Tfrmqk1604001PeopEdit.FormShow(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  pgc1.ActivePageIndex := 0;
  for I := 0 to FDsGPeop.Fields.Count - 1 do
    FDsGPeop.Fields[I].OnValidate := mt1adsfValidate;
  for I := 0 to mtPhoto.Fields.Count - 1 do
    mtPhoto.Fields[I].OnValidate := mt2adsfValidate;
  if FDsGPeop.FieldByName('Local_Status').AsInteger = 1 then
  begin
    lblOnOff.Caption := '在职';
  end else
  if FDsGPeop.FieldByName('Local_Status').AsInteger = 1 then
  begin
    lblOnOff.Caption := '离职';
  end else
    lblOnOff.Caption := '';
end;

procedure Tfrmqk1604001PeopEdit.mt1adsfValidate(Sender: TField);
begin
  inherited;
  if Sender.FieldName = 'IDCard' then
  begin
    if FEditType = 0 then //新增
    begin
      if CheckgIDCardExist(Sender.AsString) then
      begin
        raise Exception.Create('身份证号码已经存在');
        Exit;
      end;
    end;
    //编辑
    if FEditType = 1 then
    begin
      if CheckgIDCardExist(Sender.AsString) then
      begin
        raise Exception.Create('身份证号码已经存在');
        Exit;
      end;
    end;
  end;
  if (Sender.FieldName = 'Local_DeptWorkIDKey') and (Sender.Value <> null) then
  begin
    if MessageBox(Handle,'是否将权限设置为该岗位权限','提示',MB_YESNO) = IDYES then
    begin
      SetRightsWithDept;
    end;
  end;
end;

procedure Tfrmqk1604001PeopEdit.mt2adsfValidate(Sender: TField);
begin
  //
end;

function Tfrmqk1604001PeopEdit.SaveCheck: boolean;
begin
  Result := False;

  if FDsGPeop.FieldByName('Local_DeptIDKey').AsLargeInt = 0 then
  begin
    ShowMessage('请选择部门');
    Exit;
  end;
  if FDsGPeop.FieldByName('Local_DeptWorkIDKey').AsLargeInt = 0 then
  begin
    ShowMessage('请选择岗位');
    Exit;
  end;
  if FDsGPeop.FieldByName('IDCard').AsString = '' then
  begin
    ShowMessage('身份证号码不能为空');
    Exit;
  end;
  if FDsGPeop.FieldByName('PeopIDCode').AsString = '' then
  begin
    ShowMessage('工号不能为空');
    Exit;
  end;
  if FDsGPeop.FieldByName('birthday').AsFloat = 0 then
  begin
    ShowMessage('出生日期不能为空');
    Exit;
  end;
  if FDsGPeop.FieldByName('Local_ondutyTime').AsFloat = 0 then
  begin
    ShowMessage('入职日期不能为空');
    Exit;
  end;
  if FDsGPeop.FieldByName('Local_BeTrueDatetime').AsFloat = 0 then
  begin
    ShowMessage('转正日期不能为空');
    Exit;
  end;
  Result := True;
end;

function Tfrmqk1604001PeopEdit.SetRightsWithDept: Boolean;
var
  LDsList: TList<TFDMemTable>;
  Lpms: TFDParams;
begin
  Result := False;
  LDsList := nil;
  Lpms := TFDParams.Create;
  try
    with Lpms.Add do
    begin
      Name := 'p1';
      Value := FDsGPeop.FieldByName('Local_DeptWorkIDKey').AsLargeInt;
    end;
    LDsList := dmSvrIntf.SqlOpen('5',Lpms);
    if LDsList = nil then
      exit;
    while not mtSysUserMod.IsEmpty do
      mtSysUserMod.Delete;
    LDsList[0].First;
    while not LDsList[0].Eof do
    begin
      mtSysUserMod.Append;
      mtSysUserMod.FieldByName('ModIDKey').AsLargeInt := LDsList[0].FieldByName('ModIDKey').AsLargeInt;
      mtSysUserMod.FieldByName('ModRights').AsString := LDsList[0].FieldByName('ModRights').AsString;
      mtSysUserMod.FieldByName('BLike').AsInteger := 1;
      mtSysUserMod.Post;
      LDsList[0].Next;
    end;
    Result := True;
  finally
    Lpms.Free;
    qkCommfunc.ReleaseDsList(LDsList);
  end;
end;

end.
