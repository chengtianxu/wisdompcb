unit invt_quan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls,ComObj, Excel2000, ClipBrd;

type
  TForm4 = class(TForm)
    ADO22: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADO22INV_PART_NUMBER: TStringField;
    ADO22INV_PART_DESCRIPTION: TStringField;
    ADO22GROUP_NAME: TStringField;
    ADO22quan_total: TFloatField;
    ADO22avl_price: TFloatField;
    ADO22amount: TFloatField;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ADO22UNIT_CODE: TStringField;
    ADO22ABBR_NAME: TStringField;
    ADO22inv_group_name: TStringField;
    ADO22inv_name: TStringField;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    ADO22notax_amount: TBCDField;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
uses main, invt_report;
{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm4.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado22.SQL.Text);
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
 try
  form_report:=tform_report.Create(application);
  if strtoint(form1.vprev.Caption)<=2 then       //х╗оч
   begin
    form_report.ppDBText4.Visible:=false;
    form_report.ppDBText5.Visible:=false;
   end;
  form_report.ppReport1.Print;
 finally
  form_report.free;
 end;
end;

procedure TForm4.Button2Click(Sender: TObject);
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

procedure TForm4.FormCreate(Sender: TObject);
begin
field_name:='INV_PART_NUMBER';
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
if (trim(edit1.Text)<>'') and (checkbox1.Checked) then
 Ado22.Filter := field_name+' like ''%'+Trim(Edit1.Text)+'%'''
else
 if (trim(edit1.Text)<>'') and (not checkbox1.Checked) then
  Ado22.Filter := field_name+' like ''%'+Trim(Edit1.Text)+'%'''+
                   'and quan_total >0'
 else
  if (trim(edit1.Text)='') and (not checkbox1.Checked) then
   Ado22.Filter :='quan_total >0'
  else
   ado22.Filter := '';
end;

procedure TForm4.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.ReadOnly) and
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label1.Caption := column.Title.Caption;
  edit1.SetFocus;
  ado22.Sort:=column.FieldName;
 end;
end;

end.
