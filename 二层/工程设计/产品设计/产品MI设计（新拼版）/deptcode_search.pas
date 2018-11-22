unit deptcode_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TForm_deptcode = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnOK: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADODataSet;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1DEPT_CODE: TStringField;
    ADOQuery1DEPT_NAME: TStringField;
    ADOQuery1BARCODE_ENTRY_FLAG: TStringField;
    ADOQuery1DEF_ROUT_INST: TStringField;
    ADOQuery1ppc_status: TWordField;
    ADOQuery1SEQ_NR: TIntegerField;
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
   PreColumn: TColumn;
   field_name:string;
  public
    { Public declarations }
  end;

var
  Form_deptcode: TForm_deptcode;

implementation

uses damo;

{$R *.dfm}

procedure TForm_deptcode.BitBtn2Click(Sender: TObject);
begin
 Maskedit1.Text := '';
 maskedit1.SetFocus;
end;

procedure TForm_deptcode.MaskEdit1Change(Sender: TObject);
begin
  if trim(MaskEdit1.text)<>'' then
    Adoquery1.Filter :=field_name+' like ''%'+Trim(MaskEdit1.Text)+'%'''
  else
    Adoquery1.filter:='';
end;

procedure TForm_deptcode.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then btnOKClick(btnOK);
end;

procedure TForm_deptcode.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then  btnOKClick(btnOK);
 if (chr(key)='S') and (ssalt in shift) then showmessage(ADOQuery1.CommandText);
end;

procedure TForm_deptcode.DBGrid1TitleClick(Column: TColumn);
begin
 if adoquery1.IndexFieldNames<>column.FieldName then
  adoquery1.IndexFieldNames:=column.FieldName;
if (column.FieldName<>self.field_name) and
   (Column.Field.DataType in [ftString]) then
 begin
  label1.Caption:=column.Title.Caption;
  field_name:=column.FieldName;

  PreColumn.Title.Color := clBtnFace;
  PreColumn := column;
  Column.Title.Color := clred;
  self.MaskEdit1.SetFocus;
 end
else
 self.MaskEdit1.SetFocus;
end;

procedure TForm_deptcode.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
 field_name := DBGrid1.Columns[1].FieldName;
 PreColumn := DBGrid1.Columns[1];

end;

procedure TForm_deptcode.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if adoquery1.IsEmpty then
 btnOK.Enabled:=false
else
 btnOK.Enabled:=true;
end;

procedure TForm_deptcode.btnOKClick(Sender: TObject);
var
  n: Integer;
  bOK: Boolean;
begin
  n := DM.ADS38.RecNo;
  DM.ADS38.First;
  bOK := True;
  while not DM.ADS38.Eof do
  begin
    if DM.ADS38.FieldByName('dept_ptr').AsInteger = ADOQuery1rkey.AsInteger then
    begin
      bOK := False;
      Break;
    end;
    DM.ADS38.Next;
  end;
  DM.ADS38.RecNo := n;
  if bOK then ModalResult := mrOk
  else
  begin
    ShowMessage('已经有重复工序，请勿添加重复工序');
  end;

end;

end.
