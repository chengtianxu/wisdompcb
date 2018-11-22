unit rpt_Group_Edt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tfrmrpt_Group_Edt = class(TForm)
    Label1: TLabel;
    edtRptName: TEdit;
    btnSave: TButton;
    btnCancel: TButton;
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrpt_Group_Edt: Tfrmrpt_Group_Edt;

implementation
uses client_func,PubFunc;
{$R *.dfm}

procedure Tfrmrpt_Group_Edt.btnSaveClick(Sender: TObject);
begin
  if trim(edtRptName.Text)= '' then abort;
  if not coMyQuery.Check_Record_Unique('select rptId from rpt_main where is__Group=1 and rptName='+QuotedStr(trim(edtRptName.Text))) then
  begin
    ShowMsg('组名不能重复,请重新输入','提示',1);
    abort;
  end;
  ModalResult := mrok;
end;

end.
