unit warehouse_mixi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj,Excel2000,ClipBrd;

type
  TForm9 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADO53: TADOQuery;
    Edit1: TEdit;
    Label1: TLabel;
    ADO53SALES_ORDER: TStringField;
    ADO53PO_NUMBER: TStringField;
    ADO53PROD_CODE: TStringField;
    ADO53PRODUCT_NAME: TStringField;
    ADO53MANU_PART_NUMBER: TStringField;
    ADO53MANU_PART_DESC: TStringField;
    ADO53QUANTITY: TIntegerField;
    ADO53EMPLOYEE_NAME: TStringField;
    ADO53MFG_DATE: TDateTimeField;
    ADO53REMARK: TStringField;
    ADO53PRICE: TBCDField;
    ADO53TAX_RATE: TBCDField;
    ADO53CUST_CODE: TStringField;
    ADO53CUSTOMER_NAME: TStringField;
    ADO53ABBR_NAME: TStringField;
    ADO53CURR_CODE: TStringField;
    ADO53CURR_NAME: TStringField;
    ADO53EXCH_RATE: TBCDField;
    ADO53QTY_ON_HAND: TIntegerField;
    ADO53ANALYSIS_CODE_2: TStringField;
    ADO53delivery_no: TStringField;
    ADO53unit_sq: TFloatField;
    ADO53inArea: TFloatField;
    ADO53SHIP_PTR: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses main,common;

{$R *.dfm}
procedure TForm9.NewGridWnd(var Message: TMessage);
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

procedure TForm9.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ado53.State=dsedit then ado53.Post;
 form1.Show;
end;

procedure TForm9.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then showmessage(ado53.SQL.Text);
 if (ssCtrl in shift) and (key=46) then  abort;
 if (ssAlt in shift) and (key=45) then abort;
end;

procedure TForm9.DataSource1DataChange(Sender: TObject; Field: TField);
begin
 if TDataSource(Sender).DataSet.Eof then TDataSource(Sender).DataSet.Cancel;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
 Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;


procedure TForm9.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Ado53.Filter := ADO53.Sort +' like ''%'+trim(edit1.Text)+'%'''
 else
  Ado53.Filter := '';
end;

procedure TForm9.DBGrid1TitleClick(Column: TColumn);
begin
 ADO53.Sort:=Column.FieldName;
 label1.Caption:=Column.Title.Caption;
 edit1.Enabled:=true;
 edit1.SetFocus;
 case Column.Field.Index of
   6,7,9,10,11,18:edit1.Enabled:=false;
 end;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
  self.DBGrid1TitleClick(self.DBGrid1.Columns.Items[1]);
end;

end.
