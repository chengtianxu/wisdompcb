unit DeptFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmDept = class(TForm)
    edt1: TEdit;
    lbl1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDept: TfrmDept;

implementation

uses  Pick_Item_Single,ConstVar , damo ;

{$R *.dfm}

procedure TfrmDept.btn1Click(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'DEPT_CODE/工序代码/180,DEPT_NAME/工序名称/250';
    InputVar.Sqlstr := 'SELECT rkey,DEPT_CODE,DEPT_NAME from Data0034 where BARCODE_ENTRY_FLAG=''Y''';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt1.Text:= frmPick_Item_Single.adsPick.fieldbyname('DEPT_CODE').AsString;
      edt1.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmDept.btn2Click(Sender: TObject);
begin
  if Trim(edt1.Text) = '' then
  begin
    ShowMessage('请先选择工序！');
    exit;
  end;
  ModalResult:= mrOk;
end;

end.
