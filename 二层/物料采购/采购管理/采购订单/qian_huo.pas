unit qian_huo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Grids, DBGrids,ComObj, Excel2000,
  ClipBrd, ComCtrls, DBGridEh, Buttons;

type
  TForm21 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1INV_NAME: TStringField;
    ADOQuery1INV_DESCRIPTION: TStringField;
    ADOQuery1PO_NUMBER: TStringField;
    ADOQuery1PO_DATE: TDateTimeField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1QUAN_ORD: TFloatField;
    ADOQuery1tax_price: TFloatField;
    ADOQuery1TAX_2: TBCDField;
    ADOQuery1CURR_NAME: TStringField;
    ADOQuery1EXCHANGE_RATE: TFloatField;
    ADOQuery1UNIT_NAME: TStringField;
    ADOQuery1DSDesigner: TDateTimeField;
    ADOQuery1DSDesigner2: TDateTimeField;
    ADOQuery1QUAN_RECD: TFloatField;
    ADOQuery1DSDesigner3: TFloatField;
    ADOQuery1DSDesigner4: TStringField;
    ADOQuery1DSDesigner5: TStringField;
    ADOQuery1DSDesigner6: TStringField;
    ADOQuery1DSDesigner7: TBooleanField;
    ADOQuery1abbr_name15: TStringField;
    ADOQuery1DSDesigner8: TStringField;
    ADOQuery1DSDesigner9: TStringField;
    ADOQuery1DSDesigner10: TStringField;
    ADOQuery1DSDesigner11: TStringField;
    ADOQuery1DSDesigner12: TStringField;
    ADOQuery1DSDesigner13: TStringField;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    DBGridEh1: TDBGridEh;
    ADOQuery2: TADOQuery;
    ADOQuery2INV_PART_NUMBER: TStringField;
    ADOQuery2INV_NAME: TStringField;
    ADOQuery2INV_DESCRIPTION: TStringField;
    ADOQuery2PO_NUMBER: TStringField;
    ADOQuery2PO_DATE: TDateTimeField;
    ADOQuery2ABBR_NAME: TStringField;
    ADOQuery2QUAN_ORD: TFloatField;
    ADOQuery2tax_price: TFloatField;
    ADOQuery2TAX_2: TBCDField;
    ADOQuery2CURR_NAME: TStringField;
    ADOQuery2EXCHANGE_RATE: TFloatField;
    ADOQuery2UNIT_NAME: TStringField;
    ADOQuery2DSDesigner: TDateTimeField;
    ADOQuery2DSDesigner2: TDateTimeField;
    ADOQuery2QUAN_RECD: TFloatField;
    ADOQuery2DSDesigner3: TFloatField;
    ADOQuery2DSDesigner4: TStringField;
    ADOQuery2DSDesigner5: TStringField;
    ADOQuery2DSDesigner6: TStringField;
    ADOQuery2DSDesigner7: TBooleanField;
    ADOQuery2abbr_name15: TStringField;
    ADOQuery2DSDesigner8: TStringField;
    ADOQuery2DSDesigner9: TStringField;
    ADOQuery2DSDesigner10: TStringField;
    ADOQuery2DSDesigner11: TStringField;
    ADOQuery2DSDesigner12: TStringField;
    ADOQuery2DSDesigner13: TStringField;
    ADOQuery3: TADOQuery;
    ADOQuery3INV_PART_NUMBER: TStringField;
    ADOQuery3INV_NAME: TStringField;
    ADOQuery3INV_DESCRIPTION: TStringField;
    ADOQuery3PO_NUMBER: TStringField;
    ADOQuery3PO_DATE: TDateTimeField;
    ADOQuery3ABBR_NAME: TStringField;
    ADOQuery3QUAN_ORD: TFloatField;
    ADOQuery3tax_price: TFloatField;
    ADOQuery3TAX_2: TBCDField;
    ADOQuery3CURR_NAME: TStringField;
    ADOQuery3EXCHANGE_RATE: TFloatField;
    ADOQuery3UNIT_NAME: TStringField;
    ADOQuery3DSDesigner: TDateTimeField;
    ADOQuery3DSDesigner2: TDateTimeField;
    ADOQuery3QUAN_RECD: TFloatField;
    ADOQuery3DSDesigner3: TFloatField;
    ADOQuery3DSDesigner4: TStringField;
    ADOQuery3DSDesigner5: TStringField;
    ADOQuery3DSDesigner6: TStringField;
    ADOQuery3DSDesigner7: TBooleanField;
    ADOQuery3abbr_name15: TStringField;
    ADOQuery3DSDesigner8: TStringField;
    ADOQuery3DSDesigner9: TStringField;
    ADOQuery3DSDesigner10: TStringField;
    ADOQuery3DSDesigner11: TStringField;
    ADOQuery3DSDesigner12: TStringField;
    ADOQuery3DSDesigner13: TStringField;
    ADOQuery4: TADOQuery;
    ADOQuery4date1: TDateTimeField;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dtpk1Change(Sender: TObject);
    procedure dtpk2Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
       
   PreColumn: TColumnEh;
    { Private declarations }
   v_colwidth: array[0..8] of integer; 
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd(var Message: TMessage);
  public
    { Public declarations }
  end;

var
  Form21: TForm21;

implementation

uses damo,common;

{$R *.dfm}
procedure TForm21.NewGridWnd(var Message: TMessage);
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

procedure TForm21.FormCreate(Sender: TObject);
begin
//adoquery1.Open;
//field_name:='INV_NAME';
//DateSeparator := '-';
//ShortDateFormat := 'yyyy-mm-dd';
//OldGridWnd := DBGrid1.WindowProc;
//DBGrid1.WindowProc := NewGridWnd;
  PreColumn := DBGridEh1.Columns[0];
  dtpk1.Date:=date()-5;
  dtpk2.Date:=date();
  ADOQuery1.Close;
  ADOQuery1.Parameters[0].Value:=dtpk1.Date;
  ADOQuery1.Parameters[1].Value:=dtpk2.Date;
  ADOQuery1.Parameters[2].Value:=dtpk1.Date;
  ADOQuery1.Parameters[3].Value:=dtpk2.Date;
  ADOQuery1.Open;
  ADOQuery4.Close;
  ADOQuery4.Open;
end;

procedure TForm21.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.ReadOnly=true) and (field_name<>column.FieldName) then
 begin
  for i:=0 to dbgrid1.Columns.Count-1 do
   dbgrid1.Columns[i].Title.Color:=clBtnface;
  column.Title.Color:=clRed;
  field_name:=column.FieldName;
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
 end;
end;

procedure TForm21.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrideh1.DataSource.DataSet.Filter:='';

end;

procedure TForm21.FormShow(Sender: TObject);
var
 i:byte;
begin
 for i:=low(v_colwidth) to high(v_colwidth) do
  v_colwidth[i]:=dbgrid1.Columns[i].Width;
  CheckBox1.Checked:=True;
end;

procedure TForm21.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth) to high (v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-864)*v_colwidth[i]/840);
end;

procedure TForm21.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if CheckBox2.Checked= True then
 begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
   column.Title.SortMarker:=smUpEh;
   ADOQuery3.Sort:=Column.FieldName;
  end
  else
  begin
   column.Title.SortMarker:=smDownEh;
   ADOQuery3.Sort:=Column.FieldName+' DESC';
  end;
 end;

 if CheckBox1.Checked= True and CheckBox2.Checked=False then
 begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
   column.Title.SortMarker:=smUpEh;
   ADOQuery2.Sort:=Column.FieldName;
  end
  else
  begin
   column.Title.SortMarker:=smDownEh;
   ADOQuery2.Sort:=Column.FieldName+' DESC';
  end;
 end;

 if CheckBox1.Checked=False then
 begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
   column.Title.SortMarker:=smUpEh;
   ADOQuery1.Sort:=Column.FieldName;
  end
  else
  begin
   column.Title.SortMarker:=smDownEh;
   ADOQuery1.Sort:=Column.FieldName+' DESC';
  end;
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

procedure TForm21.CheckBox1Click(Sender: TObject);
var text1:string;
begin
 if CheckBox1.checked=True then
  begin
   CheckBox2.Enabled:=True;
   ADOQuery2.Close;
   DataSource1.DataSet:=ADOQuery2;
   ADOQuery2.Parameters[0].Value:=dtpk1.Date;
   ADOQuery2.Parameters[1].Value:=dtpk2.Date;
   ADOQuery2.Parameters[2].Value:=dtpk1.Date;
   ADOQuery2.Parameters[3].Value:=dtpk2.Date;
   ADOQuery2.Open;
  end
 else
 begin
   CheckBox2.Checked:=False;
   CheckBox2.Enabled:= False;
   ADOQuery1.Close;
   DataSource1.DataSet:=ADOQuery1;
   ADOQuery1.Parameters[0].Value:=dtpk1.Date;
   ADOQuery1.Parameters[1].Value:=dtpk2.Date;
   ADOQuery1.Parameters[2].Value:=dtpk1.Date;
   ADOQuery1.Parameters[3].Value:=dtpk2.Date;
   ADOQuery1.Open;

 end;

 //因在途物料和已到交期是用不同query实现,当切换之后实现用原关键字过滤需要触发改变事件
  text1:=Edit1.Text;
  Edit1.Clear;
  Edit1.Text:=text1;
end;

procedure TForm21.BitBtn2Click(Sender: TObject);
begin
  if ADOQuery1.IsEmpty then exit;
  Export_dbGridEH_to_Excel(DBGridEh1,'在途物料查询')
end;

procedure TForm21.dtpk1Change(Sender: TObject);
begin
 if CheckBox1.Checked=True then
 begin
  ADOQuery2.Close;
  ADOQuery2.Parameters[0].Value:=dtpk1.Date;
  ADOQuery2.Parameters[1].Value:=dtpk2.Date;
  ADOQuery2.Parameters[2].Value:=dtpk1.Date;
  ADOQuery2.Parameters[3].Value:=dtpk2.Date;
  ADOQuery2.Open;
 end;
 if CheckBox1.Checked=True then
 begin
  ADOQuery3.Close;
  ADOQuery3.Parameters[0].Value:=dtpk1.Date;
  ADOQuery3.Parameters[1].Value:=dtpk2.Date;
  ADOQuery3.Parameters[2].Value:=dtpk1.Date;
  ADOQuery3.Parameters[3].Value:=dtpk2.Date;
  ADOQuery3.Open;
 end
 else
 begin
  ADOQuery1.Close;
  ADOQuery1.Parameters[0].Value:=dtpk1.Date;
  ADOQuery1.Parameters[1].Value:=dtpk2.Date;
  ADOQuery1.Parameters[2].Value:=dtpk1.Date;
  ADOQuery1.Parameters[3].Value:=dtpk2.Date;
  ADOQuery1.Open;
 end;

end;

procedure TForm21.dtpk2Change(Sender: TObject);
begin
 if CheckBox1.Checked=True then
 begin
  ADOQuery2.Close;
  ADOQuery2.Parameters[0].Value:=dtpk1.Date;
  ADOQuery2.Parameters[1].Value:=dtpk2.Date;
  ADOQuery2.Parameters[2].Value:=dtpk1.Date;
  ADOQuery2.Parameters[3].Value:=dtpk2.Date;
  ADOQuery2.Open;
 end;
 if CheckBox1.Checked=True then
 begin
  ADOQuery3.Close;
  ADOQuery3.Parameters[0].Value:=dtpk1.Date;
  ADOQuery3.Parameters[1].Value:=dtpk2.Date;
  ADOQuery3.Parameters[2].Value:=dtpk1.Date;
  ADOQuery3.Parameters[3].Value:=dtpk2.Date;
  ADOQuery3.Open;
 end
 else
 begin
  ADOQuery1.Close;
  ADOQuery1.Parameters[0].Value:=dtpk1.Date;
  ADOQuery1.Parameters[1].Value:=dtpk2.Date;
  ADOQuery1.Parameters[2].Value:=dtpk1.Date;
  ADOQuery1.Parameters[3].Value:=dtpk2.Date;
  ADOQuery1.Open;
 end;
end;

procedure TForm21.CheckBox2Click(Sender: TObject);
var text1:string;
begin
 if CheckBox2.checked=True then
  begin
   ADOQuery3.Close;
   DataSource1.DataSet:=ADOQuery3;
   ADOQuery3.Parameters[0].Value:=dtpk1.Date;
   ADOQuery3.Parameters[1].Value:=dtpk2.Date;
   ADOQuery3.Parameters[2].Value:=dtpk1.Date;
   ADOQuery3.Parameters[3].Value:=dtpk2.Date;
   ADOQuery3.Open;
  end
 else
 begin
  if CheckBox1.checked=True then
  begin
   CheckBox2.Enabled:=True;
   ADOQuery2.Close;
   DataSource1.DataSet:=ADOQuery2;
   ADOQuery2.Parameters[0].Value:=dtpk1.Date;
   ADOQuery2.Parameters[1].Value:=dtpk2.Date;
   ADOQuery2.Parameters[2].Value:=dtpk1.Date;
   ADOQuery2.Parameters[3].Value:=dtpk2.Date;
   ADOQuery2.Open;
  end
  else
  begin
   ADOQuery1.Close;
   DataSource1.DataSet:=ADOQuery1;
   ADOQuery1.Parameters[0].Value:=dtpk1.Date;
   ADOQuery1.Parameters[1].Value:=dtpk2.Date;
   ADOQuery1.Parameters[2].Value:=dtpk1.Date;
   ADOQuery1.Parameters[3].Value:=dtpk2.Date;
   ADOQuery1.Open;
  end;
 end;
  text1:=Edit1.Text;
  Edit1.Clear;
  Edit1.Text:=text1;
end;

procedure TForm21.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if (CheckBox2.Checked=False) and (CheckBox1.Checked=False)  then
 begin
  if ADOQuery4date1.Value>ADOQuery1DSDesigner.Value then
  begin
   DBGridEh1.Canvas.Font.Color :=clred ;
   DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else
  begin
   DBGridEh1.Canvas.Font.Color:=clNone;
   DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

 end;

 if CheckBox1.Checked=True then
 begin
  if  ADOQuery4date1.Value>ADOQuery2DSDesigner.Value then
  begin
   DBGridEh1.Canvas.Font.Color:=clRed;
   DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else
  begin
   DBGridEh1.Canvas.Font.Color:=clNone;
   DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  end;
 end;
   if CheckBox2.Checked=True then
 begin
   if ADOQuery4date1.Value>ADOQuery3DSDesigner.Value then
   begin
    DBGridEh1.Canvas.Font.Color := clred;
    DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end
   else
   begin
    DBGridEh1.Canvas.Font.Color:=clNone;
    DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
  end ;
end;
procedure TForm21.BitBtn4Click(Sender: TObject);
begin
  if ADOQuery1.IsEmpty then exit;
  Export_dbGridEH_to_Excel(DBGridEh1,'在途物料查询')
end;

procedure TForm21.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 begin
  if (chr(key)='V') and (ssalt in shift) then
  begin
   if CheckBox2.Checked=True then showmessage(ADOQuery3.SQL.Text)else
   if CheckBox1.Checked=True then showmessage(ADOQuery2.SQL.Text) else
   showmessage(ADOQuery1.SQL.Text);
  end;
 end;
end.
