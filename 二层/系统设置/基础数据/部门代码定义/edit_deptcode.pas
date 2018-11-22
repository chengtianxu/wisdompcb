unit edit_deptcode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DB, ADODB;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    aped_fg: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label6: TLabel;
    BitBtn5: TBitBtn;
    Label7: TLabel;
    Edit2: TEdit;
    Label8: TLabel;
    BitBtn3: TBitBtn;
    Label9: TLabel;
    DBCheckBox3: TDBCheckBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
  private
    { Private declarations }
   function find_depttype5(flag:byte;deptcode:string):boolean;
   function find_acctgl(flag:byte;ACC_NUMBER:string):boolean;
   function number_error(number: string): boolean;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses damo, acct_search, deptcode_search,common;

{$R *.dfm}

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
 with Tform_deptcode.Create(Application) do
try
  maskedit1.Text:=self.Edit2.Text;
  if adoquery1.IsEmpty then
   ShowMsg('没有找到相应的部门代码',1)
  else
  if Showmodal=mrok then
  begin
   self.edit2.Text:=ADOQuery1DEPT_CODE.Value;
   self.label9.Caption:=ADOQuery1DEPT_NAME.Value;
   dm.AQ34BIG_DEPT_PTR.Value:=ADOQuery1rkey.Value;
   self.edit1.SetFocus;
  end
  else
   self.edit2.SetFocus;
finally
 form_deptcode.Free;
end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
 with Tform_acct.Create(Application) do
try
  edit1.Text:=self.Edit1.Text;
  if adoquery1.IsEmpty then
   ShowMsg('没有找到相应的会计科目',1)
  else
  if Showmodal=mrok then
  begin
   self.edit1.Text:=ADOQuery1GL_ACC_NUMBER.Value;
   self.label7.Caption:=ADOQuery1gl_desc.Value;
   dm.AQ34GL_ACCT_PTR.Value:=ADOQuery1rkey.Value;
  end
  else
   self.Edit1.SetFocus;
finally
 form_acct.Free;
end;
end;

function TForm2.find_depttype5(flag:byte;deptcode: string): boolean;
var
 sql:string;
begin
if flag=0 then
 sql:='select rkey,dept_code,dept_name from data0034'+#13+
      'where ttype=''4'' and dept_code='+QuotedStr(deptcode)
else
 sql:='select rkey,dept_code,dept_name from data0034'+#13+
      'where ttype=''4'' and rkey='+deptcode;

 OpenQuery(dm.ADOQuery1,sql);
 if dm.ADOQuery1.IsEmpty then
  result:=false
 else
  result:=true;
end;

function TForm2.find_acctgl(flag:byte;ACC_NUMBER: string): boolean;
var
 sql:string;
begin
if  flag=0 then
 sql:='SELECT dbo.Data0103.RKEY, Data0103.GL_ACC_NUMBER,'+#13+
'case when data0103_2.GL_DESCRIPTION is not null then'+#13+
  'data0103_2.GL_DESCRIPTION+''-''+'+#13+
  'data0103_1.GL_DESCRIPTION+''-''+data0103.GL_DESCRIPTION'+#13+
'else'+#13+
 'case when data0103_1.GL_DESCRIPTION is not null then'+#13+
   'data0103_1.GL_DESCRIPTION+''-''+data0103.GL_DESCRIPTION'+#13+
  'else data0103.GL_DESCRIPTION'+#13+
  'end end as gl_desc'+#13+
'FROM dbo.Data0103 Data0103_2 RIGHT OUTER JOIN'+#13+
      'dbo.Data0103 Data0103_1 ON'+#13+
      'Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN'+#13+
      'dbo.Data0103 ON Data0103_1.RKEY = dbo.Data0103.PARENT_PTR'+#13+
'WHERE dbo.Data0103.HAS_CHILD = 0'+#13+
      'and  Data0103.GL_ACC_NUMBER='+ QuotedStr(ACC_NUMBER)
else
 sql:='SELECT dbo.Data0103.RKEY, Data0103.GL_ACC_NUMBER,'+#13+
'case when data0103_2.GL_DESCRIPTION is not null then'+#13+
  'data0103_2.GL_DESCRIPTION+''-''+'+#13+
  'data0103_1.GL_DESCRIPTION+''-''+data0103.GL_DESCRIPTION'+#13+
'else'+#13+
 'case when data0103_1.GL_DESCRIPTION is not null then'+#13+
   'data0103_1.GL_DESCRIPTION+''-''+data0103.GL_DESCRIPTION'+#13+
  'else data0103.GL_DESCRIPTION'+#13+
  'end end as gl_desc'+#13+
'FROM dbo.Data0103 Data0103_2 RIGHT OUTER JOIN'+#13+
      'dbo.Data0103 Data0103_1 ON'+#13+
      'Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN'+#13+
      'dbo.Data0103 ON Data0103_1.RKEY = dbo.Data0103.PARENT_PTR'+#13+
'WHERE dbo.Data0103.HAS_CHILD = 0'+#13+
      'and  Data0103.rkey='+ ACC_NUMBER;

 OpenQuery(dm.ADOQuery1,sql);
 if dm.ADOQuery1.IsEmpty then
  result:=false
 else
  result:=true;
end;

procedure TForm2.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (trim(edit2.Text)<>'') then
 begin
  if self.find_depttype5(0,trim(edit2.Text)) then
  begin
   label9.Caption:=dm.ADOQuery1.FieldValues['dept_name'];
   dm.AQ34BIG_DEPT_PTR.Value:=dm.ADOQuery1.FieldValues['rkey'];
  end
  else
   begin
    ShowMsg('没有找到相应的部门代码',1);
    edit2.SetFocus;
   end;
 end
else
 if (activecontrol.Name<>'BitBtn3') and (trim(edit2.Text)='') then
  dm.AQ34BIG_DEPT_PTR.AsVariant:=null;
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn5') and (trim(edit1.Text)<>'') then
 begin
  if self.find_acctgl(0,trim(edit1.Text)) then
  begin
   label7.Caption:=dm.ADOQuery1.FieldValues['gl_desc'];
   dm.AQ34GL_ACCT_PTR.Value:=dm.ADOQuery1.FieldValues['rkey'];
  end
  else
   begin
    ShowMsg('没有找到相应的科目代码',1);
    edit1.SetFocus;
   end;
 end
else
 if (activecontrol.Name<>'BitBtn5') and (trim(edit1.Text)='') then
  dm.AQ34GL_ACCT_PTR.AsVariant:=null;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
if dm.AQ34ttype.Value='4' then
 begin
  edit2.Enabled:=false;
  bitbtn3.Enabled:=false;
 end;

if self.find_depttype5(1,dm.AQ34BIG_DEPT_PTR.AsString) then
 begin
  edit2.Text:=dm.ADOQuery1.FieldValues['dept_code'];
  label9.Caption:=dm.ADOQuery1.FieldValues['dept_name'];
 end;
if self.find_acctgl(1,dm.AQ34GL_ACCT_PTR.AsString) then
 begin
  edit1.Text:=dm.ADOQuery1.FieldValues['GL_ACC_NUMBER'];
  label7.Caption:=dm.ADOQuery1.FieldValues['gl_desc'];
 end;

end;

function TForm2.number_error(number: string): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0034');
  sql.Add('where dept_code='''+number+'''');
  open;
  if not IsEmpty then  result:=true;
 end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
if (dm.AQ34.State=dsinsert) and (number_error(trim(dbedit1.Text))) then  //新增
 begin
  messagedlg('部门代码重复!请手工重新输入',mterror,[mbok],0);
  dbedit1.SetFocus;
  exit;
 end;

 dm.ADOConnection1.BeginTrans;
TRY
 dm.AQ34.Post;
 dm.ADOConnection1.CommitTrans;
 self.ModalResult:=mrok;
except
 on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
   dbedit1.SetFocus;
   dm.AQ34.Edit;
  end;
end;

end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if trim(dbedit1.Text)='' then
 begin
  messagedlg('部门编号不能为空!',mtinformation,[mbcancel],0);
  dbedit1.SetFocus;
  exit;
 end;
if trim(dbedit2.Text)='' then
 begin
  messagedlg('部门名称不能为空!',mtinformation,[mbcancel],0);
  dbedit2.SetFocus;
  exit;
 end;
if (dm.AQ34ttype.Value='5') and (trim(edit2.Text)='') then
 begin
  messagedlg('新增班组一定要选择所属部!',mtinformation,[mbcancel],0);
  edit2.SetFocus;
  exit;
 end;
end;

end.
