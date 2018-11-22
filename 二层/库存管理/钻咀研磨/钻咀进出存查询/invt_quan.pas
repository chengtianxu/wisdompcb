unit invt_quan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls,ComObj, Excel2000, ClipBrd;

type
  TForm4 = class(TForm)
    ADO22: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADO22INV_PART_NUMBER: TStringField;
    ADO22INV_PART_DESCRIPTION: TStringField;
    ADO22GROUP_NAME: TStringField;
    ADO22quan_total: TFloatField;
    ADO22avl_price: TFloatField;
    ADO22amount: TFloatField;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ADO22UNIT_CODE: TStringField;
    ADO22ABBR_NAME: TStringField;
    ADO22inv_group_name: TStringField;
    ADO22inv_name: TStringField;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    ADO22STOCK_BASE: TFloatField;
    ADO22STOCK_SELL: TFloatField;
    ADO22total_weigth: TFloatField;
    ADO22total_area: TFloatField;
    ADO22supplier2: TStringField;
    ADO22amount_notax: TBCDField;
    ADO22QUAN_ON_HAND: TBCDField;
    ADO22CONSIGN_ONHAND_QTY: TFloatField;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
uses main, invt_report,common;
{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm4.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(ado22.SQL.Text);
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
 try
  form_report:=tform_report.Create(application);
  if strtoint(vprev)<=2 then       //х╗оч
   begin
    form_report.ppDBText4.Visible:=false;
    form_report.ppDBText5.Visible:=false;
   end;
  form_report.ppReport1.Print;
 finally
  form_report.free;
 end;
end;

procedure TForm4.Button2Click(Sender: TObject);
 begin
form1.CopyDbDataToExcel([dbgrid1],self.Caption);
  end;

procedure TForm4.FormCreate(Sender: TObject);
begin
field_name:='INV_PART_NUMBER';
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
if (trim(edit1.Text)<>'') and (checkbox1.Checked) then
 Ado22.Filter := field_name+' like ''%'+Trim(Edit1.Text)+'%'''
else
 if (trim(edit1.Text)<>'') and (not checkbox1.Checked) then
  Ado22.Filter := field_name+' like ''%'+Trim(Edit1.Text)+'%'''+
                   'and quan_total >0'
 else
  if (trim(edit1.Text)='') and (not checkbox1.Checked) then
   Ado22.Filter :='quan_total >0'
  else
   ado22.Filter := '';
end;

procedure TForm4.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.FieldName<>'quan_total') and
    (column.FieldName<>'avl_price') and
    (column.FieldName<>'amount') and
    (column.FieldName<>'STOCK_BASE') and
    (column.FieldName<>'total_weigth') and
    (column.FieldName<>'STOCK_SELL') and
    (column.FieldName<>'total_area') and    
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label1.Caption := column.Title.Caption;
  edit1.SetFocus;
  ado22.sort:=column.FieldName+' ASC';
  {with ado22 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('order by '+column.FieldName);
    open;
   end;}
 end;
end;

procedure TForm4.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if (ADO22CONSIGN_ONHAND_QTY.Value > 0) and
    (ADO22CONSIGN_ONHAND_QTY.Value > ADO22QUAN_ON_HAND.Value) then
  DBGrid1.Canvas.Font.Color := clred;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
