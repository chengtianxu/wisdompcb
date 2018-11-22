unit Main7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, ADODB, Menus,
  Mask, DBCtrls, ComCtrls,DateUtils;

type
  TFrmMain7 = class(TForm)
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    ADOData0455: TADOQuery;
    DataSource1: TDataSource;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    Edit1: TEdit;
    MainMenu1: TMainMenu;
    IQC1: TMenuItem;
    IQC2: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label5: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Edit2: TEdit;
    ADOData0455RKEY: TAutoIncField;
    ADOData0455DEPT_PTR: TIntegerField;
    ADOData0455INVENT_PTR: TIntegerField;
    ADOData0455CONF_DIF_QTY: TFloatField;
    ADOData0455CONF_DATE: TDateTimeField;
    ADOData0455CONF_BY: TIntegerField;
    ADOData0455dept_code: TStringField;
    ADOData0455dept_name: TStringField;
    ADOData0455inv_part_number: TStringField;
    ADOData0455inv_part_description: TStringField;
    ADOData0455unit_code: TStringField;
    ADOData0455employee_name: TStringField;
    BitBtn7: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IQC2Click(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure DateTimePicker2CloseUp(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain7: TFrmMain7;

implementation

uses Mainmenu, Report4;
{$R *.dfm}

procedure TFrmMain7.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMain7.FormShow(Sender: TObject);
begin
  Datetimepicker1.Date :=now-dayof(now)-dayof(now-dayof(now));
  Datetimepicker2.Date :=now;
  with Adodata0455 do
  begin
    close;
    sql.clear;
    sql.add('select data0455.*,data0034.dept_code,data0034.dept_name,data0017.inv_part_number,');
    sql.add('data0017.inv_part_description,data0002.unit_code,data0005.employee_name');
    sql.add('from data0455,data0017,data0034,data0002,data0005');
    sql.add('where data0455.invent_ptr=data0017.rkey');
    sql.add('and data0455.dept_ptr=data0034.rkey');
    sql.add('and data0017.stock_unit_ptr=data0002.rkey');
    sql.add('and data0455.conf_by=data0005.rkey');
    sql.add('and data0455.conf_date>='''+Datetostr(datetimepicker1.date)+'''');
    sql.add('and data0455.conf_date<'''+Datetostr(datetimepicker2.date+1)+'''');
    sql.add('order by data0034.dept_code,data0017.inv_part_number,data0455.conf_date');
    prepared;
    open;
  end;
end;

procedure TFrmMain7.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then dbgrid1.SetFocus ;
end;

procedure TFrmMain7.Edit1Exit(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
    Adodata0455.Filter:='dept_code like '''+trim(edit1.text)+'%'''
  else
    Adodata0455.Filter:='';
end;

procedure TFrmMain7.FormCreate(Sender: TObject);
begin
  if Adodata0455.active=false then
    Adodata0455.Open ;
end;

procedure TFrmMain7.IQC2Click(Sender: TObject);
begin
  FrmReport4:= TFrmReport4.Create(Application);
  FrmReport4.QuickRep1.Preview ;
  FrmReport4.Free ;
end;

procedure TFrmMain7.DateTimePicker1Exit(Sender: TObject);
begin
  Datetimepicker2.setfocus;
end;

procedure TFrmMain7.DateTimePicker2Exit(Sender: TObject);
begin
  with Adodata0455 do
  begin
    close;
    sql.clear;
    sql.add('select data0455.*,data0034.dept_code,data0034.dept_name,data0017.inv_part_number,');
    sql.add('data0017.inv_part_description,data0002.unit_code,data0005.employee_name');
    sql.add('from data0455,data0017,data0034,data0002,data0005');
    sql.add('where data0455.invent_ptr=data0017.rkey');
    sql.add('and data0455.dept_ptr=data0034.rkey');
    sql.add('and data0017.stock_unit_ptr=data0002.rkey');
    sql.add('and data0455.conf_by=data0005.rkey');
    sql.add('and data0455.conf_date>='''+Datetostr(datetimepicker1.date)+'''');
    sql.add('and data0455.conf_date<'''+Datetostr(datetimepicker2.date+1)+'''');
    sql.add('order by data0034.dept_code,data0017.inv_part_number,data0455.conf_date');
    prepared;
    open;
  end;
end;

procedure TFrmMain7.DateTimePicker2CloseUp(Sender: TObject);
begin
  DateTimePicker2Exit(Sender);
end;

procedure TFrmMain7.DateTimePicker1CloseUp(Sender: TObject);
begin
  Datetimepicker2.setfocus;
end;

procedure TFrmMain7.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
    if trim(edit2.Text)<>'' then
      Adodata0455.Filter:='dept_code like '''+trim(edit1.text)+'%'' and inv_part_number like '''+trim(edit2.text)+'%'''
    else
      Adodata0455.Filter:='dept_code like '''+trim(edit1.text)+'%'''
  else
    if trim(edit2.Text)<>'' then
      Adodata0455.Filter:='inv_part_number like '''+trim(edit2.text)+'%'''
    else
      Adodata0455.Filter:='';
end;

end.
