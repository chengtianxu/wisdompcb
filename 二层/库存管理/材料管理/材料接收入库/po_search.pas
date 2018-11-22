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
    ADO0071QUAN_RECD: TBCDField;
    ADO0071WO_PTR: TIntegerField;
    ADO0071PURCHASE_UNIT_PTR: TIntegerField;
    ADO0071TAX_2: TBCDField;
    ADO0071CONVERSION_FACTOR: TBCDField;
    ADO0071pr_unitname: TStringField;
    ADO0071INVT_PTR: TIntegerField;
    ADO0071rkey: TIntegerField;
    ADO0071inv_part_number: TStringField;
    ADO0071QUAN_ORD: TBCDField;
    ADO0071SHELF_LIFE: TSmallintField;
    ADO0071tax_price: TFloatField;
    ADO0071rohs: TStringField;
    AQ70: TADODataSet;
    AQ70RKEY: TIntegerField;
    AQ70PO_TYPE: TStringField;
    AQ70PO_NUMBER: TStringField;
    AQ70CONFIRMATION_NUMBER: TStringField;
    AQ70PO_DATE: TDateTimeField;
    AQ70CODE: TStringField;
    AQ70SUPPLIER_NAME: TStringField;
    AQ70abbr_suppname: TStringField;
    AQ70abbr_warename: TStringField;
    AQ70WAREHOUSE_POINTER: TIntegerField;
    AQ70WAREHOUSE_CODE: TStringField;
    AQ70WAREHOUSE_NAME: TStringField;
    AQ70CURRENCY_PTR: TIntegerField;
    AQ70CURR_CODE: TStringField;
    AQ70CURR_NAME: TStringField;
    AQ70EXCHANGE_RATE: TFloatField;
    AQ70DEPT_NAME: TStringField;
    AQ70SHIPTO_ADDRESS: TStringField;
    AQ70SUPPLIER_POINTER: TIntegerField;
    ADO0071DSDesigner: TFloatField;
    aq0072: TADOQuery;
    DataSource3: TDataSource;
    aq0072DESCRIPTION: TStringField;
    aq0072GUI_GE: TStringField;
    aq0072DESCRIPTION2: TStringField;
    aq0072QUAN_ORD: TFloatField;
    aq0072tax_price: TFloatField;
    aq0072STATE_TAX: TBCDField;
    aq0072DEL_DATE: TDateTimeField;
    aq0072rohs: TStringField;
    aq0072UNIT_PTR: TIntegerField;
    aq0072UNIT_NAME: TStringField;
    aq0072DSDesigner: TFloatField;
    DBGrid3: TDBGrid;
    Panel3: TPanel;
    aq0072QUANTITY_RECEIVED: TFloatField;
    aq0072rkey: TIntegerField;
    AQ70v_type: TStringField;
    ADO0071avl_flag: TStringField;
    AQ70PURCHASE_TYPE: TStringField;
    ADO0071STOCK_BASE: TFloatField;
    ADO0071CRITICAL_MATL_FLAG: TWordField;
    ADO0071QUAN_IN_INSP: TFloatField;
    ADO0071if_caf: TWideStringField;
    ADO0071EMPLOYEE_NAME: TStringField;
    ADO0071DEPT_NAME: TStringField;
    ADO0071EMPL_CODE: TStringField;
    ADO0071DEPT_CODE: TStringField;
    aq0072DEPT_CODE: TStringField;
    aq0072DEPT_NAME: TStringField;
    aq0072EMPL_CODE: TStringField;
    aq0072EMPLOYEE_NAME: TStringField;
    AQ70ANALYSIS_CODE_1: TStringField;
    ADO0071reason: TStringField;
    aq0072reason: TStringField;
    CheckBox1: TCheckBox;
    aq0072avl_flag: TStringField;
    ADO0071ORIG_ABBRNAME: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
//   v_colwidth: array of integer;
   strSQL71:string;
   dbgrid_width:integer;
   file_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form_posearch: TForm_posearch;

implementation

uses data_module,common;
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
//2017-06-12tang
  if (self.AQ70PO_TYPE.Value='S') and (ADO0071.RecordCount=0) then
  begin
    ShowMessage('该采购单据没有可以入仓的数据！');
    Exit;
  end;
//end 2017-06-12
if not aq70.IsEmpty then
 ModalResult := mrok;
end;

procedure TForm_posearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not aq70.IsEmpty) then ModalResult := mrok;
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(aq70.CommandText);

end;

procedure TForm_posearch.FormCreate(Sender: TObject);
begin
 strSQL71:=ADO0071.SQL.Text;
 file_name:='PO_NUMBER';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
 dbgrid_width:=dbgrid1.Width; 
end;

procedure TForm_posearch.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.FieldName<>aq70.IndexFieldNames) and
   (column.FieldName<>'v_type') then
 aq70.IndexFieldNames:=column.FieldName;

if (column.ReadOnly) and (column.FieldName<>file_name) then
 begin
  file_name:=column.FieldName;
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end;
end;

procedure TForm_posearch.FormShow(Sender: TObject);
//var
// i:byte;
begin
 aq70.Close;
 aq70.Open;
 ADO0071.Close;
 ADO0071.SQL.Clear;
// ado0071.Open;
 ADO0071.SQL.Text:=strSQL71;   //+' and ((data0071.QUAN_IN_INSP-data0071.QUAN_RECD)>0 or data0071.avl_flag=''N'') ';
 ado0071.Open;
 aq0072.open;

// setlength(v_colwidth,dbgrid1.FieldCount);
// for i:=0 to high(v_colwidth) do v_colwidth[i] := dbgrid1.Columns[i].Width;
if (strtoint(vprev) < 3) then
 begin
  dbgrid3.Columns[5].Visible:=false;
  dbgrid3.Columns[6].Visible:=false;
  dbgrid2.Columns[4].Visible:=false;
  dbgrid2.Columns[5].Visible:=false;

 end;
end;

procedure TForm_posearch.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if self.AQ70PO_TYPE.Value='S' then
 begin
  dbgrid2.BringToFront;
 end
else
 begin
  dbgrid3.BringToFront;
 end;
end;

procedure TForm_posearch.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if self.ADO0071CRITICAL_MATL_FLAG.Value=1 then
  DBGrid2.Canvas.Font.Color := clRed;

  DBGrid2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_posearch.CheckBox1Click(Sender: TObject);
begin
  if (CheckBox1.Checked=False) then
  begin
    ADO0071.Close;
    ADO0071.SQL.Text:=strSQL71+' and ((data0071.QUAN_IN_INSP-data0071.QUAN_RECD)>0 or data0071.avl_flag=''N'') ';
    ado0071.Open;
  end else
  begin
    ADO0071.Close;
    ADO0071.SQL.Text:=strSQL71;
    ado0071.Open;
  end;
end;

procedure TForm_posearch.Button1Click(Sender: TObject);
begin
//2017-06-12tang
  if (self.AQ70PO_TYPE.Value='S') and (ADO0071.RecordCount=0) then
  begin
    ShowMessage('该采购单据没有可以入仓的数据！');
    Exit;
  end;
  ModalResult := mrok;
//end 2017-06-12
end;

end.
