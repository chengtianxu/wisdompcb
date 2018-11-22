unit sales_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, ADODB, StdCtrls;

type
  TForm4 = class(TForm)
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1CUSTOMER_PTR: TIntegerField;
    ADOQuery1SALES_ORDER: TStringField;
    ADOQuery1CUST_PART_PTR: TIntegerField;
    ADOQuery1PARTS_ORDERED: TFloatField;
    ADOQuery1STATUS: TWordField;
    ADOQuery1DUE_DATE: TDateTimeField;
    ADOQuery1SCH_DATE: TDateTimeField;
    ADOQuery1PARTS_SHIPPED: TFloatField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1CUST_CODE: TStringField;
    ADOQuery1CUSTOMER_NAME: TStringField;
    ADOQuery1PO_NUMBER: TStringField;
    ADOQuery1DSDesigner: TFloatField;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    ADOQuery1manu_PART_DESC: TStringField;
    ADOQuery1manu_PART_NUMBER: TStringField;
    ADOQuery1supp_ABBRNAME: TStringField;
    ADOQuery1rkey15: TIntegerField;
    ADOQuery1WAREHOUSE_CODE: TStringField;
    ADOQuery1abbrname: TStringField;
    ADOQuery1PARTS_ALLOC: TFloatField;
    ADOQuery1REPUT_APPR_BY: TIntegerField;
    ADOQuery1PARTS_RETURNED: TFloatField;
    ADOQuery1EXCH_RATE: TFloatField;
    ADOQuery1ttype: TWordField;
    ADOQuery1cost_pcs: TFloatField;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
   v_colwidth: array[0..10] of integer;
   file_name:string;    
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses damo;

{$R *.dfm}

procedure TForm4.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then showmessage(adoquery1.SQL.Text);
  if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrOk;
end;

procedure TForm4.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 ModalResult:=mrOk;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
file_name:='SALES_ORDER';
self.ADOQuery1.Open;
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
if (trim(edit1.Text)<>'')  then
 adoquery1.Filter:=file_name+' like ''%'+trim(edit1.Text)+'%'''
else
 adoquery1.Filter:='';

end;

procedure TForm4.FormShow(Sender: TObject);
var
 i:byte;
begin
 for i:=low(v_colwidth) to high(v_colwidth) do
  v_colwidth[i]:=dbgrid1.Columns[i].Width;
end;

procedure TForm4.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth) to high (v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-814)*v_colwidth[i]/790);
end;

procedure TForm4.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.ReadOnly=true) and (column.FieldName<>self.file_name) then
 begin
  if column.FieldName<>'SCH_DATE' then
  begin
   file_name:=column.FieldName;
   label1.Caption := column.Title.Caption;
  end;
  edit1.SetFocus;
  self.ADOQuery1.Sort:=column.FieldName;
 end;
end;

procedure TForm4.DataSource1DataChange(Sender: TObject; Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true; 
end;

end.
