unit po_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB, ExtCtrls;
type
  TForm_posearch = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    ADO0071: TADOQuery;
    DataSource2: TDataSource;
    ADO0071INV_NAME: TStringField;
    ADO0071INV_DESCRIPTION: TStringField;
    ADO0071recd_DATE: TDateTimeField;
    ADO0071extra_req: TStringField;
    ADO0071UNIT_NAME: TStringField;
    AQ70: TADOQuery;
    AQ70RKEY: TAutoIncField;
    AQ70PO_NUMBER: TStringField;
    AQ70CONFIRMATION_NUMBER: TStringField;
    AQ70PO_DATE: TDateTimeField;
    AQ70PO_TYPE: TStringField;
    AQ70CODE: TStringField;
    AQ70SUPPLIER_NAME: TStringField;
    AQ70abbr_warename: TStringField;
    AQ70abbr_suppname: TStringField;
    AQ70SHIPTO_ADDRESS: TStringField;
    AQ70CURR_CODE: TStringField;
    AQ70CURR_NAME: TStringField;
    AQ70EXCHANGE_RATE: TFloatField;
    AQ70DEPT_NAME: TStringField;
    AQ70CURRENCY_PTR: TIntegerField;
    AQ70SUPPLIER_POINTER: TIntegerField;
    AQ70WAREHOUSE_POINTER: TIntegerField;
    AQ70v_type: TStringField;
    ADO0071QUAN_RECD: TBCDField;
    ADO0071WO_PTR: TIntegerField;
    ADO0071PURCHASE_UNIT_PTR: TIntegerField;
    ADO0071TAX_2: TBCDField;
    ADO0071CONVERSION_FACTOR: TBCDField;
    ADO0071pr_unitname: TStringField;
    ADO0071INVT_PTR: TIntegerField;
    ADO0071rkey: TIntegerField;
    ADO0071inv_part_number: TStringField;
    AQ70WAREHOUSE_CODE: TStringField;
    AQ70WAREHOUSE_NAME: TStringField;
    ADO0071QUAN_ORD: TBCDField;
    ADO0071PRICE: TBCDField;
    ADO0071SHELF_LIFE: TSmallintField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AQ70CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);

  private
    { Private declarations }
   file_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form_posearch: TForm_posearch;

implementation

uses data_module;
{$R *.dfm}
procedure TForm_posearch.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm_posearch.Edit1Change(Sender: TObject);
begin
 IF trim(EDIT1.TEXT)<>'' THEN
  AQ70.Filter := self.file_name+' like ''%'+trim(edit1.text)+'%'''
 ELSE
  AQ70.FILTER := '';

if aq70.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_posearch.BitBtn1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm_posearch.DBGrid1DblClick(Sender: TObject);
begin
if not aq70.IsEmpty then
 ModalResult := mrok;
end;

procedure TForm_posearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not aq70.IsEmpty) then ModalResult := mrok;
end;

procedure TForm_posearch.AQ70CalcFields(DataSet: TDataSet);
begin
 if AQ70PO_TYPE.Value = 'S' then
  AQ70v_type.Value := '生产物料'
 else
  if AQ70PO_TYPE.Value = 'M' then
   AQ70v_type.Value := '非生产物料';
end;

procedure TForm_posearch.FormCreate(Sender: TObject);
begin
 aq70.Open;
 ado0071.Open;
 file_name:='PO_NUMBER';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd; 
end;

procedure TForm_posearch.DBGrid1TitleClick(Column: TColumn);
begin
if (column.ReadOnly) and (column.FieldName<>file_name) then
 begin
  file_name:=column.FieldName;
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
 end;
end;

end.
