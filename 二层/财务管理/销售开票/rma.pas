unit rma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, ExtCtrls, Buttons;

type
  TForm_rma = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    DataSource1: TDataSource;
    ads98: TADODataSet;
    ads98SALES_ORDER: TStringField;
    ads98MANU_PART_NUMBER: TStringField;
    ads98MANU_PART_DESC: TStringField;
    ads98PO_NUMBER: TStringField;
    ads98RMA_NUMBER: TStringField;
    ads98RMA_DATE: TDateTimeField;
    ads98alloc_qty: TIntegerField;
    ads98PARTS_ALLOC: TFloatField;
    ads98RUSH_CHARGE: TBCDField;
    ads98RKEY: TIntegerField;
    ads98MEMO_NUMBER: TStringField;
    DBGrid1: TDBGrid;
    ads98QTY_RECD: TIntegerField;
    ads98QTY_CRED: TIntegerField;
    BitBtn4: TBitBtn;
    BtQry: TBitBtn;
    ads98abbr_name: TStringField;
    ads98ORIG_CUSTOMER: TStringField;
    ads98LAYERS: TWordField;
    ads98unit_sq: TFloatField;
    ads98PRODUCT_NAME: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
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
  Form_rma: TForm_rma;

implementation

uses damo,common, QuerySet;

{$R *.dfm}

procedure TForm_rma.FormActivate(Sender: TObject);
begin
PreColumn := DBGrid1.Columns[0];
sql_text:=self.ads98.CommandText;
end;

procedure TForm_rma.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dbgrid1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrid1.DataSource.DataSet.Filter:='';
end;

procedure TForm_rma.DBGrid1TitleClick(Column: TColumn);
begin
 self.ads98.IndexFieldNames:=Column.FieldName;
 
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

procedure TForm_rma.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADS98.CommandText);
end;

procedure TForm_rma.CheckBox1Click(Sender: TObject);
var
 rkey:integer;
begin
if checkbox1.Checked then
 begin
  rkey:=self.ads98RKEY.Value;
  self.ads98.DisableControls;
  ads98.First;
  while not ads98.Eof do
  begin
   dbgrid1.SelectedRows.CurrentRowSelected:=true;
   ads98.Next;
  end;
  self.ads98.EnableControls;
  ads98.Locate('rkey',rkey,[]);
 end
else
 begin
  rkey:=self.ads98RKEY.Value;
  self.ads98.DisableControls;
  ads98.First;
  while not ads98.Eof do
  begin
   if self.ads98RKEY.Value=rkey then
    dbgrid1.SelectedRows.CurrentRowSelected:=true
   else
    if dbgrid1.SelectedRows.CurrentRowSelected then
    dbgrid1.SelectedRows.CurrentRowSelected:=false;
   ads98.Next;
  end;
  self.ads98.EnableControls;
  ads98.Locate('rkey',rkey,[]);
 end;
end;

procedure TForm_rma.Button1Click(Sender: TObject);
begin
  if dbgrid1.SelectedRows.Count>=1 then
    ModalResult:=mrok
  else
   showmessage('至少选择一条送货单号!')
end;

procedure TForm_rma.DataSource1DataChange(Sender: TObject; Field: TField);
begin
if ads98.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_rma.BitBtn4Click(Sender: TObject);
begin
if not ADS98.IsEmpty then
 Export_dbGrid_to_Excel(self.DBGrid1,self.Caption);
end;

procedure TForm_rma.BtQryClick(Sender: TObject);
var
  i:integer;
  sqlstr:string;
begin
 try
  frmQuerySet:=tfrmQuerySet.Create(application);
  frmQuerySet.v_form:=1;
  if frmQuerySet.ShowModal = mrOk then
  begin
   for i:=1 to frmQuerySet.sgrid1.RowCount-2 do
     Sqlstr:=sqlstr+frmQuerySet.sgrid1.Cells[2,i];

    ads98.Close;
    ads98.CommandText :=self.sql_text+#13+sqlstr;
    ads98.Prepared;
    ads98.open;
  end;
 finally
  frmQuerySet.free;
 end;
end;

end.
