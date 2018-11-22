unit rec_total;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj,Excel2000, ClipBrd;

type
  TForm6 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    adotota22: TADOQuery;
    adotota22INV_PART_NUMBER: TStringField;
    adotota22UNIT_NAME: TStringField;
    adotota22GROUP_DESC: TStringField;
    adotota22ABBR_NAME: TStringField;
    adotota22total_received: TFloatField;
    adotota22cost: TFloatField;
    adotota22inv_group_name: TStringField;
    Label3: TLabel;
    Edit3: TEdit;
    adotota22INV_NAME: TStringField;
    adotota22INV_DESCRIPTION: TStringField;
    adotota22STOCK_BASE: TFloatField;
    adotota22STOCK_SELL: TFloatField;
    adotota22total_weight: TFloatField;
    adotota22total_area: TFloatField;
    adotota22std_price: TBCDField;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
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
  Form6: TForm6;

implementation

uses main;

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm6.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm6.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adotota22.SQL.Text);
end;

procedure TForm6.Button2Click(Sender: TObject);
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
     if dbgrid1.Columns[col].Visible then
      sline := sline + DBGrid1.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

   // get the data info the memo
    for row := 0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to DBGrid1.FieldCount-1 do
       if dbgrid1.Columns[col].Visible then
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

procedure TForm6.FormCreate(Sender: TObject);
begin
field_name:='INV_PART_NUMBER';
end;

procedure TForm6.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
 Adotota22.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'''
else
 adotota22.Filter := '';
end;

procedure TForm6.DBGrid1TitleClick(Column: TColumn);
begin
 if (not column.ReadOnly) and
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label3.Caption := column.Title.Caption;
  edit3.SetFocus;
  with adotota22 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('order by '+column.FieldName);
    open;
   end;
 end;
end;

end.
