unit p_shipment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, ExtCtrls, StdCtrls;

type
  TF_shipment = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQuery1number: TStringField;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1sys_date: TDateTimeField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1quantity: TIntegerField;
    ADOQuery1qty_received: TIntegerField;
    ADOQuery1reference: TStringField;
    ADOQuery1abbr_name10: TStringField;
    ADOQuery1cust_code: TStringField;
    ADOQuery1CUSTOMER_NAME: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1custpart_ptr: TIntegerField;
    ADOQuery1type: TWordField;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    v_colwidth: array[0..8] of integer;
    field_name: string;
    OldGridWnd : TWndMethod;
    procedure NewGridWnd(var Message: TMessage);
  public
    { Public declarations }
  end;

var
  F_shipment: TF_shipment;

implementation

uses damo;
{$R *.dfm}

procedure TF_shipment.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
  begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
    dbgrid1.DataSource.DataSet.MoveBy(1)
   else
    dbgrid1.DataSource.DataSet.MoveBy(-1)
  end
 else
  begin
   OldGridWnd(Message);
  end;
end;


procedure TF_shipment.FormCreate(Sender: TObject);
begin
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
  self.field_name := 'number';
  adoquery1.Open;
end;

procedure TF_shipment.FormShow(Sender: TObject);
var
 i:byte;
begin
 for i:=low(v_colwidth) to high(v_colwidth) do v_colwidth[i]:=dbgrid1.Columns[i].Width;
end;

procedure TF_shipment.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth) to high(v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-744)*v_colwidth[i]/720);
end;

procedure TF_shipment.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then showmessage(adoquery1.SQL.Text);
if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure TF_shipment.DBGrid1TitleClick(Column: TColumn);
begin
if (column.ReadOnly=true) and
   (column.FieldName<>self.field_name) then
 begin
  if column.FieldName<>'sys_date' then
   begin
    field_name:=column.FieldName;
    label1.Caption := column.Title.Caption;
   end;
  edit1.SetFocus;
  with adoquery1 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('order by '+column.FieldName);
    open;
   end;
 end;
end;

procedure TF_shipment.DBGrid1DblClick(Sender: TObject);
begin
 if (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure TF_shipment.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
   adoquery1.Filter := field_name+' like ''%'+trim(edit1.Text)+'%'''
  else
   adoquery1.Filter := '';

if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
