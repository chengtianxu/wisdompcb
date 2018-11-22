unit receputstock_total;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, Grids, DBGrids,ComObj,Excel2000,ClipBrd,
  Menus, Buttons;

type
  TForm8 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ADOTable1CUSTOMER_PART_NUMBER: TStringField;
    ADOTable1CUSTOMER_PART_DESC: TStringField;
    ADOTable1ABBR_NAME: TStringField;
    ADOTable1PROD_CODE: TStringField;
    ADOTable1PARAMETER_VALUE: TFloatField;
    ADOTable1rece_total: TFloatField;
    ADOTable1mianqi: TFloatField;
    ADOTable1ext_total: TFloatField;
    ADOTable1ext_mianqi: TFloatField;
    ADOTable1quantity_hand: TFloatField;
    ADOTable1stock_mianqi: TFloatField;
    ADOTable1begstock: TFloatField;
    ADOTable1begstock_mianqi: TFloatField;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    ADOTable1t_quantity: TIntegerField;
    ADOTable1t_mianqi: TFloatField;
    procedure Button1Click(Sender: TObject);
    procedure ADOTable1CalcFields(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure money_total;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses main;

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
begin
close;
end;

procedure TForm8.ADOTable1CalcFields(DataSet: TDataSet);
begin
ADOTable1begstock.Value:=
 adotable1quantity_hand.Value+adotable1ext_total.Value-adotable1rece_total.Value+
 self.ADOTable1t_quantity.Value;

if aDOTable1begstock.Value=0 then
 adotable1begstock.AsVariant:=null;

adotable1begstock_mianqi.Value:=
 adotable1stock_mianqi.Value+adotable1ext_mianqi.Value-adotable1mianqi.Value+
 ADOTable1t_mianqi.Value;;

if abs(adotable1begstock_mianqi.Value)<0.001 then
 adotable1begstock_mianqi.AsVariant:=null;

end;

procedure TForm8.Button2Click(Sender: TObject);
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


procedure TForm8.N1Click(Sender: TObject);
var
 str:string;
begin
 str:='';
 if inputquery('产品类型过滤','请输入要过滤的类型名:            ',str) then
  if trim(str)<>'' then
   adotable1.Filter := 'prod_code like '''+trim(str)+'%'''
  else
   adotable1.Filter := '';
   self.money_total;
end;

procedure TForm8.N2Click(Sender: TObject);
var
 str:string;
begin
 str:='';
 if inputquery('产品代码过滤','请输入要过滤的产品代码:            ',str) then
  if trim(str)<>'' then
   adotable1.Filter := 'customer_part_number like '''+trim(str)+'%'''
  else
   adotable1.Filter := '';
  self.money_total;
end;

procedure TForm8.N3Click(Sender: TObject);
var
 str:string;
begin
 str:='';
 if inputquery('产品客户过滤','请输入要过滤的客户:            ',str) then
  if trim(str)<>'' then
   adotable1.Filter := 'abbr_NAME like '''+trim(str)+'%'''
  else
   adotable1.Filter := '';

  self.money_total;
end;

procedure TForm8.money_total;
var
 beg_money,rec_money,ext_money,stock_money:double;
begin
 beg_money:=0;
 rec_money:=0;
 ext_money:=0;
 stock_money:=0;
 adotable1.DisableControls;
   form8.ADOTable1.First;
   while not form8.ADOTable1.Eof do
    begin
     beg_money:=beg_money+form8.ADOTable1begstock_mianqi.Value;
     rec_money:=rec_money+form8.ADOTable1mianqi.Value;
     ext_money:=ext_money+form8.ADOTable1ext_mianqi.Value;
     stock_money:=stock_money+form8.ADOTable1stock_mianqi.Value;
     form8.ADOTable1.Next;
    end;
   form8.Edit1.Text:=formatfloat('0.0000',beg_money);
   form8.Edit2.Text:=formatfloat('0.0000',rec_money);
   form8.Edit3.Text:=formatfloat('0.0000',ext_money);
   form8.Edit4.Text:=formatfloat('0.0000',stock_money);
   form8.ADOTable1.First;
 adotable1.EnableControls;
end;

procedure TForm8.DBGrid1TitleClick(Column: TColumn);
begin
try
 adotable1.IndexFieldNames :=column.FieldName;
except
 showmessage('对不起不能按该字段排充序!');
end;
end;

procedure TForm8.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TForm8.BitBtn4Click(Sender: TObject);
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

end.
