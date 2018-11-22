unit warehouse_mixi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj,Excel2000,ClipBrd,
  Buttons, Menus;

type
  TForm9 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADO53: TADOQuery;
    ADO53WORK_ORDER_NUMBER: TStringField;
    ADO53PROD_CODE: TStringField;
    ADO53CUST_CODE: TStringField;
    ADO53WAREHOUSE_CODE: TStringField;
    ADO53LOCATION: TStringField;
    ADO53QTY_ON_HAND: TFloatField;
    ADO53MFG_DATE: TDateTimeField;
    ADO53REFERENCE_NUMBER: TStringField;
    ADO53LATEST_PRICE: TFloatField;
    Edit1: TEdit;
    Label1: TLabel;
    ADO53so_mianji: TFloatField;
    ADO53ANALYSIS_CODE_2: TStringField;
    ADO53MANU_PART_NUMBER: TStringField;
    ADO53MANU_PART_DESC: TStringField;
    ADO53PRODUCT_NAME: TStringField;
    ADO53reference_60: TStringField;
    ADO53EXP_DATE: TDateTimeField;
    ADO53PO_NUMBER: TStringField;
    ADO53fed_tax_id_no: TStringField;
    ADO53CURR_NAME: TStringField;
    ADO53COMMISION_ON_TOOLING60: TStringField;
    ADO53REPORT_UNIT_VALUE1: TBCDField;
    ADO53TotalWgt: TFloatField;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    ADO53c_type: TStringField;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    ADO53SCH_DATE: TDateTimeField;
    ADO53SALES_ORDER: TStringField;
    ADO53PARTS_ORDERED: TFloatField;
    ADO53ABBR_NAME: TStringField;
    ADO53total_sq: TFloatField;
    ADO53employee_name: TStringField;
    ADO53cust_code10: TStringField;
    ADO53spec_place: TStringField;
    ADO53TTYPE: TStringField;
    ADO53SAMPLE_NR: TStringField;
    ADO53total_cost: TFloatField;
    ADO53state: TStringField;
    ADO53rep_employeename: TStringField;
    intgrfldADO53ischaban: TIntegerField;
    strngfldADO53zhouqi: TStringField;
    edt1: TEdit;
    lbl1: TLabel;
    edt2: TEdit;
    lbl2: TLabel;
    edt3: TEdit;
    lbl3: TLabel;
    ADO53ORIG_CUSTOMER: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure item_Click(Sender:TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   field_name:string; 
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
if ado53.State=dsedit then
 ado53.Post;
 form1.Show;
end;

procedure TForm9.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then showmessage(ado53.SQL.Text);
 if (ssCtrl in shift) and (key=46) then  abort;
 if (key=45) then abort;      //insert¼ü
end;

procedure TForm9.DataSource1DataChange(Sender: TObject; Field: TField);
begin
 if TDataSource(Sender).DataSet.Eof then TDataSource(Sender).DataSet.Cancel;
end;

procedure TForm9.item_Click(Sender:TObject);
var
  i:Integer;
begin
  (Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
  if (Sender as TMenuItem).Checked then
  begin
    for  i:=0  to DBGrid1.Columns.Count-1 do
    begin
      if (Sender as TMenuItem).Caption=DBGrid1.Columns[i].Title.Caption then
      begin
        DBGrid1.Columns[i].Visible:=True;
        Break;
      end;
    end;
  end
  else
  begin
    for i :=0  to DBGrid1.Columns.Count-1 do
    begin
      if (Sender as TMenuItem).Caption=DBGrid1.Columns[i].Title.Caption then
      begin
        DBGrid1.Columns[i].Visible:=False;
        Break;
      end;
    end;
  end;
end;

procedure TForm9.Button2Click(Sender: TObject);

 begin
 Export_dbGrid_to_Excel(dbgrid1,self.Caption);
  end;


procedure TForm9.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Ado53.Filter := self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  Ado53.Filter := '';
end;

procedure TForm9.DBGrid1TitleClick(Column: TColumn);
begin  {
if (column.FieldName<>'QTY_ON_HAND') and
   (column.FieldName<>'MFG_DATE') and
   (column.FieldName<>'LATEST_PRICE') and
   (column.FieldName<>'house_mianji') and
   (column.FieldName<>'so_mianji') and
   (column.FieldName<>field_name) and
   (Column.FieldName<>'EXP_DATE') and
   (Column.FieldName<>'SCH_DATE') then  }
if Column.Field.DataType in[ftString,ftWideString] then   
 begin
  field_name:=column.FieldName;
  label1.Caption := column.Title.Caption;
  edit1.SetFocus;
  ado53.Sort:=column.FieldName;
 end;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
  DBGrid1TitleClick(self.DBGrid1.Columns.Items[1]);
  if (vprev='4') or (vprev='2') then
  begin
    Self.ADO53REFERENCE_NUMBER.ReadOnly:=False;
    Self.ADO53spec_place.ReadOnly:=False;
  end;
end;

procedure TForm9.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm9.BitBtn4Click(Sender: TObject);
begin
    Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm9.BitBtn2Click(Sender: TObject);
begin
  PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TForm9.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (Trim(ADO53SCH_DATE.Text)='') then
  begin
    if (StrToDateTime(ADO53SCH_DATE.Text)<Now)and(StrToDateTime(ADO53EXP_DATE.Text)>Now) then
      DBGrid1.Canvas.Font.Color:=clBlue
    else if (StrToDateTime(ADO53SCH_DATE.Text)<Now)and(StrToDateTime(ADO53EXP_DATE.Text)<Now) then
      DBGrid1.Canvas.Font.Color:=clPurple;
  end
  else if not (Trim(ADO53EXP_DATE.Text)='') then
  begin
      if StrToDateTime(ADO53EXP_DATE.Text)<Now then
     DBGrid1.Canvas.Font.Color:=clRed;
  end;

  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TForm9.PopupMenu1Popup(Sender: TObject);
begin
  if (strtoint(vprev) <= 2)  then
   begin
   (sender as TPopupmenu).Items[15].Enabled:=false;
   (sender as TPopupmenu).Items[16].Enabled:=false;
   (sender as TPopupmenu).Items[17].Enabled:=false;
   end;
end;

procedure TForm9.FormActivate(Sender: TObject);
var
  i:Integer;
  item:TMenuItem;
begin
  self.field_name:='MANU_PART_NUMBER';

  for i :=0  to DBGrid1.Columns.Count-1 do
  begin
    item:=TMenuItem.Create(Self);
    item.Caption:=DBGrid1.Columns[i].Title.Caption;
    item.Checked:=DBGrid1.Columns[i].Visible;
    item.OnClick:=item_Click;
    PopupMenu1.Items.Add(item);
  end;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

end.
