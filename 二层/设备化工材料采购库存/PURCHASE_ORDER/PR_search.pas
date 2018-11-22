unit PR_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  TForm_req = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBGrid3: TDBGrid;
    ADOQuery1: TADOStoredProc;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1PO_REQ_NUMBER: TStringField;
    ADOQuery1abbr_name: TStringField;
    ADOQuery1REQ_DATE: TDateTimeField;
    ADOQuery1FLAG: TStringField;
    ADOQuery1STATUS: TWordField;
    ADOQuery1DEPARTMENT_NAME: TStringField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1employee_name_appd: TStringField;
    ADOQuery1WAREHOUSE_NAME: TStringField;
    ADOQuery1WHSE_PTR: TIntegerField;
    ADOQuery1v_flag: TStringField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_req: TForm_req;

implementation
 uses damo, main;
{$R *.dfm}

procedure TForm_req.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then ModalResult := mrok;
end;

procedure TForm_req.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult := mrok;
end;

procedure TForm_req.BitBtn1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm_req.Edit1Change(Sender: TObject);
begin
 IF trim(EDIT1.TEXT)<>'' THEN
  ADOQUERY1.Filter := 'PO_REQ_NUMBER like '''+trim(edit1.text)+'%'''
 ELSE
  ADOQUERY1.FILTER := '';

 if adoquery1.IsEmpty then
  button1.Enabled := false
 else
  button1.Enabled := true;
end;

procedure TForm_req.DataSource1DataChange(Sender: TObject; Field: TField);
begin
 if (adoquery1flag.Value='S')  then
  with dm.ADo0069 do
   begin             //查找标准采购条目
    active:=false;
    Parameters[1].Value := self.ADOQuery1RKEY.Value;
    active:=true;
    self.DBGrid3.Visible := false;
    self.dbgrid2.Visible := true;
   end
 else
  with dm.ADo0204 do
   begin           //查找杂项采购条目
    active:=false;
    Parameters[1].Value := self.ADOQuery1RKEY.Value;
    active:=true;
    self.dbgrid2.Visible := false;
    self.dbgrid3.Visible := true;
   end;
end;

procedure TForm_req.FormCreate(Sender: TObject);
begin
 with ADOQuery1 do
  begin
   active := false;
   Parameters[1].Value := form1.v_employee;
   active := true;
  end;
end;

procedure TForm_req.ADOQuery1CalcFields(DataSet: TDataSet);
begin
 if adoquery1flag.Value='S' then
  Adoquery1v_flag.Value :='生产物料'
 else
  if adoquery1flag.Value='M' then
   Adoquery1v_flag.Value :='非生产物料';
end;

end.
