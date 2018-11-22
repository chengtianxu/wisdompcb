unit AllBook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ADODB, Buttons;

type
  TForm_AllBook = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    DataSource1: TDataSource;
    ADO213: TADOQuery;
    ADO213RKEY: TAutoIncField;
    ADO213MANU_PART_NUMBER: TStringField;
    ADO213PO_NUMBER: TStringField;
    ADO213ANALYSIS_CODE_2: TStringField;
    ADO213MANU_PART_DESC: TStringField;
    ADO213ORIG_REQUEST_DATE: TDateTimeField;
    ADO213ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADO213PARTS_ORDERED: TIntegerField;
    ADO213PART_PRICE: TFloatField;
    ADO213CURR_CODE: TStringField;
    ADO213PO_DATE: TDateTimeField;
    ADO213status: TWordField;
    ADO213user_ptr: TIntegerField;
    ADO213submit_date: TDateTimeField;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    ADO213audit_ptr: TIntegerField;
    ADO213audit_date: TDateTimeField;
    ADO213so_oldnew: TStringField;
    ADO213is_alter: TWordField;
    ADO213Lis_num: TStringField;
    ADO213CUST_CODE: TStringField;
    ADO213orig_customer: TStringField;
    ADO213REFERENCE_NUMBER: TStringField;
    ADO213WAREHOUSE_CODE: TStringField;
    ADO213EDI_FLAG_FOR_INVOICE: TSmallintField;
    ADO213UsedQuantity: TIntegerField;
    ADO213Remark: TStringField;
    ADO213close_Ren: TIntegerField;
    ADO213so_style: TWordField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_AllBook: TForm_AllBook;

implementation

uses damo;

{$R *.dfm}

procedure TForm_AllBook.DBGrid1DblClick(Sender: TObject);
begin
  if ADO213.RecordCount = 0 then
    ModalResult := mrCancel
  else
    ModalResult := mrok;
end;

procedure TForm_AllBook.RadioGroup1Click(Sender: TObject);
begin
 label1.Caption := radiogroup1.Items.Strings[radiogroup1.itemindex];
 edit1.SetFocus;
end;

procedure TForm_AllBook.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  if radiogroup1.ItemIndex=0 then
   ADO213.Filter := 'MANU_PART_NUMBER like ''%'+trim(edit1.Text)+'%'''
  else
   if radiogroup1.ItemIndex=1 then
    ADO213.Filter := 'MANU_PART_DESC like ''%'+trim(edit1.Text)+'%'''
   else
    ADO213.Filter := 'ANALYSIS_CODE_2 like ''%'+trim(edit1.Text)+'%'''
 else
  ADO213.Filter := '';

 if ADO213.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;
end;

procedure TForm_AllBook.BitBtn3Click(Sender: TObject);
begin
 Edit1.text:='';
 Edit1.SetFocus ;
end;

procedure TForm_AllBook.CheckBox1Click(Sender: TObject);
var
 rkey:integer;
begin
if checkbox1.Checked then
 begin
  rkey:=self.ADO213RKEY.Value;
  self.ADO213.DisableControls;
  ADO213.First;
  while not ADO213.Eof do
  begin
   dbgrid1.SelectedRows.CurrentRowSelected:=true;
   ADO213.Next;
  end;
  self.ADO213.EnableControls;
  ADO213.Locate('rkey',rkey,[]);
 end
else
 begin
  rkey:=self.ADO213RKEY.Value;
  self.ADO213.DisableControls;
  ADO213.First;
  while not ADO213.Eof do
  begin
   if self.ADO213RKEY.Value=rkey then
    dbgrid1.SelectedRows.CurrentRowSelected:=true
   else
    if dbgrid1.SelectedRows.CurrentRowSelected then
    dbgrid1.SelectedRows.CurrentRowSelected:=false;
   ADO213.Next;
  end;
  self.ADO213.EnableControls;
  ADO213.Locate('rkey',rkey,[]);
 end;
end;

end.
