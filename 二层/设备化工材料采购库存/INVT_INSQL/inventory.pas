unit inventory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB,ComObj, Excel2000,ClipBrd,
  Menus, Buttons;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ado0022: TADOQuery;
    ado0022INV_PART_NUMBER: TStringField;
    ado0022GROUP_NAME: TStringField;
    ado0022WAREHOUSE_CODE: TStringField;
    ado0022GRN_NUMBER: TStringField;
    ado0022code23: TStringField;
    ado0022QUANTITY: TFloatField;
    ado0022QUAN_ON_HAND: TFloatField;
    ado0022QUAN_IN_INSP: TFloatField;
    ado0022CURR_CODE: TStringField;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ado0022PO_NUMBER: TStringField;
    ado0022inv_group_name: TStringField;
    Edit3: TEdit;
    Label3: TLabel;
    ado0022INV_NAME: TStringField;
    ado0022INV_DESCRIPTION: TStringField;
    ado0022UNIT_NAME: TStringField;
    ado0022PO_REV_NO: TStringField;
    ado0022EMPLOYEE_NAME: TStringField;
    ado0022LOCATION: TStringField;
    ado0022TAX_2: TBCDField;
    ado0022ship_DATE: TDateTimeField;
    ado0022DELIVER_NUMBER: TStringField;
    ado0022BARCODE_ID: TStringField;
    BitBtn5: TBitBtn;
    PopupMenu2: TPopupMenu;
    ado0022DSDesigner: TBCDField;
    ado0022DSDesigner2: TBCDField;
    ado0022DSDesigner3: TBCDField;
    ado0022DSDesigner4: TBCDField;
    ado0022DSDesigner5: TBCDField;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
   field_name:string;
   procedure item_click(sender:TObject); 
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses  main, invt_report;
{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
 form1.show;
 close;
end;

procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado0022.SQL.Text);
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
 try
  form_report := tform_report.Create(application);
  ado0022.DisableControls;       //切断与DBgrid控件的联系加快显示速度
  form_report.ppReport2.Print;
  ado0022.EnableControls;
 finally
  form_report.free;
 end;
end;

procedure TForm2.Button2Click(Sender: TObject);
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
     if dbgrid1.Columns[col].Visible then
      sline := sline + DBGrid1.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

    // get the data into the memo
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
  //  FreeAndNil(ExcelApp);
    DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;

procedure TForm2.FormCreate(Sender: TObject);
begin
field_name:='INV_PART_NUMBER';
end;

procedure TForm2.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
 Ado0022.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'''
else
 ado0022.Filter := '';
end;

procedure TForm2.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.ReadOnly) and (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label3.Caption := column.Title.Caption;
  edit3.SetFocus;

  self.ado0022.Sort:= column.FieldName;

 end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm2.item_click(sender:TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to DBGrid1.FieldCount-1 do
  if DBGrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to DBGrid1.FieldCount-1 do
  if DBGrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm2.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
 for i:=1 to DBGrid1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := DBGrid1.Columns[i-1].Title.Caption ;
    if DBGrid1.Columns[i-1].Visible then
      item.Checked := true ;
    item.OnClick := item_click ;
    self.PopupMenu2.Items.Add(item) ;
  end;
end;

end.
