unit DeptAddFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DMFrm;

type
  TfrmAddDept = class(TForm)
    edtDept: TLabeledEdit;
    btnMore: TSpeedButton;
    lbl1: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    mmoNote: TMemo;
    lblDept_name: TLabel;
    procedure btnMoreClick(Sender: TObject);
    procedure edtDeptExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    function CheckDept: Boolean;
  public
    { Public declarations }
  end;

implementation
uses
  Pick_Item_Single, ConstVar;
{$R *.dfm}

procedure TfrmAddDept.btnMoreClick(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIniData: PDlgInput;
begin
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LIniData.Fields := 'dept_code/工序代码/150,dept_name/工序名称/150';
    LIniData.KeyField := 'rkey';
    LIniData.Sqlstr := 'select * from data0034 where ttype = 1';
    LIniData.AdoConn := DM1.con1;
    LFrm.InitForm(LIniData);
    if LFrm.ShowModal = mrok then
    begin
      edtDept.Text := LFrm.adsPick1.fieldbyname('dept_code').AsString;
      edtDept.Tag := LFrm.adsPick1.fieldbyname('rkey').AsInteger;
    end;
  finally
    LFrm.Free;
  end;
end;

function TfrmAddDept.CheckDept: Boolean;
begin
  DM1.qrytmp.Close;
  DM1.qrytmp.SQL.Clear;
  DM1.qrytmp.SQL.Add('select rkey,dept_name from data0034 where ttype = 1 and dept_code = ' + QuotedStr(edtDept.Text));
  DM1.qrytmp.Open;
  Result := not DM1.qrytmp.IsEmpty;
  if Result then
  begin
    edtDept.Tag := DM1.qrytmp.fieldbyname('rkey').AsInteger;
    lblDept_name.Caption := DM1.qrytmp.fieldbyname('dept_name').AsString;
  end else
    lblDept_name.Caption := '';
end;

procedure TfrmAddDept.edtDeptExit(Sender: TObject);
begin
  CheckDept;
end;

procedure TfrmAddDept.btnOKClick(Sender: TObject);
begin
  if not CheckDept then
  begin
    ShowMessage('工序无效，请检查');
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmAddDept.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
