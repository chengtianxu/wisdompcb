unit outsql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj, Excel2000,ClipBrd;

type
  TForm3 = class(TForm)
    ado207: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ado207GON_NUMBER: TStringField;
    ado207INV_PART_NUMBER: TStringField;
    ado207GROUP_NAME: TStringField;
    ado207DEPT_NAME: TStringField;
    ado207TDATE: TDateTimeField;
    ado207QUANTITY: TBCDField;
    ado207RTN_QUANTITY: TFloatField;
    ado207STANDARD_COST: TFloatField;
    ado207BARCODE_ID: TStringField;
    ado207inv_group_name: TStringField;
    ado207total_price: TFloatField;
    ado207REF_NUMBER: TStringField;
    ado207PRICE: TFloatField;
    ado207CURR_CODE: TStringField;
    ado207ABBR_NAME: TStringField;
    Label3: TLabel;
    Edit3: TEdit;
    ado207inv_name: TStringField;
    ado207INV_DESCRIPTION: TStringField;
    ado207UNIT_NAME: TStringField;
    ado207EMPLOYEE_NAME: TStringField;
    ado207recd_employee: TStringField;
    ado207DSDesigner: TBCDField;
    ado207DSDesigner2: TBCDField;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button3Click(Sender: TObject);
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
  Form3: TForm3;

implementation
uses main, invt_report;
{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado207.SQL.Text);
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  form1.Show;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
 try
  form_report:=tform_report.Create(application);
  ado207.DisableControls;       //切断与DBgrid控件的联系加快显示速度
  form_report.ppReport3.Print;
  ado207.EnableControls;
 finally
  form_report.free;
 end;
end;

procedure TForm3.Button2Click(Sender: TObject);
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
    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    mem.Free;
    clipboard.Clear;
  //  FreeAndNil(ExcelApp);
    DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;

procedure TForm3.FormCreate(Sender: TObject);
begin
field_name:='INV_PART_NUMBER';
end;

procedure TForm3.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
 Ado207.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'''
else
 ado207.Filter := '';
end;

procedure TForm3.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.FieldName<>'QUANTITY') and
    (column.FieldName<>'price') and
    (column.FieldName<>'standard_cost') and
    (column.FieldName<>'total_price') and
    (column.FieldName<>'TDATE') and
    (column.FieldName<>'RTN_QUANTITY') and
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label3.Caption := column.Title.Caption;
  edit3.SetFocus;
  with ado207 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('order by '+column.FieldName);
    open;
   end;
 end;
end;

end.
