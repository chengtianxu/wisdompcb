unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Menus,
  ComObj,Excel2000,ClipBrd, DBGridEh;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    Panel1: TPanel;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    ADODataSet1WORK_ORDER_NUMBER: TStringField;
    ADODataSet1INTIME: TDateTimeField;
    ADODataSet1CUST_CODE: TStringField;
    ADODataSet1pnl_size: TStringField;
    ADODataSet1QTY_BACKLOG: TFloatField;
    ADODataSet1PANELS: TIntegerField;
    ADODataSet1SCH_COMPL_DATE: TDateTimeField;
    ADODataSet1RELEASE_DATE: TDateTimeField;
    ADODataSet1DEPT_CODE: TStringField;
    ADODataSet1DEPT_NAME: TStringField;
    ADODataSet1PROD_STATUS: TSmallintField;
    ADODataSet1wip_area: TFloatField;
    ADODataSet1space_time: TStringField;
    ADODataSet1prodstatus: TStringField;
    PopupMenu1: TPopupMenu;
    BitBtn5: TBitBtn;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    PCS1: TMenuItem;
    PAN1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    Memo1: TMemo;
    ADODataSet1CUT_NO: TStringField;
    ADODataSet1SALES_ORDER: TStringField;
    N16: TMenuItem;
    N17: TMenuItem;
    DBGridEh1: TDBGridEh;
    ADODataSet1MANU_PART_NUMBER: TStringField;
    ADODataSet1MANU_PART_DESC: TStringField;
    ADODataSet1ANALYSIS_CODE_2: TStringField;
    ADODataSet1DSDesigner: TStringField;
    N3: TMenuItem;
    ADODataSet1OnlineStatus: TStringField;
    N18: TMenuItem;
    N19: TMenuItem;
    ADODataSet1PO_NUMBER: TStringField;
    N20: TMenuItem;
    Edit1: TEdit;
    Label1: TLabel;
    ADODataSet1latest_price: TFloatField;
    N9: TMenuItem;
    ADODataSet1so_oldnew: TStringField;
    N21: TMenuItem;
    ADODataSet1REFERENCE: TStringField;
    ADODataSet1wipmat: TStringField;
    N22: TMenuItem;
    N23: TMenuItem;
    ADODataSet1DSDesigner2: TFloatField;
    ADODataSet1ABBR_NAME: TStringField;
    N24: TMenuItem;
    ADODataSet1PROD_CODE: TStringField;
    ADODataSet1PRODUCT_NAME: TStringField;
    ADODataSet1LEAD_TIME: TSmallintField;
    ADODataSet1DSDesigner3: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure ADODataSet1CalcFields(DataSet: TDataSet);
    procedure BitBtn5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure dbgrideh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
   PreColumn: TColumnEh;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses term,common;

{$R *.dfm}
procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     dbgrideh1.DataSource.DataSet.MoveBy(1)
   else
     dbgrideh1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.ADODataSet1CalcFields(DataSet: TDataSet);
begin
 case self.ADODataSet1PROD_STATUS.Value of
  1: ADODataSet1.FieldByName('prodstatus').asstring:='等待审核';
  2: ADODataSet1.FieldByName('prodstatus').asstring:='待发放';
  3: ADODataSet1.FieldByName('prodstatus').asstring:='生产中';
  4: ADODataSet1.FieldByName('prodstatus').asstring:='外发生产';
  5: ADODataSet1.FieldByName('prodstatus').asstring:='待入仓';
  6: ADODataSet1.FieldByName('prodstatus').asstring:='待分配';
  9: ADODataSet1.FieldByName('prodstatus').asstring:='生产结束';
  102: ADODataSet1.FieldByName('prodstatus').asstring:='生产前暂缓';
  103: ADODataSet1.FieldByName('prodstatus').asstring:='生产中暂缓';
  202: ADODataSet1.FieldByName('prodstatus').asstring:='已取消';
 end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.N1Click(Sender: TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrideh1.FieldCount-1 do
  if dbgrideh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrideh1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrideh1.FieldCount-1 do
  if dbgrideh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrideh1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm1.dbgrideh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(self.ADODataSet1.CommandText);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
 Export_dbGridEH_to_Excel(dbgrideh1,self.Caption);
end;


procedure TForm1.BitBtn3Click(Sender: TObject);
begin
if self.ADODataSet1.Active then
begin
self.ADODataSet1.Close;
self.ADODataSet1.Prepared;
self.ADODataSet1.Open;
end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 i:byte;
begin

if form4.ShowModal=mrok then
 begin
  self.ADODataSet1.Close;
  self.ADODataSet1.CommandText:=self.Memo1.Lines.Text;

  for i:=1 to form4.SGrid1.RowCount-2 do
    self.ADODataSet1.CommandText:=ADODataSet1.CommandText+
    form4.SGrid1.Cells[2,i]+#13;
  self.ADODataSet1.Prepared;   
  self.ADODataSet1.Open;
 end;


end;

procedure TForm1.FormCreate(Sender: TObject);

begin
if not app_init_2(self.ADOConnection1) then
 begin
  showmsg('程序启动失败,请联系管理员!',1);
  application.Terminate;
 end;
  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

 OldGridWnd := dbgrideh1.WindowProc;
 dbgrideh1.WindowProc := NewGridWnd;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if ADOConnection1.Connected then
 begin
  form4:=tform4.Create(application);
  self.Memo1.Lines.Text:=
  self.ADODataSet1.CommandText;
  PreColumn := DBGridEh1.Columns[0];
  if (strtoint(vprev)=1) or (strtoint(vprev)=2) then
   n9.Enabled:=false;
 end;
end;


procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if (column.ReadOnly)  then
  if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   ADODataSet1.IndexFieldNames:=Column.FieldName;
  end
  else begin
   column.Title.SortMarker:=smDownEh;
   ADODataSet1.IndexFieldNames:=Column.FieldName+' DESC';
  end;
  
  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) and
     (column.ReadOnly) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if ADODataSet1.Active then
 if trim(Edit1.text)<>'' then
   ADODataSet1.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else ADODataSet1.filter := '';
end;

end.
