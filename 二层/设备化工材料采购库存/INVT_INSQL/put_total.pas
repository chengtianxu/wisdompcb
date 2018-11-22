unit put_total;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj, Excel2000, ClipBrd;

type
  TForm7 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    adotota207: TADOQuery;
    adotota207INV_PART_NUMBER: TStringField;
    adotota207UNIT_NAME: TStringField;
    adotota207GROUP_DESC: TStringField;
    adotota207ABBR_NAME: TStringField;
    adotota207put_total: TFloatField;
    adotota207base_price: TFloatField;
    adotota207put_price: TFloatField;
    adotota207inv_group_name: TStringField;
    Label3: TLabel;
    Edit3: TEdit;
    adotota207INV_NAME: TStringField;
    adotota207INV_DESCRIPTION: TStringField;
    adotota207STOCK_BASE: TFloatField;
    adotota207STOCK_SELL: TFloatField;
    adotota207total_weigth: TFloatField;
    adotota207total_area: TFloatField;
    adotota207DEPT_NAME: TStringField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
   field_name:string;     
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses main;

{$R *.dfm}

procedure TForm7.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm7.Button2Click(Sender: TObject);
 var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TStringList;
   ExcelApp: Variant;
 begin
    Screen.Cursor := crHourglass;
    DBGrid1.DataSource.DataSet.DisableControls;
    bm := DBGrid1.DataSource.DataSet.GetBookmark;
    DBGrid1.DataSource.DataSet.First;

   // create the Excel object
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;
   // ExcelApp.workbooks[1].worksheets[1].Columns.ColumnWidth :=19;
   // First we send the data to a memo 可以设置宽度
   // works faster than doing it directly to Excel
    mem := TStringList.Create;

    sline := '';

   // add the info for the column names
    for col := 0 to DBGrid1.FieldCount-1 do
      sline := sline + DBGrid1.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

   // get the data info the memo
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
    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    mem.Free;
    clipboard.Clear;
   //FreeAndNil(ExcelApp);
    DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;

procedure TForm7.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adotota207.SQL.Text);
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
field_name:='INV_PART_NUMBER';
end;

procedure TForm7.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
 Adotota207.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'''
else
 adotota207.Filter := '';
end;

procedure TForm7.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.FieldName<>'put_total') and
    (column.FieldName<>'base_price') and
    (column.FieldName<>'put_price') and
    (column.FieldName<>'STOCK_BASE') and
    (column.FieldName<>'total_weigth') and
    (column.FieldName<>'STOCK_SELL') and
    (column.FieldName<>'total_area') and
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label3.Caption := column.Title.Caption;
  edit3.SetFocus;
  with adotota207 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('order by '+column.FieldName);
    open;
   end;
 end;
end;

end.
