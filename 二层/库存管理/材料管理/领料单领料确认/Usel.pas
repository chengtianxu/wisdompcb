unit Usel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls, DB, ComCtrls,
  ADODB;

type
  TForm_sel = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn7: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    DataSource1: TDataSource;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ADODataSet1: TADODataSet;
    ADODataSet1rkey: TAutoIncField;
    ADODataSet1number: TStringField;
    ADODataSet1DATE: TDateTimeField;
    ADODataSet1chinesename: TWideStringField;
    ADODataSet1employeecode: TWideStringField;
    ADODataSet1DEPT_NAME: TStringField;
    ADODataSet1EMPL_PTR: TIntegerField;
    ADODataSet1ConfMan: TWideStringField;
    ADODataSet1EMPLOYEE_NAME: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    sSql :string;
    FCondition:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_sel: TForm_sel;

implementation

uses demo, Uwhere,common;

{$R *.dfm}

procedure TForm_sel.BitBtn1Click(Sender: TObject);
begin
 Close;
 
end;

procedure TForm_sel.FormShow(Sender: TObject);
begin
  PreColumn := DBGridEh1.Columns[0];
  DateTimePicker1.Date:=date-7;
  DateTimePicker2.Date:=date;
  ADODataSet1.Close;
  sSql:=ADODataSet1.CommandText ;
  ADODataSet1.Parameters[0].Value:=FormatDateTime('YYYY/MM/DD',DateTimePicker1.Date);
  ADODataSet1.Parameters[1].Value:=FormatDateTime('YYYY/MM/DD',DateTimePicker2.Date);
  DateTimePicker1.Visible:=False;
  DateTimePicker2.Visible:=False;
  ADODataSet1.Open;
end;

procedure TForm_sel.BitBtn3Click(Sender: TObject);
begin
 ADODataSet1.Close;
 ADODataSet1.Open;
end;

procedure TForm_sel.BitBtn4Click(Sender: TObject);
var i:integer;
    Sqlstr:string;
 begin
   try
      Form_where:=TForm_where.Create(Application);
     if Form_where.ShowModal=mrok then
     begin
       ADODataSet1.Close;
       ADODataSet1.Parameters[0].Value:=FormatDateTime('YYYY/MM/DD',Form_where.DateTimePicker1.Date);
       ADODataSet1.Parameters[1].Value:=FormatDateTime('YYYY/MM/DD',Form_where.DateTimePicker2.Date);
       for i:=1 to Form_where.StringGrid1.RowCount-2 do
       if Form_where.StringGrid1.cells[2,i]<>'' then  Sqlstr :=Sqlstr+Form_where.StringGrid1.cells[2,i];
       ADODataSet1.CommandText:=sSql+sqlstr+' order by dbo.DATA0268.number';
       ADODataSet1.Open;


     end;
   finally
     Form_where.free;
     end

 end;
procedure TForm_sel.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADODataSet1.CommandText);
end;

procedure TForm_sel.DBGridEh1TitleClick(Column: TColumnEh);
begin
  // 在sho定义:PreColumn := DBGridEh1.Columns[0];
  // 在数据库集开启过滤
  if column.Title.SortMarker = smDownEh then
  begin
    column.Title.SortMarker := smUpEh;
    ADODataSet1.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    ADODataSet1.IndexFieldNames:=Column.FieldName+' DESC';
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
  else
    edit1.SetFocus;
end;

procedure TForm_sel.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure TForm_sel.BitBtn7Click(Sender: TObject);
begin
 if not ADODataSet1.IsEmpty then
 if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

end.
