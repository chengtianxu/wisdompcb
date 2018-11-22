unit editFrm_mod67;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm,uCommFunc, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls,SelUserFrm_mod67, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBCtrlsEh, Data.DB, Data.Win.ADODB,
  Vcl.Menus, Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit;

type
  Tfrmedit_mod67 = class(TfrmBaseEdit)
    pnl3: TPanel;
    eh275: TDBGridEh;
    ds94: TDataSource;
    cds94: TClientDataSet;
    qrytemp: TADOQuery;
    ds275: TDataSource;
    cds275: TClientDataSet;
    rg_Type: TRadioGroup;
    rg_method: TRadioGroup;
    lbl5: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edt_ACode: TRKeyRzBtnEdit;
    edt_ADesc: TRKeyRzBtnEdit;
    edt_ADept: TRKeyRzBtnEdit;
    qrytempLOWER_LIMIT: TFloatField;
    qrytempUPPER_LIMIT: TFloatField;
    qrytempUSER_FULL_NAME: TStringField;
    qrytempUSER_LOGIN_NAME: TStringField;
    pm275: TPopupMenu;
    MenuItem1: TMenuItem;
    mnDel: TMenuItem;
    mniEdit: TMenuItem;
    procedure MenuItem1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure mnDelClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FEditType:integer;
    procedure GetUser(AFrm: TFrmSelUser_mod67);
    procedure GetData(ARkey:string);
  end;

var
  frmedit_mod67: Tfrmedit_mod67;

implementation

{$R *.dfm}

procedure Tfrmedit_mod67.btnCloseClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure Tfrmedit_mod67.btnSaveClick(Sender: TObject);
var
LPostData:OleVariant;
i:integer;
Lcds94_Save, Lcds275_Save:Tclientdataset;
LSql94,Lsql275:string;
begin
  inherited;
 if Trim(edt_ACode.text)='' then
 begin
  ShowMessage('编码不能为空！');
  edt_ACode.SetFocus;
  exit;
 end;

 if Trim(edt_ADesc.text)='' then
 begin
  ShowMessage('说明不能为空！');
  edt_ADesc.SetFocus;
  exit;
 end;

 if cds275.IsEmpty  then
 begin
 ShowMessage('请选择对应的需求人员！');
 Exit;
 end;
   Lcds94_Save:= TClientDataSet.Create(nil);
   Lcds275_Save:= TClientDataSet.Create(nil);

  try
    if FEditType =4 then
    begin
      Lsql94:='select * From data0094 where 1=2';
      Lsql275:='select * From data0275 where 1=2';
      if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql94, Lsql275]), [Lcds94_Save, Lcds275_Save]) then exit;

        Lcds94_Save.append;
        Lcds94_Save.FieldByName('IDKEy').Value := gFunc.CreateIDKey;
        Lcds94_Save.FieldByName('PURCHASE_APPROV_DESC').Value :=Trim(edt_ADesc.Text);
        Lcds94_Save.FieldByName('code').Value :=trim(edt_ACode.Text);
        Lcds94_Save.FieldByName('dept_ptr').Value :=cds94.FieldByName('dept_ptr').AsInteger;
        Lcds94_Save.FieldByName('type').Value :=rg_Type.ItemIndex;
        Lcds94_Save.FieldByName('mode').Value :=rg_method.ItemIndex;
        Lcds94_Save.Post;

        cds275.DisableControls;
        cds275.first;
        while not  cds275.Eof do
        begin
        Lcds275_Save.append;
        Lcds275_Save.FieldByName('d94_IDKey').Value:=Lcds94_Save.FieldByName('IDKey').Value;
        Lcds275_Save.FieldByName('USER_PTR').Value:=cds275.FieldByName('USER_PTR').Value;
        Lcds275_Save.FieldByName('LOWER_LIMIT').Value:=cds275.FieldByName('LOWER_LIMIT').Value;
        Lcds275_Save.FieldByName('UPPER_LIMIT').Value:=cds275.FieldByName('UPPER_LIMIT').Value;
        Lcds275_Save.Post;
        cds275.Next;
        end;

        LPostData := varArrayCreate([0, 1], varVariant);
        LPostData[0] := Lcds94_Save.Delta;
        LPostData[1] := Lcds275_Save.Delta;

          if gSvrIntf.IntfPostModData('公共基础', 67, LPostData,1) then
          begin
            Lcds94_Save.MergeChangeLog;
            Lcds275_Save.MergeChangeLog;
            showmessage('保存成功');
            self.ModalResult:=mrok;
           end;
    end
    else
    begin
    cds94.Edit;

    if FEditType =1 then
    cds94.FieldByName('IDKEy').Value := gFunc.CreateIDKey;

    cds94.FieldByName('type').value:=rg_Type.ItemIndex;
    cds94.FieldByName('mode').value:=rg_method.ItemIndex;
    cds94.Post;

      cds275.DisableControls;
      cds275.first;
      while not  cds275.Eof do
      begin
      cds275.Edit;
      cds275.FieldByName('d94_IDKey').Value:=cds94.FieldByName('IDKey').Value;
      if cds275.FieldByName('LOWER_LIMIT').asstring= '' then
       cds275.FieldByName('LOWER_LIMIT').value:=0;
      if cds275.FieldByName('UPPER_LIMIT').asstring= '' then
       cds275.FieldByName('UPPER_LIMIT').value:=0;
      cds275.Post;
      cds275.Next;
      end;

      LPostData := varArrayCreate([0, 1], varVariant);
    if cds94.ChangeCount > 0 then
      LPostData[0] := cds94.Delta;
    if cds275.ChangeCount > 0 then
      LPostData[1] := cds275.Delta;


    if gSvrIntf.IntfPostModData('公共基础', 67, LPostData,1) then
    begin
      cds94.MergeChangeLog;
      cds275.MergeChangeLog;
      showmessage('保存成功');
     self.ModalResult:=mrok;
    end;
   end;
  finally
    cds275.EnableControls;
    Lcds94_Save.free;
    Lcds275_Save.Free;
  end;
end;

procedure Tfrmedit_mod67.GetData(ARkey: string);
var
  Lsql94,Lsql275: string;
begin

  Lsql94 := 'select * from data0094 where rkey = ' + ARkey;
  Lsql275 :='SELECT   dbo.Data0275.*, '+
' dbo.Data0073.USER_FULL_NAME, dbo.Data0073.USER_LOGIN_NAME'+
' FROM  dbo.Data0275 INNER JOIN'+
' dbo.Data0073 ON dbo.Data0275.USER_PTR = dbo.Data0073.RKEY'+
' where data0275.AUTH_GROUP_PTR='+ ARkey;

  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql94, Lsql275]), [cds94, cds275]) then
    exit;

end;

procedure Tfrmedit_mod67.GetUser(AFrm: TFrmSelUser_mod67);
begin
AFrm.cdsPick.Filtered:=false;
 AFrm.cdsPick.Filter:='  IsSelected=1';
 AFrm.cdsPick.Filtered:=True;

 if  AFrm.cdsPick.IsEmpty then exit;

 AFrm.cdsPick.first;
 while not AFrm.cdsPick.eof do
 begin
 cds275.Append;
 cds275.FieldByName('USER_PTR').Value:=AFrm.cdsPick.FieldByName('rkey').Value;
 cds275.FieldByName('USER_LOGIN_NAME').Value:=AFrm.cdsPick.FieldByName('USER_LOGIN_NAME').Value;
 cds275.FieldByName('USER_FULL_NAME').Value:=AFrm.cdsPick.FieldByName('USER_FULL_NAME').Value;
 cds275.Post;
 AFrm.cdsPick.Next;
 end;

end;

procedure Tfrmedit_mod67.MenuItem1Click(Sender: TObject);
var
Lfrm:  TFrmSelUser_mod67;
Ls,LUserStr:string;
begin
  inherited;

    Ls := '';
  if not cds275.IsEmpty  then
  begin
    cds275.First;
    while not cds275.Eof do
    begin
      Ls := Ls + cds275.FieldByName('USER_PTR').AsString + ',';
      cds275.Next;
    end;
  end;

  if Ls = '' then
    LUserStr := ''
  else
    LUserStr := ' and rkey not in ' + '(' + Ls + '-1)';

  // if Lfrm = nil then
  LFrm:=TFrmSelUser_mod67.Create(self);

  try
  Lfrm.FParentCallBack:=GetUser;
  Lfrm.InitWithPickID(25, 0, LUserStr);
  Lfrm.ShowModal;
  finally
   Lfrm.Free;
  end;

end;

procedure Tfrmedit_mod67.mnDelClick(Sender: TObject);
begin
  inherited;
  if cds275.isempty  then exit;

  cds275.delete;
end;

procedure Tfrmedit_mod67.mniEditClick(Sender: TObject);
var
Lfrm:  TFrmSelUser_mod67;
Ls,LUserStr:string;
begin
  inherited;


  if   cds275.IsEmpty  then   exit;

  LUserStr := ' and rkey ='+cds275.FieldByName('USER_PTR').AsString;


  LFrm:=TFrmSelUser_mod67.Create(self);

  try
  Lfrm.FParentCallBack:=GetUser;
  Lfrm.InitWithPickID(25, 0, LUserStr);
  Lfrm.ShowModal;
  finally
   Lfrm.Free;
  end;

end;

end.


