unit miscmatil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB, ADODB;

type
  TForm_miscmatil = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    DataSource1: TDataSource;
    ads235: TADODataSet;
    ads235RKEY: TIntegerField;
    ads235goods_name: TStringField;
    ads235goods_guige: TStringField;
    ads235GRN_NUMBER: TStringField;
    ads235DELIVER_NUMBER: TStringField;
    ads235ship_DATE: TDateTimeField;
    ads235QUAN_RECD: TBCDField;
    ads235UNIT_NAME: TStringField;
    ads235unit_price: TBCDField;
    ads235state_tax: TBCDField;
    ads235amount: TBCDField;
    ads235tax_amount: TBCDField;
    ads235INVOICE_NO: TStringField;
    ads235goods_type: TStringField;
    ads235sType: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    PreColumn: TColumn;
  public
    { Public declarations }
  end;

var
  Form_miscmatil: TForm_miscmatil;

implementation

uses damo;

{$R *.dfm}

procedure TForm_miscmatil.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dbgrid1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrid1.DataSource.DataSet.Filter:='';
end;

procedure TForm_miscmatil.FormActivate(Sender: TObject);
begin
PreColumn := DBGrid1.Columns[0];
end;

procedure TForm_miscmatil.DBGrid1TitleClick(Column: TColumn);
begin
 self.ads235.IndexFieldNames:=Column.FieldName;
 
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

procedure TForm_miscmatil.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ads235.CommandText);
end;

procedure TForm_miscmatil.Button1Click(Sender: TObject);
begin
  if dbgrid1.SelectedRows.Count>=1 then
    ModalResult:=mrok
  else
   showmessage('至少选择一条送货单号!')
end;

procedure TForm_miscmatil.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if ads235.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_miscmatil.CheckBox1Click(Sender: TObject);
var
 rkey:integer;
begin
if checkbox1.Checked then
 begin
  rkey:=self.ads235RKEY.Value;
  self.ads235.DisableControls;
  ads235.First;
  while not ads235.Eof do
  begin
   dbgrid1.SelectedRows.CurrentRowSelected:=true;
   ads235.Next;
  end;
  self.ads235.EnableControls;
  ads235.Locate('rkey',rkey,[]);
 end
else
 begin
  rkey:=self.ads235RKEY.Value;
  self.ads235.DisableControls;
  ads235.First;
  while not ads235.Eof do
  begin
   if self.ads235RKEY.Value=rkey then
    dbgrid1.SelectedRows.CurrentRowSelected:=true
   else
    if dbgrid1.SelectedRows.CurrentRowSelected then
    dbgrid1.SelectedRows.CurrentRowSelected:=false;
   ads235.Next;
  end;
  self.ads235.EnableControls;
  ads235.Locate('rkey',rkey,[]);
 end;
end;

procedure TForm_miscmatil.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ads235sType.Value='1' then
    DBGrid1.Canvas.Font.Color := clRed;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
