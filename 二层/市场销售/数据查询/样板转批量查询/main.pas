unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, ExtCtrls;
  
type
  Tmainform = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1cust_code: TStringField;
    ADOQuery1zcs: TIntegerField;
    ADOQuery1xys: TIntegerField;
    ADOQuery1zcl: TBCDField;
    ADOQuery1ABBR_NAME: TStringField;
    BitBtn2: TBitBtn;
    ADOQuery2: TADOQuery;
    Label4: TLabel;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
    OldGridWnd : TWndMethod;
    procedure NewGridWnd(var Message: TMessage);
  public
    { Public declarations }
  end;

var
  mainform: Tmainform;

implementation
uses common;
{$R *.dfm}

procedure tmainform.NewGridWnd(var Message: TMessage);
var IsNeg : Boolean;
begin
  if Message.Msg = WM_MOUSEWHEEL then
  begin
    IsNeg := Short(Message.WParamHi) < 0;
    if IsNeg then
      dbgrid1.DataSource.DataSet.MoveBy(1)
    else dbgrid1.DataSource.DataSet.MoveBy(-1);
  end
  else OldGridWnd(Message);
end;

procedure Tmainform.FormCreate(Sender: TObject);
begin
  if not app_init_2(self.ADOConnection1) then
  begin
    showmsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
//  showmessage(adoconnection1.ConnectionString) ;
  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

procedure Tmainform.FormShow(Sender: TObject);
begin
  dt2.Date:=getsystem_date(ADOQuery2,1);
  dt1.Date:=Get_Month_First_Day(dt2.Date);
  with adoquery2 do
  begin
    combobox1.Items.Clear;
    combobox1.Items.Add('All-所有工厂');
    combobox1.ItemIndex:=0;
    close;
    sql.text:='select warehouse_code,abbr_name from data0015 order by rkey';
    open;
    first;
    while not Eof do
    begin
      combobox1.Items.Add(fieldvalues['warehouse_code']+'-'+fieldvalues['abbr_name']);
      Next;
    end;
    close;
  end;
  Edit1.SetFocus;
end;

procedure Tmainform.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(adoquery1.SQL.Text);
end;

procedure Tmainform.DBGrid1TitleClick(Column: TColumn);
var i:integer;
begin
  if ADOQuery1.IsEmpty then
    exit;
  case column.Index of
    0:ADOQuery1.Sort:='cust_code';
    1:ADOQuery1.Sort:='ABBR_NAME';
    2:ADOQuery1.Sort:='zcs DESC';
    3:ADOQuery1.Sort:='xys DESC';
    4:ADOQuery1.Sort:='zcl DESC';
  end;
  for i:=0 to DBGrid1.Columns.Count-1 do
    DBGrid1.Columns[i].Title.Color:= clBtnFace;
  column.Title.Color:=clred;
end;

procedure Tmainform.ComboBox1Change(Sender: TObject);
begin
  bitbtn1.Click;
end;

procedure Tmainform.BitBtn1Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.Parameters.ParamByName('cust1').Value :='%'+trim(Edit1.Text)+'%';
  ADOQuery1.Parameters.ParamByName('fromdate1').Value:=dt1.DateTime;
  ADOQuery1.Parameters.ParamByName('todate1').Value:=dt2.DateTime;
  ADOQuery1.Parameters.ParamByName('cust2').Value :='%'+trim(Edit1.Text)+'%';
  ADOQuery1.Parameters.ParamByName('fromdate2').Value:=dt1.DateTime;
  ADOQuery1.Parameters.ParamByName('todate2').Value:=dt2.DateTime;
  if combobox1.Text='All-所有工厂' then
  begin
    ADOQuery1.Parameters.ParamByName('wh1').Value:='%%';
    ADOQuery1.Parameters.ParamByName('wh2').Value:='%%';
  end
  else begin
    ADOQuery1.Parameters.ParamByName('wh1').Value:='%'+copy(combobox1.Text,1,pos('-',combobox1.Text)-1)+'%';
    ADOQuery1.Parameters.ParamByName('wh2').Value:='%'+copy(combobox1.Text,1,pos('-',combobox1.Text)-1)+'%';
  end;
  ADOQuery1.Open;
  if ADOQuery1.IsEmpty then
     BitBtn2.Enabled:=false
  else BitBtn2.Enabled:=true;
end;

procedure Tmainform.BitBtn2Click(Sender: TObject);
begin
  Export_dbGrid_to_Excel(dbgrid1,'样板转量产率');
end;

procedure Tmainform.BitBtn3Click(Sender: TObject);
begin
  application.terminate;
end;

end.
