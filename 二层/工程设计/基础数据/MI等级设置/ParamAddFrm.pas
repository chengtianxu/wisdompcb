unit ParamAddFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  TfrmParamAdd = class(TForm)
    edtParam: TLabeledEdit;
    btnMore: TSpeedButton;
    edtValue: TLabeledEdit;
    btnOK: TButton;
    btnCancel: TButton;
    lblDesc: TLabel;
    lblUnit: TLabel;
    lbldtype: TLabel;
    procedure btnMoreClick(Sender: TObject);
    procedure edtParamExit(Sender: TObject);
    procedure edtValueExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    FData_tpye: string;
  public
    { Public declarations }
    FDept_Ptr: Integer;
    function CheckParam: Boolean;
    function CheckParamValue: Boolean;
  end;

  
implementation
uses
  Pick_Item_Single, ConstVar, DMFrm;

{$R *.dfm}

procedure TfrmParamAdd.btnMoreClick(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIniData: PDlgInput;
begin
  LFrm := TfrmPick_Item_Single.Create(Self);
  try
    LIniData.Fields := 'PARAMETER_NAME/参数代码/150,PARAMETER_DESC/参数名称/150,unit_name/单位/50,d_type/类型/50';
    LIniData.KeyField := 'rkey';
    LIniData.Sqlstr :=
        ' select d278.rkey ,d278.PARAMETER_NAME, d278.PARAMETER_desc, case when d278.data_type = 1 then ' + QuotedStr('数字') +' when d278.data_type = 2 then ' + QuotedStr('字符') +' end as d_type, ' +
        ' d02.unit_name from data0278 d278 ' +
        ' inner join data0506 d506 on d278.rkey = d506.PARAMETER_PTR ' +
        ' inner join data0002 d02 on d278.unit_ptr = d02.rkey ' +
        ' where d506.ttype = 3 and d506.source_ptr =  ' + IntToStr(FDept_Ptr);
    LIniData.AdoConn := DM1.con1;
    LFrm.InitForm(LIniData);
    if LFrm.ShowModal = mrok then
    begin
      edtParam.Text := LFrm.adsPick1.fieldbyname('PARAMETER_NAME').AsString;
      lblDesc.Caption := LFrm.adsPick1.fieldbyname('PARAMETER_DESC').AsString;
      edtParam.Tag := LFrm.adsPick1.fieldbyname('rkey').AsInteger;
      FData_tpye := LFrm.adsPick1.fieldbyname('d_type').AsString;
      lblUnit.Caption := LFrm.adsPick1.fieldbyname('unit_name').AsString;
      lbldtype.Caption := LFrm.adsPick1.fieldbyname('d_type').AsString;
    end;
  finally
    LFrm.Free;
  end;
end;

function TfrmParamAdd.CheckParam: Boolean;
var
  LSql: string;
begin
  DM1.qrytmp.Close;
  DM1.qrytmp.SQL.Clear;
  LSql :=
        ' select d278.rkey ,d278.PARAMETER_NAME, d278.PARAMETER_desc, case when d278.data_type = 1 then ' + QuotedStr('数字') +' when d278.data_type = 2 then ' + QuotedStr('字符') +' end as d_type, ' +
        ' d02.unit_name from data0278 d278 ' +
        ' inner join data0506 d506 on d278.rkey = d506.PARAMETER_PTR ' +
        ' inner join data0002 d02 on d278.unit_ptr = d02.rkey ' +
        ' where d506.ttype = 3 and d506.source_ptr =  ' + IntToStr(FDept_Ptr) +
        ' and d278.PARAMETER_NAME = ' + QuotedStr(edtParam.Text);
  DM1.qrytmp.SQL.Add(LSql);
  DM1.qrytmp.Open;
  Result := not DM1.qrytmp.IsEmpty;
  if Result then
  begin
    edtParam.Tag := DM1.qrytmp.fieldbyname('rkey').AsInteger;
    lblDesc.Caption := DM1.qrytmp.fieldbyname('PARAMETER_desc').AsString;
    lblUnit.Caption := DM1.qrytmp.fieldbyname('unit_name').AsString;
    lbldtype.Caption := DM1.qrytmp.fieldbyname('d_type').AsString;
  end else
  begin
    lblDesc.Caption := '';
    lblUnit.Caption := '';
    lbldtype.Caption := '';
  end;
end;

function TfrmParamAdd.CheckParamValue: Boolean;
begin
  Result := True;
  if lbldtype.Caption = '数字' then
  begin
    try
      StrToFloat(edtValue.Text);
    except
      Result := False;
    end;
  end;
end;

procedure TfrmParamAdd.edtParamExit(Sender: TObject);
begin
  CheckParam;
end;

procedure TfrmParamAdd.edtValueExit(Sender: TObject);
begin
  if not CheckParamValue then
    ShowMessage('参数值类型不正确');
end;

procedure TfrmParamAdd.btnOKClick(Sender: TObject);
begin
  if not CheckParam then
  begin
    ShowMessage('参数不正确');
    Exit;
  end;
  if not CheckParamValue then
  begin
    ShowMessage('参数值类型不正确');
    exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmParamAdd.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
