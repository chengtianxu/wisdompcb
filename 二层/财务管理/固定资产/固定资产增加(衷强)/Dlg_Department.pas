unit Dlg_Department;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,DB;

type
  TfrmDlg_Department = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtDept: TEdit;
    edtAcctNo: TEdit;
    edtPercent: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Button1: TButton;
    Button2: TButton;
    LabelDept: TLabel;
    LabelAcctName: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edtPercentKeyPress(Sender: TObject; var Key: Char);
    procedure edtPercentChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    rkey_Depart,rKey_Acct:integer;
    procedure Enter(Enter_MOde:byte);
  end;

var
  frmDlg_Department: TfrmDlg_Department;

implementation
uses dm,common,AcctSearch,ConstVar;
{$R *.dfm}

procedure TfrmDlg_Department.SpeedButton1Click(Sender: TObject);
var
  Dept_Code:string;
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields:='Dept_Code/部门代号,Dept_Name/部门名称,ttype/类别';
  FDlgInput.Sqlstr:= 'SELECT rkey,DEPT_CODE, DEPT_NAME,  CASE  WHEN TTYPE = 4 THEN ''部门'' '+
                     'WHEN ttype = 5  THEN ''班组'' else ''工序'' END AS ttype FROM Data0034 '+
                     'where (ACTIVE_FLAG=0) and ((ttype =4) or (COST_DEPT_PTR=rkey)) ';
  FDlgInput.AdoConn := dmcon.ADOConnection1;
  FDlgInput.InPut_value := edtDept.Text;
  FDlgInput.KeyField := 'Dept_code';
  Tmp_rslt:= Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    Dept_Code:= Tmp_rslt
  else
    Dept_Code:= '';//没有取道记录
  edtDept.Text :=Dept_Code;
  if dmcon.aqDepartment.Locate('Dept_Code',Dept_code,[loCaseInsensitive]) then
  begin
    rkey_Depart := dmcon.aqDepartment.fieldByName('rKey').AsInteger;
    LabelDept.Caption := trim(dmcon.aqDepartment.fieldByName('Dept_Name').Asstring);
    if dmcon.ads326.Locate('Dept_ptr',rkey_Depart,[loCaseInsensitive]) then
    begin
      rkey_Depart := 0;
      LabelDept.Caption := '';
      edtDept.Text :='';
      ShowMsg('部门重复,请重新选择!',1);
    end;
  end;
end;

procedure TfrmDlg_Department.SpeedButton2Click(Sender: TObject);
//var
//  Tmpstr:string;
begin
  with TForm_Acct.Create(self) do
  try
    Enter(1);//借方科目
    Edit1.Text := edtAcctNo.Text;
    if ShowModal = mrok then
    begin
      rKey_Acct := ADOQuery1.fieldByName('RKEY').Asinteger;
      edtAcctNo.Text := ADOQuery1.fieldByName('GL_ACC_NUMBER').AsString;
      labelAcctName.Caption :=ADOQuery1.fieldByName('GL_DESCRIPTION').AsString + ADOQuery1.fieldByName('description_2').AsString;
    end;
  finally
    free;
  end;
end;

procedure TfrmDlg_Department.edtPercentKeyPress(Sender: TObject; var Key: Char);
begin
    if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
    if (pos('.',(Sender as TEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (key='-') then abort;
    if Length((Sender as TEdit).text)>0 then
      if (key='-') then abort;
end;

procedure TfrmDlg_Department.Enter(Enter_MOde: byte);
begin
{  sqlstr:=' SELECT dbo.Data0103.RKEY, dbo.Data0103.CURR_TP, dbo.Data0103.CURR_PTR,'+
          ' Data0103.GL_ACC_NUMBER, ISNULL(Data0103_1.GL_DESCRIPTION, '') '+
          ' +'+QuotedStr('-')+'+ Data0103.GL_DESCRIPTION AS description_2,'+
          ' Data0103_2.GL_DESCRIPTION FROM dbo.Data0103 Data0103_2 RIGHT OUTER JOIN '+
          ' dbo.Data0103 Data0103_1 ON Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN '+
          ' dbo.Data0103 ON Data0103_1.RKEY = dbo.Data0103.PARENT_PTR WHERE (dbo.Data0103.HAS_CHILD = 0) ';
  MyDataClass.OpenQuery(dmcon.qryTmp,sqlstr);}
  edtPercent.Text :='100';
  if Enter_MOde=em_add then exit;
  if dmcon.ads326.IsEmpty then exit;
//  if not dmcon.qryTmp.Locate('rKey)
  rkey_Depart:= dmcon.ads326.fieldByName('Dept_ptr').AsInteger;
  LabelDept.Caption := dmcon.ads326.fieldByName('Dept_Name').AsString;
  edtDept.Text := dmcon.aqDepartment.fieldByName('Dept_code').AsString;

  rKey_Acct :=dmcon.ads326.fieldByName('FACCU_DEPT_GL_PTR').AsInteger;
  edtAcctNo.Text := dmcon.aqAcctItem.fieldByName('GL_ACC_NUMBER').AsString;
  LabelAcctName.Caption :=dmcon.aqAcctItem.fieldByName('description_2').AsString;
  edtPercent.Text :=dmcon.ads326.fieldByName('PERCENTS').AsString;
end;

procedure TfrmDlg_Department.edtPercentChange(Sender: TObject);
begin
  if trim(edtPercent.Text)='' then exit;
  if (StrToFloat(edtPercent.Text)>100) or (StrToFloat(edtPercent.Text)<1) then
  begin
    ShowMsg('百分比必须在1~100之间',1);
    abort;
  end;
end;

procedure TfrmDlg_Department.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Canclose:=true;
  if ModalResult = mrok then
  begin
    if trim(edtPercent.Text)='' then
    begin
      ShowMsg('百分比不能为空',1);
      canclose:=false;
      exit;
    end;
    if (StrToFloat(edtPercent.Text)>100) or (StrToFloat(edtPercent.Text)<1) then
    begin
      ShowMsg('百分比必须在1~100之间',1);
      canclose:=false;
      exit;
    end;

    if trim(edtDept.Text)='' then
    begin
      ShowMsg('部门不能为空',1);
      canclose:=false;
      exit;
    end;
    if trim(edtAcctNo.Text)='' then
    begin
      ShowMsg('折旧科目不能为空',1);
      canclose:=false;
      exit;
    end;
  end;
end;

end.
