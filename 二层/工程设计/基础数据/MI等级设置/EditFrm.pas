unit EditFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ADODB, DB, DBClient, Provider,
  Grids, DBGridEh, Menus, DMFrm;

type
  TfrmEdit = class(TForm)
    edtGradeCode: TLabeledEdit;
    edtGrade_Name: TLabeledEdit;
    edtGrade_Note: TLabeledEdit;
    pnl1: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    pmAddParam: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    eh1: TDBGridEh;
    eh2: TDBGridEh;
    dtstprvdr1: TDataSetProvider;
    cds1: TClientDataSet;
    ds1: TDataSource;
    cds2: TClientDataSet;
    ds2: TDataSource;
    ads1: TADODataSet;
    dtstprvdr2: TDataSetProvider;
    ads2: TADODataSet;
    cds1dept_note: TWideStringField;
    cds1dept_code: TStringField;
    cds1dept_name: TStringField;
    cds2seq_no: TIntegerField;
    cds2parameter_name: TStringField;
    cds2tvalue: TStringField;
    pmAddDept: TPopupMenu;
    N4: TMenuItem;
    cds1dept_ptr: TIntegerField;
    N5: TMenuItem;
    N6: TMenuItem;
    cds2dept_ptr: TIntegerField;
    cds2parameter_ptr: TIntegerField;
    cds2parameter_desc: TStringField;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure cds1AfterScroll(DataSet: TDataSet);
    procedure pmAddDeptPopup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure pmAddParamPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  WZ_gUnit, DeptAddFrm, ParamAddFrm;

{$R *.dfm}

procedure TfrmEdit.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmEdit.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEdit.N4Click(Sender: TObject);
var
  LFrm: TfrmAddDept;
begin
  LFrm := TfrmAddDept.Create(Self);
  try
    if LFrm.ShowModal = mrok then
    begin
      try
        cds1.Append;
        cds1.FieldByName('dept_code').AsString := LFrm.edtDept.Text;
        cds1.FieldByName('dept_ptr').AsInteger := LFrm.edtDept.tag;
        cds1.FieldByName('dept_note').AsString := LFrm.mmoNote.Text;
        cds1.FieldByName('dept_name').AsString := LFrm.lblDept_name.Caption;
        cds1.Post;
      except
        on e: Exception do
        begin
          ShowMessage(e.Message);
          cds1.Cancel;
        end;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEdit.N6Click(Sender: TObject);
var
  LFrm: TfrmAddDept;
begin
  LFrm := TfrmAddDept.Create(Self);
  try
    LFrm.edtDept.Text := cds1.FieldByName('dept_code').AsString;
    LFrm.edtDept.Tag :=  cds1.FieldByName('dept_ptr').AsInteger;
    LFrm.lblDept_name.Caption := cds1.FieldByName('dept_name').AsString;
    LFrm.mmoNote.Text := cds1.FieldByName('dept_note').AsString;
    if LFrm.ShowModal = mrok then
    begin
      try
        cds1.Edit;
        cds1.FieldByName('dept_code').AsString := LFrm.edtDept.Text;
        cds1.FieldByName('dept_ptr').AsInteger := LFrm.edtDept.tag;
        cds1.FieldByName('dept_note').AsString := LFrm.mmoNote.Text;
        cds1.FieldByName('dept_name').AsString := LFrm.lblDept_name.Caption;
        cds1.Post;
      except
        on e: Exception do
        begin
          ShowMessage(e.Message);
          cds1.Cancel;
        end;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEdit.N5Click(Sender: TObject);
begin
  cds1.Delete;
end;

procedure TfrmEdit.cds1AfterScroll(DataSet: TDataSet);
begin
  if cds1.FieldByName('dept_ptr').AsString <> '' then
  begin
    cds2.Filtered := False;
    cds2.Filter := 'dept_ptr=' + cds1.FieldByName('dept_ptr').AsString;
    cds2.Filtered := True;
  end;
end;

procedure TfrmEdit.pmAddDeptPopup(Sender: TObject);
begin
  N5.Enabled := not cds1.IsEmpty;
  N6.Enabled := not cds1.IsEmpty;
end;

procedure TfrmEdit.N1Click(Sender: TObject);
var
  LFrm: TfrmParamAdd;
begin
  LFrm := TfrmParamAdd.Create(Self);
  try
    LFrm.FDept_Ptr := cds1.fieldbyname('dept_ptr').AsInteger;
    if LFrm.ShowModal = mrok then
    begin
      try
        cds2.Append;
        cds2.FieldByName('seq_no').AsInteger := cds2.RecordCount;
        cds2.FieldByName('parameter_name').AsString := LFrm.edtParam.Text;
        cds2.FieldByName('tvalue').AsString := LFrm.edtValue.Text;
        cds2.FieldByName('dept_ptr').AsInteger := LFrm.FDept_Ptr;
        cds2.FieldByName('parameter_ptr').AsInteger := LFrm.edtParam.Tag;
        cds2.FieldByName('parameter_desc').AsString := LFrm.lblDesc.Caption;
        cds2.Post;
      except
        ShowMessage('«ÎŒ≤Â»Î÷ÿ∏¥');
        cds2.Cancel;
      end
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEdit.N2Click(Sender: TObject);
var
  LFrm: TfrmParamAdd;
begin
  LFrm := TfrmParamAdd.Create(Self);
  try
    LFrm.FDept_Ptr := cds1.fieldbyname('dept_ptr').AsInteger;
    LFrm.edtParam.Text := cds2.FieldByName('parameter_name').AsString;
    LFrm.edtValue.Text := cds2.FieldByName('tvalue').AsString;
    LFrm.FDept_Ptr := cds2.FieldByName('dept_ptr').AsInteger;
    LFrm.edtParam.Tag := cds2.FieldByName('parameter_ptr').AsInteger;
    LFrm.lblDesc.Caption := cds2.fieldbyname('parameter_desc').AsString;
    if LFrm.ShowModal = mrok then
    begin
      try
        cds2.Edit;
        cds2.FieldByName('parameter_name').AsString := LFrm.edtParam.Text;
        cds2.FieldByName('tvalue').AsString := LFrm.edtValue.Text;
        cds2.FieldByName('dept_ptr').AsInteger := LFrm.FDept_Ptr;
        cds2.FieldByName('parameter_ptr').AsInteger := LFrm.edtParam.Tag;
        cds2.FieldByName('parameter_desc').AsString := LFrm.lblDesc.Caption;
        cds2.Post;
      except
        ShowMessage('«ÎŒ≤Â»Î÷ÿ∏¥');
        cds2.Cancel;
      end
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEdit.N3Click(Sender: TObject);
begin
  cds2.Delete;
end;

procedure TfrmEdit.pmAddParamPopup(Sender: TObject);
begin
  N2.Enabled := not cds2.IsEmpty;
  n3.Enabled := not cds2.IsEmpty;
end;

end.
