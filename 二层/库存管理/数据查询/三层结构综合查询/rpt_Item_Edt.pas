unit rpt_Item_Edt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,StrUtils;

type
  Tfrmrpt_Item_Edt = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtRptName: TEdit;
    edtRptTitle: TEdit;
    edtFileName: TEdit;
    btnSave: TButton;
    btnCancel: TButton;
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrpt_Item_Edt: Tfrmrpt_Item_Edt;

implementation
uses pubfunc,constVar,Client_Func;
{$R *.dfm}

procedure Tfrmrpt_Item_Edt.btnSaveClick(Sender: TObject);
begin
  if trim(edtRptName.Text)= '' then
  begin
    ShowMsg('报表名称不能为空,请重新输入','提示',1);
    abort;
  end
  else if trim(edtRptTitle.Text)='' then
  begin
    ShowMsg('报表标题不能为空,请重新输入','提示',1);
    abort;
  end
  else if trim(edtFileName.Text)='' then
  begin
    ShowMsg('报表标题不能为空,请重新输入','提示',1);
    abort;
  end;
  if uppercase(AnsiRightStr(trim(edtFileName.Text),4))<>'.FR3' then
  begin
    ShowMsg('报表文件名称错误,格式为:XXX.fr3,请重新输入','提示',1);
    abort;
  end;
  if not coMyQuery.Check_Record_Unique('select rptId from rpt_main where is__Group=1 and rptName='+QuotedStr(trim(edtRptName.Text))) then
  begin
    ShowMsg('组名不能重复,请重新输入','提示',1);
    abort;
  end;
  ModalResult := mrok;
end;

end.
