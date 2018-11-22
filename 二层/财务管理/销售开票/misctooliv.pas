unit misctooliv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, StdCtrls, ExtCtrls, DBGridEh;

type
  TForm_misctooliv = class(TForm)
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    ads112: TADODataSet;
    ads112rkey: TIntegerField;
    ads112invoice_number: TStringField;
    ads112INVOICE_DATE: TDateTimeField;
    ads112TOOLING_CHARGES: TBCDField;
    ads112ship_tax_amount: TBCDField;
    ads112INVOICE_TOTAL: TBCDField;
    ads112DSDesigner: TStringField;
    ads112INVOICE_TYPE: TWordField;
    DataSource1: TDataSource;
    CheckBox1: TCheckBox;
    ads112ship_amount: TBCDField;
    ads112FED_TAX_AMOUNT: TBCDField;
    ads112RUSH_CHARGE_AMOUNT: TBCDField;
    ads112all_amount: TBCDField;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Edit1: TEdit;
    Label1: TLabel;
    ads112POSTED_DATE: TDateTimeField;
    ads112abbr_name: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh; 
  public
    { Public declarations }
  end;

var
  Form_misctooliv: TForm_misctooliv;

implementation

uses damo;

{$R *.dfm}

procedure TForm_misctooliv.Button1Click(Sender: TObject);
begin
  if dbgrideh1.SelectedRows.Count>=1 then
    ModalResult:=mrok
  else
   showmessage('至少选择一条送货单号!')
end;

procedure TForm_misctooliv.CheckBox1Click(Sender: TObject);
var
 rkey:integer;
begin
if checkbox1.Checked then
 begin
  rkey:=self.ads112RKEY.Value;
  self.ads112.DisableControls;
  ads112.First;
  while not ads112.Eof do
  begin
   DBGridEh1.SelectedRows.CurrentRowSelected:=true;
   ads112.Next;
  end;
  self.ads112.EnableControls;
  ads112.Locate('rkey',rkey,[]);
 end
else
 begin
  rkey:=self.ads112RKEY.Value;
  self.ads112.DisableControls;
  ads112.First;
  while not ads112.Eof do
  begin
   if self.ads112RKEY.Value=rkey then
    DBGridEh1.SelectedRows.CurrentRowSelected:=true
   else
    if DBGridEh1.SelectedRows.CurrentRowSelected then
    DBGridEh1.SelectedRows.CurrentRowSelected:=false;
   ads112.Next;
  end;
  self.ads112.EnableControls;
  ads112.Locate('rkey',rkey,[]);
 end;
end;


procedure TForm_misctooliv.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if ads112.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_misctooliv.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADS112.CommandText);
end;

procedure TForm_misctooliv.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
if ads112DSDesigner.Value='无退货' then
  DBGridEh1.Canvas.Font.Color := clRed;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_misctooliv.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   ADS112.IndexFieldNames:=Column.FieldName;
  end
  else begin
   column.Title.SortMarker:=smDownEh;
   ADS112.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm_misctooliv.FormShow(Sender: TObject);
begin
PreColumn := DBGridEh1.Columns[0];
end;

procedure TForm_misctooliv.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrideh1.DataSource.DataSet.Filter:='';
end;

end.
