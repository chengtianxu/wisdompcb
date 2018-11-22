unit receputstock_total;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, Grids, DBGrids,ComObj, Excel2000,
  Menus,OleServer,ActiveX;

type
  TForm8 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    ADOTable1INV_PART_NUMBER: TStringField;
    ADOTable1UNIT_NAME: TStringField;
    ADOTable1GROUP_NAME: TStringField;
    ADOTable1STD_COST: TFloatField;
    ADOTable1received: TFloatField;
    ADOTable1received_money: TFloatField;
    ADOTable1extend: TFloatField;
    ADOTable1extend_money: TFloatField;
    ADOTable1begstock: TFloatField;
    ADOTable1begstock_money: TCurrencyField;
    ADOTable1rkey: TIntegerField;
    ADOTable1stock: TFloatField;
    ADOTable1amount: TFloatField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ADOTable1inv_group_name: TStringField;
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
    ADOTable1ABBR_NAME: TStringField;
    ADOTable1INV_DESCRIPTION: TStringField;
    ADOTable1INV_name: TStringField;
    ADOTable1STOCK_SELL: TFloatField;
    ADOTable1STOCK_BASE: TFloatField;
    ADOTable1totol_hight: TFloatField;
    ADOTable1totol_mianji: TFloatField;
    ADOTable1quan_returen: TFloatField;
    ADOTable1amount_returen: TFloatField;
    ADOTable1quan_scrap: TFloatField;
    ADOTable1amount_csrap: TFloatField;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure ADOTable1CalcFields(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure money_total;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ADOTable1AfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
   procedure CopyDbDataToExcel(Args: array of const);
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
 adotable1stock.Value+adotable1extend.Value+
 ADOTable1quan_returen.Value+ADOTable1quan_scrap.Value
 -adotable1received.Value;

if aDOTable1begstock.Value=0 then
 adotable1begstock.AsVariant:=null;

adotable1begstock_money.Value:=
 adotable1amount.Value+adotable1extend_money.Value+
 ADOTable1amount_returen.Value+ADOTable1amount_csrap.Value
 -adotable1received_money.Value;

if abs(adotable1begstock_money.Value)<0.001 then
 adotable1begstock_money.AsVariant:=null;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
 self.CopyDbDataToExcel([DBGrid1]);
end;

procedure TForm8.N1Click(Sender: TObject);
var
 str:string;
begin
 str:='';
 if inputquery('材料类别过滤','请输入要过滤的类别名:            ',str) then
  if trim(str)<>'' then
   adotable1.Filter := 'stock <> null and GROUP_NAME like '''+trim(str)+'%'''
  else
   adotable1.Filter := 'stock <> null';

   self.money_total;
end;

procedure TForm8.N2Click(Sender: TObject);
var
 str:string;
begin
 str:='';
 if inputquery('材料名称过滤','请输入要过滤的材料名称:            ',str) then
  if trim(str)<>'' then
   adotable1.Filter := 'stock <> null and inv_part_number like '''+trim(str)+'%'''
  else
   adotable1.Filter := 'stock <> null';
  self.money_total;
end;

procedure TForm8.N3Click(Sender: TObject);
var
 str:string;
begin
 str:='';
 if inputquery('材料组别过滤','请输入要过滤的组别:            ',str) then
  if trim(str)<>'' then
   adotable1.Filter := 'stock <> null and inv_group_NAME like '''+trim(str)+'%'''
  else
   adotable1.Filter := 'stock <> null';

  self.money_total;
end;

procedure TForm8.money_total;
var
 beg_money,rec_money,ext_money,stock_money,returen_money,scrap_money:double;
begin
 beg_money:=0;
 rec_money:=0;
 ext_money:=0;
 stock_money:=0;
 returen_money:=0;
 scrap_money:=0;
 adotable1.DisableControls;
   form8.ADOTable1.First;
   while not form8.ADOTable1.Eof do
    begin
     beg_money:=beg_money+form8.ADOTable1begstock_money.Value;
     rec_money:=rec_money+form8.ADOTable1received_money.Value;
     ext_money:=ext_money+form8.ADOTable1extend_money.Value;
     stock_money:=stock_money+form8.ADOTable1amount.Value;
     returen_money:=returen_money+ADOTable1amount_returen.Value;
     scrap_money:=scrap_money+self.ADOTable1amount_csrap.Value;
     form8.ADOTable1.Next;
    end;
   Edit1.Text:=formatfloat('0.000',beg_money);
   Edit2.Text:=formatfloat('0.000',rec_money);
   Edit3.Text:=formatfloat('0.000',ext_money);
   Edit4.Text:=formatfloat('0.000',stock_money);
   edit5.Text:=formatfloat('0.000',returen_money);
   edit6.Text:=formatfloat('0.000',scrap_money);
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

procedure TForm8.ADOTable1AfterOpen(DataSet: TDataSet);
begin
 adotable1.Filter := 'stock <> null';
end;

procedure Tform8.CopyDbDataToExcel(Args:array of const);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
begin
 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
 begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
 end;
 try
   XLApp := CreateOleObject('Excel.Application');
 except
   Screen.Cursor := crDefault;
   Exit;
 end;
 XLApp.WorkBooks.Add;
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrid(Args[I].VObject).DataSource.DataSet.first;
   v_cloumn:=0;
   for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
    if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);
   jCount := 1;
   while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
      if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrid(Args[I].VObject).DataSource.DataSet.Next;
   end;
   XlApp.Visible := True;
   TDBGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;


end.
