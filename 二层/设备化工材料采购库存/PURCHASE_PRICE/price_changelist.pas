unit price_changelist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, Grids, DBGrids, ComCtrls, StdCtrls,
  ComObj, Excel2000,ClipBrd;

type
  TForm4 = class(TForm)
    ADO328: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    ADO328GROUP_NAME: TStringField;
    ADO328GROUP_DESC: TStringField;
    ADO328INV_PART_NUMBER: TStringField;
    ADO328INV_PART_DESCRIPTION: TStringField;
    ADO328CODE: TStringField;
    ADO328old_price: TFloatField;
    ADO328new_price: TFloatField;
    ADO328sys_longdate: TDateTimeField;
    ADO328reason: TStringField;
    ADO328EMPLOYEE_NAME: TStringField;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses damo;

{$R *.dfm}

procedure TForm4.Button2Click(Sender: TObject);
 var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TStringList;
   ExcelApp: Variant;
 begin
    if self.ADO328.IsEmpty then exit;
    Screen.Cursor := crHourglass;
    DBGrid1.DataSource.DataSet.DisableControls;
    bm := DBGrid1.DataSource.DataSet.GetBookmark;
    DBGrid1.DataSource.DataSet.First;

    // create the Excel object
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := '物料供应信息';

    // First we send the data to a memo
    // works faster than doing it directly to Excel
    mem := TStringList.Create;
    sline := '';

    // add the info for the column names
    for col := 0 to DBGrid1.FieldCount-1 do
      sline := sline + DBGrid1.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

    // get the data into the memo
    for row := 0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to DBGrid1.FieldCount-1 do
        sline := sline + DBGrid1.Fields[col].AsString + #9;
      mem.Add(sline);
      DBGrid1.DataSource.DataSet.Next;
    end;

    // we copy the data to the clipboard
    clipboard.Clear;
    Clipboard.AsText:=mem.Text;

    // if needed, send it to Excel
    // if not, we already have it in the clipboard
    ExcelApp.Workbooks[1].WorkSheets['物料供应信息'].Paste;
    ExcelApp.Visible := true;
    mem.Free;
    clipboard.Clear;
  //  FreeAndNil(ExcelApp);
    DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;

procedure TForm4.dtpk1Exit(Sender: TObject);
begin
self.ADO328.Close;
self.ADO328.Parameters[0].Value:=dtpk1.Date;
self.ADO328.Parameters[1].Value:=dtpk2.Date+1;
self.ADO328.Open;
end;

procedure TForm4.FormActivate(Sender: TObject);
begin
self.field_name := 'INV_PART_NUMBER';
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
  self.ADO328.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
else
 self.ADO328.Filter:='';
end;

procedure TForm4.DBGrid1TitleClick(Column: TColumn);
begin
if (column.ReadOnly) and
   (column.FieldName<>self.field_name) then
 begin
  with ado328 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add(column.FieldName);
    open;
   end;
  if column.FieldName<>'sys_longdate' then
   begin
    self.field_name:=column.FieldName;
    label1.Caption:=column.Title.Caption;
    edit1.Text:='';
    edit1.SetFocus;
   end;
 end;
end;

end.
