unit eip_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB;

type
  TForm_episearch = class(TForm)
    Aqwz303: TADOQuery;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    Aqwz304: TADOQuery;
    Aqwz303RKEY: TAutoIncField;
    Aqwz303epiboly_number: TStringField;
    Aqwz303DELIVER_NUMBER: TStringField;
    Aqwz303dept_ptr: TIntegerField;
    Aqwz303DEPT_NAME: TStringField;
    Aqwz303DEPT_CODE: TStringField;
    Aqwz303SUPP_PTR: TIntegerField;
    Aqwz303CODE: TStringField;
    Aqwz303SUPPLIER_NAME: TStringField;
    Aqwz303ABBR_NAME: TStringField;
    Aqwz303ENT_DATE: TDateTimeField;
    Aqwz303EMPLOYEE_NAME: TStringField;
    Aqwz303WAREHOUSE_CODE: TStringField;
    Aqwz303ABBR_NAME_1: TStringField;
    Aqwz304DELIVER_PTR: TIntegerField;
    Aqwz304CUSTPART_PTR: TIntegerField;
    Aqwz304MANU_PART_NUMBER: TStringField;
    Aqwz304MANU_PART_DESC: TStringField;
    Aqwz304STANDARD: TStringField;
    Aqwz304UNIT_NAME: TStringField;
    Aqwz304rece_quantity: TIntegerField;
    Aqwz304rework_qry: TIntegerField;
    Aqwz304REMARK: TStringField;
    Aqwz304rkey25: TIntegerField;
    Aqwz304RKEY: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
   field_name:string; 
  public
    { Public declarations }
  end;

var
  Form_episearch: TForm_episearch;

implementation

uses data_module;

{$R *.dfm}

procedure TForm_episearch.FormCreate(Sender: TObject);
begin
  self.Aqwz303.Open;
  self.Aqwz304.Open;
  if self.Aqwz303.IsEmpty then
     bitbtn1.Enabled:=false;
  field_name:='DELIVER_NUMBER';
end;

procedure TForm_episearch.DBGrid1DblClick(Sender: TObject);
begin
  if not Aqwz303.IsEmpty then ModalResult :=mrok;
end;

procedure TForm_episearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and (not Aqwz303.IsEmpty) then ModalResult :=mrok;
end;

procedure TForm_episearch.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
    self.Aqwz303.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
  else
    self.Aqwz303.Filter:='';

  if self.Aqwz303.IsEmpty then
    bitbtn1.Enabled:=false
  else
    bitbtn1.Enabled:=true;
end;

procedure TForm_episearch.DBGrid1TitleClick(Column: TColumn);
var
  i:byte;
begin
  if (column.ReadOnly) and (field_name<>column.FieldName) then
  begin
    label1.Caption:=column.Title.Caption;
    self.field_name:=column.FieldName;
    edit1.SetFocus;
    for i:=0 to dbgrid1.FieldCount-1 do
      if dbgrid1.Columns[i].Title.Color= clred then
        dbgrid1.Columns[i].Title.Color:= clbtnface;
    column.Title.Color:=clred;
  end;
end;

end.
