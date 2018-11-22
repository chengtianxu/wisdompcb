unit DeptCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls, DB, ADODB;

type
  TFrm_DeptCode = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit12: TEdit;
    BitBtn7: TBitBtn;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    Label3: TLabel;
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    rkey34,rkey05 : string;
    rkey34_list:string;
    { Public declarations }
  end;

var
  Frm_DeptCode: TFrm_DeptCode;

implementation

uses Damo,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TFrm_DeptCode.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'DEPT_CODE/部门代码/150,DEPT_NAME/部门名称/200';
    InputVar.Sqlstr := 'SELECT RKEY,DEPT_CODE,DEPT_NAME FROM Data0034 WHERE (ACTIVE_FLAG = 0)'+
                       ' and ttype = ''4'''+rkey34_list;
//     ShowMessage(InputVar.Sqlstr);                  
    inputvar.KeyField := 'DEPT_CODE';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.adsPick.IsEmpty then
    begin
      application.MessageBox('没有找到相关的记录!','程序确认',mb_OK+mb_iconstop+mb_systemmodal);
      edit12.SetFocus;
      exit;
    end;
    if frmPick_Item_Single.ShowModal = mrok then
    begin
      Edit12.Text := trim(frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE']);
      label3.Caption := trim(frmPick_Item_Single.adsPick.FieldValues['DEPT_NAME']);
      rkey34 := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
      Edit1.Text := '';
      Label4.Caption := '';
      rkey05 := '';
    end ;
  finally
    frmPick_Item_Single.Free ;
  end;

end;

procedure TFrm_DeptCode.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  if rkey34 = '' then
  begin
    ShowMessage('请先选择部门');
    exit;
  end;
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'USER_LOGIN_NAME/员工代码/150,USER_FULL_NAME/员工姓名/200';
    InputVar.Sqlstr :='SELECT data0073.RKEY, data0073.USER_FULL_NAME, data0073.USER_LOGIN_NAME FROM data0073'+
    ' inner join Data0005 on data0073.EMPLOYEE_PTR = data0005.rkey WHERE (data0005.ACTIVE_FLAG = ''Y'') and data0005.EMPLOYEE_ID = '+rkey34;
    inputvar.KeyField := 'USER_LOGIN_NAME';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit1.Text := trim(frmPick_Item_Single.adsPick.FieldValues['USER_LOGIN_NAME']);
      label4.Caption := trim(frmPick_Item_Single.adsPick.FieldValues['USER_FULL_NAME']);
      rkey05 := frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;
    end ;
  finally
    frmPick_Item_Single.Free ;
  end;

end;

procedure TFrm_DeptCode.Button1Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('请选择信息接收人');
    Exit;
  end;
  ModalResult := mrOk;
end;

end.
