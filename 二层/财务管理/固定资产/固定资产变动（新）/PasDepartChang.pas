unit PasDepartChang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TfrmDepartChang = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    btnDepart: TBitBtn;
    btNumber: TBitBtn;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure btnDepartClick(Sender: TObject);
    procedure btNumberClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit6KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDepartChang: TfrmDepartChang;

implementation

uses DAMO,Pick_Item_Single,ConstVar, PasNumber;

{$R *.dfm}

procedure TfrmDepartChang.btnDepartClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'DEPT_CODE/部门代码/200,DEPT_NAME/部门名称/200,ttype/类别/100';
    InputVar.Sqlstr := 'select RKEY,DEPT_CODE,DEPT_NAME,CASE WHEN TTYPE = 1 THEN ''工序'' '+
                     'WHEN TTYPE = 4 THEN ''部门''  '+
                     'WHEN ttype = 5  THEN ''班组'' END AS ttype from Data0034 ' + #13+
                     'where (ttype in (4,5) or ((is_cost_dept=1) and (COST_DEPT_PTR=rkey))) and (ACTIVE_FLAG=0) '+  #13+
                     'order by dept_code';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      DBEdit4.Text:= frmPick_Item_Single.adsPick.fieldbyname('DEPT_CODE').AsString;
      DBEdit5.Text:= frmPick_Item_Single.adsPick.fieldbyname('DEPT_NAME').AsString;

      DM.ado326_1.Edit;
      DM.ado326_1dept_ptr.Value:= frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmDepartChang.btNumberClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'GL_ACC_NUMBER/科目代码/100,description_2/科目名称/300';
    InputVar.Sqlstr := 'SELECT dbo.Data0103.RKEY,Data0103.GL_ACC_NUMBER '+
                       ' ,ISNULL(Data0103_1.GL_DESCRIPTION,''根目录'')+ ''-'' + Data0103.GL_DESCRIPTION AS description_2 '+
                       ' ,DBO.Data0103.GL_DESCRIPTION '+#13+
                       ' FROM dbo.Data0103 Data0103_2 RIGHT OUTER JOIN ' +#13+
                       '   dbo.Data0103 Data0103_1 ON Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN '+#13+
                       '   dbo.Data0103 ON Data0103_1.RKEY = dbo.Data0103.PARENT_PTR  '+#13+
                       '  WHERE dbo.Data0103.HAS_CHILD = 0 AND dbo.Data0103.ACTIVE_FLAG=''Y'' AND dbo.Data0103.ACC_TP IN (4,5) ' +#13+
                       ' ORDER By Data0103.GL_ACC_NUMBER ';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      DBEdit7.Text:= frmPick_Item_Single.adsPick.fieldbyname('GL_ACC_NUMBER').AsString;
      DBEdit8.Text:= frmPick_Item_Single.adsPick.fieldbyname('GL_DESCRIPTION').AsString;

      DM.ado326_1.Edit;
      DM.ado326_1FACCU_DEPT_GL_PTR.Value:= frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmDepartChang.BitBtn1Click(Sender: TObject);
begin
  if Trim(DBEdit4.Text)='' then
  begin
    ShowMessage('部门不能为空');
    Exit;
  end;
  if Trim(DBEdit6.Text)='' then
  begin
    ShowMessage('百分比不能为空');
    Exit;
  end;
  if Trim(DBEdit7.Text)='' then
  begin
    ShowMessage('折旧科目不能为空');
    Exit;
  end;
  ModalResult:=mrYes;
end;

procedure TfrmDepartChang.DBEdit6Exit(Sender: TObject);
begin
  if trim(DBEdit6.Text)='' then Exit;
  if (StrToCurr(Trim(DBEdit6.Text))<0) or (StrToCurr(Trim(DBEdit6.Text))>100) then
  begin
    ShowMessage('百分比输入格式不对，必须在0-100之间');
    DBEdit6.SetFocus;
    Exit;
  end;
end;

procedure TfrmDepartChang.DBEdit6KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['0'..'9',#8,#46]) then
  begin
    if (Key = #46) and (Pos('.',Trim(TEdit(Sender).Text))<>0) then
    Abort;
  end
  else Abort;
end;

end.
