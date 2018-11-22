unit price_changelist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, Grids, DBGrids, ComCtrls, StdCtrls,
  ComObj, Excel2000,ClipBrd;

type
  TForm4 = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    ADS_AVG328: TADODataSet;
    DataSource2: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    ADS_AVG328GROUP_NAME: TStringField;
    ADS_AVG328GROUP_DESC: TStringField;
    ADS_AVG328old_price: TFloatField;
    ADS_AVG328new_price: TFloatField;
    ADS_AVG328avg_changeprice: TFloatField;
    ADS_AVG328change_rate: TFloatField;
    ado328: TADODataSet;
    ado328GROUP_NAME: TStringField;
    ado328GROUP_DESC: TStringField;
    ado328INV_PART_NUMBER: TStringField;
    ado328INV_PART_DESCRIPTION: TStringField;
    ado328CODE: TStringField;
    ado328old_price: TFloatField;
    ado328abbr_name: TStringField;
    ado328new_price: TFloatField;
    ado328sys_longdate: TDateTimeField;
    ado328reason: TStringField;
    ado328EMPLOYEE_NAME: TStringField;
    ado328change_price: TFloatField;
    ado328change_rate: TFloatField;
    ado328CURR_CODE: TStringField;
    Label4: TLabel;
    ado328unit_code: TStringField;
    procedure Button2Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
    field_name,field_avgname:string;
   procedure ExPortExcel(Args:array of const;pCap:array of string);
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses damo;

{$R *.dfm}


procedure TForm4.ExPortExcel(Args:array of const;pCap:array of string);
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

 XLApp.SheetsInNewWorkbook := High(Args) + 1;
 XLApp.WorkBooks.Add;
 
 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := pCap[i];
   Sheet := XLApp.Workbooks[1].WorkSheets[i+1];
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

procedure TForm4.Button2Click(Sender: TObject);

 begin
    self.ExPortExcel([dbgrid1,dbgrid2],[tabsheet1.Caption,tabsheet2.Caption]);
  end;

procedure TForm4.dtpk1Exit(Sender: TObject);
begin
self.ADO328.Close;
self.ADO328.Parameters[0].Value:=dtpk1.Date;
self.ADO328.Parameters[1].Value:=dtpk2.Date+1;
self.ADO328.Open;

self.ads_avg328.Close;
self.ads_avg328.Parameters[0].Value:=dtpk1.Date;
self.ads_avg328.Parameters[1].Value:=dtpk2.Date+1;
self.ads_avg328.Open;
end;

procedure TForm4.FormActivate(Sender: TObject);
begin
 field_name := 'INV_PART_NUMBER';
 field_avgname:='GROUP_NAME';
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
if pagecontrol1.ActivePageIndex=0 then
 if trim(edit1.Text)<>'' then
  self.ADO328.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  self.ADO328.Filter:=''
else
 if trim(edit1.Text)<>'' then
  self.ads_avg328.Filter:=self.field_avgname+' like ''%'+trim(edit1.Text)+'%'''
 else
  self.ads_avg328.Filter:=''
end;

procedure TForm4.DBGrid1TitleClick(Column: TColumn);
begin
IF ADO328.IndexFieldNames<>COLUMN.FieldName THEN
 ADO328.IndexFieldNames:=COLUMN.FieldName;

if (column.ReadOnly) and (column.FieldName<>self.field_name) then
 begin
  self.field_name:=column.FieldName;
  label1.Caption:=column.Title.Caption;
  edit1.Text:='';
  edit1.SetFocus;
 end;
end;

procedure TForm4.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado328.CommandText);
end;

procedure TForm4.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ADS_AVG328.CommandText);
end;

procedure TForm4.DBGrid2TitleClick(Column: TColumn);
begin
IF ads_avg328.IndexFieldNames<>COLUMN.FieldName THEN
 ads_avg328.IndexFieldNames:=COLUMN.FieldName;

if (column.ReadOnly) and (column.FieldName<>self.field_name) then
 begin
  self.field_avgname:=column.FieldName;
  label4.Caption:=column.Title.Caption;
  edit1.Text:='';
  edit1.SetFocus;
 end;
end;

procedure TForm4.PageControl1Change(Sender: TObject);
begin
if pagecontrol1.ActivePageIndex=0 then
 begin
  label4.Visible:=false;
  label1.Visible:=true;
 end
else
 begin
  label4.Visible:=true;
  label1.Visible:=false;
 end;
end;

end.
