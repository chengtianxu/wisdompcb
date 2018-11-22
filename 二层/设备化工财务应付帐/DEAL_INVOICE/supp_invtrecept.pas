unit supp_invtrecept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls;

type
  TForm_suppinvtrecept = class(TForm)
    DBGrid1: TDBGrid;
    aq456: TADOQuery;
    DataSource1: TDataSource;
    aq456RKEY: TIntegerField;
    aq456GRN_NUMBER: TStringField;
    aq456DELIVER_NUMBER: TStringField;
    aq456PO_NUMBER: TStringField;
    aq456ship_DATE: TDateTimeField;
    aq456EMPLOYEE_NAME: TStringField;
    aq456TTYPE: TWordField;
    aq456CURR_NAME: TStringField;
    aq456amount: TBCDField;
    aq456v_type: TStringField;
    DataSource2: TDataSource;
    aq22: TADOQuery;
    DBGrid2: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    aq22INV_NAME: TStringField;
    aq22INV_DESCRIPTION: TStringField;
    aq22QUANTITY: TBCDField;
    aq22UNIT_NAME: TStringField;
    aq22PRICE: TBCDField;
    aq22TAX_2: TBCDField;
    aq22amount: TBCDField;
    aq22tax_amount: TBCDField;
    aq22GRN_PTR: TIntegerField;
    aq22RKEY: TIntegerField;
    aq22SOURCE_PTR: TIntegerField;
    Edit1: TEdit;
    Label1: TLabel;
    procedure aq456CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form_suppinvtrecept: TForm_suppinvtrecept;

implementation

uses datamd;

{$R *.dfm}
procedure TForm_suppinvtrecept.NewGridWnd(var Message: TMessage);
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

procedure TForm_suppinvtrecept.aq456CalcFields(DataSet: TDataSet);
begin
 case
  self.Aq456TTYPE.Value of
  1:Aq456v_type.Value:='编码入库';
  2:Aq456v_type.Value:='杂项入库';
  3:Aq456v_type.Value:='直接入库';
 end;
end;

procedure TForm_suppinvtrecept.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
 field_name:='GRN_NUMBER';     //设备过滤字段 
end;

procedure TForm_suppinvtrecept.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
  aq456.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  aq456.Filter:='';
end;

procedure TForm_suppinvtrecept.DBGrid1TitleClick(Column: TColumn);
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
 end
else
 edit1.SetFocus;
end;

procedure TForm_suppinvtrecept.DBGrid1DblClick(Sender: TObject);
begin
 if not self.aq456.IsEmpty then   self.ModalResult:=mrok;
end;

procedure TForm_suppinvtrecept.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(aq456.SQL.Text);
end;

procedure TForm_suppinvtrecept.DBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(aq22.SQL.Text);
end;

end.
