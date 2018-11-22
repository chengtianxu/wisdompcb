unit Frm_DeprDept_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Mask, DBCtrls, ADODB;

type
  TFrm_DeprDept = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BtAcct: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure BtAcctClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_DeprDept: TFrm_DeprDept;

implementation
 uses DM_u,common,ConstVar,Frm_tree_u;
{$R *.dfm}

procedure TFrm_DeprDept.BtAcctClick(Sender: TObject);
begin
  DM.tmp.Close;
  DM.tmp.SQL.Text:='SELECT Rkey, isnull(PARENT_PTR,9999) PARENT ,GL_ACC_NUMBER+'' ''+GL_DESCRIPTION nm,GL_ACC_NUMBER,GL_DESCRIPTION '+
                    'FROM Data0103 where acc_Tp>3 order by GL_ACC_NUMBER';
  DM.tmp.Open;
  if DM.tmp.IsEmpty then
  begin
    DM.tmp.Close;
    showmessage('会计科目档案为空...');
    exit;
  end;

  if TFrm_tree.getStr(DM.tmp,9999,true,'会计科目查找','折旧费用科目') then
  begin
    DM.ADO326_1.Edit;
    Dm.ADO326_1FACCU_DEPT_GL_PTR.AsInteger:=DM.tmp.Fields[0].AsInteger;
  end;
end;

procedure TFrm_DeprDept.SpeedButton1Click(Sender: TObject);
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields:='Dept_Code/部门代号,Dept_Name/部门名称,ttype/类别';
  FDlgInput.Sqlstr:= 'SELECT DEPT_CODE, DEPT_NAME, rkey, CASE WHEN TTYPE = 1 THEN ''工序'' '+
                     'WHEN TTYPE = 4 THEN ''部门''  '+
                     'WHEN ttype = 5  THEN ''班组'' END AS ttype FROM Data0034 where TTYPE in (1,4,5)';
  FDlgInput.AdoConn := DM.ADOCon;
  FDlgInput.InPut_value := DM.ADO326_1rkey.Value;
  FDlgInput.KeyField := 'rkey';
  Tmp_rslt:= Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    DM.ADO326_1dept_ptr.Value:=Tmp_rslt;
end;

procedure TFrm_DeprDept.BitBtn1Click(Sender: TObject);
begin
   if  DBedit1.Text='' then
   begin
     showmessage('部门代码不能为空...');
     exit;
   end;
   if  (DBedit3.Text='0') or (DBedit3.Text='') then
   begin
     showmessage('请输入比重...');
     exit;
   end;
   if  DBedit4.Text='' then
   begin
     showmessage('折旧科目不能为空...');
     exit;
   end;
   modalresult:=mrok;
end;

end.
