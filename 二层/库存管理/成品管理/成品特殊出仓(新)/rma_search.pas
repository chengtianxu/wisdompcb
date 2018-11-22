unit rma_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TFrm_rmasearch = class(TForm)
    ADOQuery1: TADOQuery;
    ADOQuery1rma_number: TStringField;
    ADOQuery1rma_date: TDateTimeField;
    ADOQuery1QTY_AUTH: TIntegerField;
    ADOQuery1so_ptr: TIntegerField;
    ADOQuery1RMA_STATUS: TSmallintField;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1customer_ptr: TIntegerField;
    ADOQuery1customer_part_ptr: TIntegerField;
    ADOQuery1sales_order: TStringField;
    ADOQuery1shipment_ptr: TIntegerField;
    ADOQuery1qty_recd: TIntegerField;
    ADOQuery1rma_type: TStringField;
    ADOQuery1status: TStringField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1abbr_name: TStringField;
    Edit1: TEdit;
    Label1: TLabel;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery1qty_ship: TIntegerField;
    ADOQuery1PO_NUMBER: TStringField;
    ADOQuery1cust_code: TStringField;
    ADOQuery1customer_name: TStringField;
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
   v_colwidth: array[0..9] of integer;    
   file_name:string;
  public
    { Public declarations }
  end;

var
  Frm_rmasearch: TFrm_rmasearch;

implementation

uses damo;

{$R *.dfm}

procedure TFrm_rmasearch.ADOQuery1CalcFields(DataSet: TDataSet);
begin
 if adoquery1.FieldValues['so_ptr']=null then
  adoquery1.FieldValues['rma_type'] := '按部件'
 else
  adoquery1.FieldValues['rma_type'] := '从装运';

 case adoquery1.FieldValues['rma_status'] of
  1:adoquery1.FieldValues['status']:='未提交';
  2:adoquery1.FieldValues['status']:='待入仓';
  3:adoquery1.FieldValues['status']:='已入仓';
  4:adoquery1.FieldValues['status']:='已冲帐';
 end;
end;

procedure TFrm_rmasearch.FormCreate(Sender: TObject);
begin
file_name:='rma_number';
self.ADOQuery1.Prepared;
self.ADOQuery1.Open;
end;

procedure TFrm_rmasearch.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.ReadOnly=true) and (column.FieldName<>self.file_name) then
 begin
  if column.FieldName<>'rma_date' then
  begin
  file_name:=column.FieldName;
  label1.Caption := column.Title.Caption;
  end;
  edit1.SetFocus;
  adoquery1.Sort:=file_name;
 end;
end;

procedure TFrm_rmasearch.Edit1Change(Sender: TObject);
begin
if (trim(edit1.Text)<>'')  then
 adoquery1.Filter:=file_name+' like ''%'+trim(edit1.Text)+'%'''
else
 adoquery1.Filter:='';

end;

procedure TFrm_rmasearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then showmessage(adoquery1.SQL.Text);
  if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrOk;
end;

procedure TFrm_rmasearch.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 ModalResult:=mrOk;
end;

procedure TFrm_rmasearch.FormShow(Sender: TObject);
var
 i:byte;
begin
 for i:=low(v_colwidth) to high(v_colwidth) do
  v_colwidth[i]:=dbgrid1.Columns[i].Width;
end;

procedure TFrm_rmasearch.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth) to high (v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-716)*v_colwidth[i]/692);
end;

procedure TFrm_rmasearch.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
