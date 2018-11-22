unit ASSIGN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Grids, DBGrids, Buttons;

type
  TForm_ASSIGN = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ads64: TADODataSet;
    ads64RKEY: TIntegerField;
    ads64SALES_ORDER: TStringField;
    ads64MANU_PART_NUMBER: TStringField;
    ads64MANU_PART_DESC: TStringField;
    ads64PO_NUMBER: TStringField;
    ads64delivery_no: TStringField;
    ads64date_sailing: TDateTimeField;
    ads64QUAN_SHIPPED: TIntegerField;
    ads64PARTS_ALLOC: TFloatField;
    ads64TAX_2: TBCDField;
    ads64invoice_number: TStringField;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    Label3: TLabel;
    Edit1: TEdit;
    ads64SHIPMENT_NO: TSmallintField;
    ads64cust_decl: TStringField;
    ads64ovsh_qty: TIntegerField;
    ads64alloc_qty: TIntegerField;
    BitBtn4: TBitBtn;
    BtQry: TBitBtn;
    ads64abbr_name: TStringField;
    ads64ORIG_CUSTOMER: TStringField;
    ads64LAYERS: TWordField;
    ads64unit_sq: TFloatField;
    ads64PRODUCT_NAME: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BitBtn4Click(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumn;
    sql_text:string;
  public
    { Public declarations }
  end;

var
  Form_ASSIGN: TForm_ASSIGN;

implementation

uses damo,common, QuerySet;

{$R *.dfm}

procedure TForm_ASSIGN.FormActivate(Sender: TObject);
begin
PreColumn := DBGrid1.Columns[0];
sql_text:=self.ads64.CommandText;
end;

procedure TForm_ASSIGN.DBGrid1TitleClick(Column: TColumn);
begin
 self.ads64.IndexFieldNames:=Column.FieldName;
 
  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label3.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm_ASSIGN.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dbgrid1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrid1.DataSource.DataSet.Filter:='';
end;

procedure TForm_ASSIGN.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADS64.CommandText);
end;

procedure TForm_ASSIGN.CheckBox1Click(Sender: TObject);
var
 rkey:integer;
begin
if checkbox1.Checked then
 begin
  rkey:=self.ads64RKEY.Value;
  self.ads64.DisableControls;
  ads64.First;
  while not ads64.Eof do
  begin
   dbgrid1.SelectedRows.CurrentRowSelected:=true;
   ads64.Next;
  end;
  self.ads64.EnableControls;
  ads64.Locate('rkey',rkey,[]);
 end
else
 begin
  rkey:=self.ads64RKEY.Value;
  self.ads64.DisableControls;
  ads64.First;
  while not ads64.Eof do
  begin
   if self.ads64RKEY.Value=rkey then
    dbgrid1.SelectedRows.CurrentRowSelected:=true
   else
    if dbgrid1.SelectedRows.CurrentRowSelected then
    dbgrid1.SelectedRows.CurrentRowSelected:=false;
   ads64.Next;
  end;
  self.ads64.EnableControls;
  ads64.Locate('rkey',rkey,[]);
 end;
end;

procedure TForm_ASSIGN.Button1Click(Sender: TObject);
begin
  if dbgrid1.SelectedRows.Count>=1 then
    ModalResult:=mrok
  else
   showmessage('至少选择一条送货单号!')
end;

procedure TForm_ASSIGN.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if ads64.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_ASSIGN.BitBtn4Click(Sender: TObject);
begin
if not ADS64.IsEmpty then
 Export_dbGrid_to_Excel(self.DBGrid1,self.Caption);
end;

procedure TForm_ASSIGN.BtQryClick(Sender: TObject);
var
  i:integer;
  sqlstr:string;
begin
 try
  frmQuerySet:=tfrmQuerySet.Create(application);
  frmQuerySet.v_form:=0;
  if frmQuerySet.ShowModal = mrOk then
  begin
   for i:=1 to frmQuerySet.sgrid1.RowCount-2 do
     Sqlstr:=sqlstr+frmQuerySet.sgrid1.Cells[2,i];

    ads64.Close;
    ads64.CommandText :=self.sql_text+#13+sqlstr;
    ads64.Prepared;
    ads64.open;
  end;
 finally
  frmQuerySet.free;
 end;
end;

end.
