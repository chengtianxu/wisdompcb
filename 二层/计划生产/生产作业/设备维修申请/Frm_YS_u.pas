unit Frm_YS_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFrm_YS = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PDValiDate: TDateTimePicker;
    EdtValMan: TEdit;
    CBAppr: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    Label1: TLabel;
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses common,DM_u,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrm_YS.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'EMPL_CODE/员工代码/150,EMPLOYEE_NAME/员工姓名/150,dept_code/部门代码/150,Dept_name/部门名称/150';
    InputVar.Sqlstr := 'select data0005.rkey,data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,data0034.dept_code,data0034.Dept_name '+
                       'from data0005 inner join data0034 on data0005.employee_id=data0034.rkey '+
                       'where data0005.ACTIVE_FLAG=''Y''';
    InputVar.AdoConn := DM.ADOCon;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      EdtValMan.Text:=frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE'] ;
      EdtValMan.Tag:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;

end;

procedure TFrm_YS.BitBtn1Click(Sender: TObject);
begin
  if CBAppr.Text='' then
  begin
    showmessage('请输入验收评价...');
    exit;
  end;
  modalresult:=mrok;
end;

procedure TFrm_YS.BitBtn2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
  Close;
end;

end.
