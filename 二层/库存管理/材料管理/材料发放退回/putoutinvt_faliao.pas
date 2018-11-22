unit putoutinvt_faliao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm9 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    AD457: TADOQuery;
    DataSource1: TDataSource;
    AD457DSDesigner: TStringField;
    AD457DSDesigner2: TStringField;
    AD457DSDesigner3: TStringField;
    AD457DSDesigner4: TStringField;
    AD457DSDesigner5: TStringField;
    AD457DSDesigner6: TStringField;
    AD457DSDesigner7: TStringField;
    AD457DSDesigner9: TStringField;
    AD457DSDesigner10: TStringField;
    AD457DSDesigner11: TStringField;
    AD457DSDesigner12: TFloatField;
    AD457DSDesigner13: TStringField;
    AD457DSDesigner14: TDateTimeField;
    AD457DSDesigner15: TStringField;
    AD457DSDesigner16: TStringField;
    AD457DSDesigner17: TStringField;
    AD457DSDesigner18: TStringField;
    AD457DSDesigner19: TStringField;
    AD457DSDesigner8: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
       PreColumn: TColumn;
       field_name:string;
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses damo,common, main;

{$R *.dfm}

procedure TForm9.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    AD457.Filter:=field_name+' like ''%'+trim(edit1.text)+'%'''
  else
    AD457.Filter:=''
end;

procedure TForm9.FormShow(Sender: TObject);
begin
    AD457.Close;
    field_name:=DBGrid1.Columns[0].FieldName;
    PreColumn:=DBGrid1.Columns[0];
    AD457.Open;
end;

procedure TForm9.DBGrid2TitleClick(Column: TColumn);
begin
    AD457.Sort:=Column.FieldName;
  if (column.ReadOnly) and (field_name<>column.FieldName) then
  begin
    label1.Caption:=column.Title.Caption;
    self.field_name:=column.FieldName;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
    edit1.SetFocus;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
   dtpk2.Date := common.getsystem_date(dm.ADOQuery1,1);
   dtpk1.Date := dtpk2.Date;
end;

procedure TForm9.dtpk1Exit(Sender: TObject);
begin
  AD457.Close;
  AD457.Parameters[0].Value:=dtpk1.Date;
  AD457.Parameters[1].Value:=dtpk2.Date+1;
  AD457.Prepared:=true;
  AD457.Open;
end;



procedure TForm9.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
  showmessage(ad457.SQL.Text);
end;


procedure TForm9.Button2Click(Sender: TObject);
begin
  if not AD457.IsEmpty then
 if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_DBGrid_to_Excel(self.DBGrid2,self.Caption);
end;


end.
