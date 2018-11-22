unit form_budget1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  Tform_budget = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn4: TBitBtn;
    btn_save: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     user_pt,warehouse_pt:Integer;
     status : Integer;
     deptcod:Integer;

  end;

var
  form_budget: Tform_budget;

implementation

uses demo,ConstVar,common,Pick_Item_Single;

{$R *.dfm}

procedure Tform_budget.BitBtn1Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  try
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'USER_LOGIN_NAME/用户代码/160,USER_FULL_NAME/用户名称/250';
    InputVar.Sqlstr := 'select Rkey, USER_FULL_NAME,USER_LOGIN_NAME from data0073 '+
                      'where USER_GROUP_FLAG=1 and ACTIVE_FLAG=0 '+
                      'order by USER_LOGIN_NAME';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit1.Text:=frmPick_Item_Single.adsPick.FieldValues['USER_LOGIN_NAME'];
      Label2.Caption:=frmPick_Item_Single.adsPick.FieldValues['USER_FULL_NAME'];
      Edit1.Tag:=frmPick_Item_Single.adsPick.FieldValues['Rkey'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure Tform_budget.BitBtn2Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  try
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'GROUP_NAME/工序代码/160,GROUP_DESC/工序名称/250';
    InputVar.Sqlstr :='select Rkey,GROUP_NAME,GROUP_DESC from dbo.data0496 order by GROUP_NAME';
    inputvar.KeyField:='GROUP_NAME';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit3.Text:=frmPick_Item_Single.adsPick.FieldValues['GROUP_NAME'];
      Label4.Caption:=frmPick_Item_Single.adsPick.FieldValues['GROUP_DESC'];
      Edit3.Tag:=frmPick_Item_Single.adsPick.FieldValues['Rkey'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure Tform_budget.btn_saveClick(Sender: TObject);
var
  ssql:string;

begin
  if (Trim(Edit1.Text)='') then
  begin
    ShowMsg('请选择用户代码！',1);
    Exit;
  end;
  if (Trim(Edit3.Text)='') then
  begin
    ShowMsg('请选择材料类别代码！',1);
    Exit;
  end;
  with DM.ADOQuery1 do
  begin
    Close;

    sql.clear;
    SQL.Text := 'select csi_ptr,GROUP_PTR from data0552 where csi_ptr='+IntToStr(edit1.Tag)+
    ' and  GROUP_PTR='+IntToStr(edit3.Tag);
    Open;
    if not IsEmpty then
    begin
      ShowMessage('记录已存在！');
      Exit;
    end;
  end;
  if status=0 then
  begin


    with DM.ADOQuery1 do
    begin
      Close;
      sql.clear;
      SQL.Text := 'insert into data0552(csi_ptr,GROUP_PTR)'+
      ' values('+IntToStr(edit1.Tag)+ ','+IntToStr(edit3.Tag)+')';
      ExecSQL;
      user_pt:=edit1.Tag;
      warehouse_pt := edit3.Tag;
    end;
    ModalResult := mrOk;
  end
  else
  if status=1 then
  begin


    with dm.ADOQuery1 do
    begin
      Close;
      sql.clear;
      SQL.Text := 'update data0552 set csi_ptr='+IntToStr(edit1.Tag)+',GROUP_PTR='+IntToStr(edit3.tag)+' where csi_ptr='+dm.ads0552csi_ptr.AsString+
      ' and GROUP_PTR='+DM.ads0552GROUP_PTR.AsString;
      ExecSQL;
      user_pt:=edit1.Tag;
      deptcod := edit3.tag;
    end;
    ModalResult :=mrOk;
  end;

end;

procedure Tform_budget.FormShow(Sender: TObject);
begin
  if status =1 then
  begin
    Edit1.Text := DM.ads0552USER_LOGIN_NAME.Value;
    Edit1.Tag := dm.ads0552csi_ptr.Value;
    Label2.Caption:=DM.ads0552USER_FULL_NAME.Value;
    Edit3.Text := DM.ads0552GROUP_NAME.Value;
    Edit3.Tag := DM.ads0552GROUP_PTR.Value;
    Label4.Caption := DM.ads0552GROUP_DESC.Value;

  end;
end;

end.
