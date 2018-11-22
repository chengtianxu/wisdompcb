unit ReviewProjectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons;

type
  Tfrm_ReviewProject = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    EdtEmployee: TEdit;
    BitBtn7: TBitBtn;
    Label1: TLabel;
    procedure BitBtn7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ReviewProject: Tfrm_ReviewProject;

implementation

uses damo,common,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure Tfrm_ReviewProject.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'EMPL_CODE/员工代码/150,EMPLOYEE_NAME/员工姓名/200';
    InputVar.Sqlstr :='SELECT RKEY, EMPL_CODE, EMPLOYEE_NAME FROM dbo.Data0005 WHERE (ACTIVE_FLAG = ''Y'')';
    inputvar.KeyField:='EMPL_CODE';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      EdtEmployee.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME']);
      label1.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE']);
      EdtEmployee.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
    end ;
  finally
    frmPick_Item_Single.Free ;
  end;

end;

procedure Tfrm_ReviewProject.Button1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
