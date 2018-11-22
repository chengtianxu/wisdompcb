unit uRq_Detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, DB, ADODB,ComObj,
  Excel2000,ClipBrd;

type
  Tfrm_Rqdetail = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    ComboBox1: TComboBox;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1PO_REQ_NUMBER: TStringField;
    ADOQuery1DEPARTMENT_NAME: TStringField;
    ADOQuery1uSflag: TStringField;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1INV_NAME: TStringField;
    ADOQuery1INV_DESCRIPTION: TStringField;
    ADOQuery1stye_status: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1CURR_NAME: TStringField;
    ADOQuery1UNIT_NAME: TStringField;
    ADOQuery1abbr_warehouse: TStringField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1QUANTITY: TFloatField;
    ADOQuery1UNIT_PRICE: TFloatField;
    ADOQuery1req_quantity: TBCDField;
    ADOQuery1REQ_DATE: TDateTimeField;
    ADOQuery1reason: TStringField;
    ADOQuery1extra_req: TStringField;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    ADOQuery1DEPT_NAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure dtpk1Exit(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure checkvar();
    procedure CheckBox7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
   field_name:string;
   FsSQL:string ;
  public
    { Public declarations }
  end;

var
  frm_Rqdetail: Tfrm_Rqdetail;

implementation

uses damo,common;

{$R *.dfm}

procedure Tfrm_Rqdetail.FormCreate(Sender: TObject);
begin
  ComboBox1.ItemIndex :=0;
  dtpk1.Date:=common.getsystem_date(dm.ADOQuery1,1)-5;
  dtpk2.Date:=common.getsystem_date(dm.ADOQuery1,1);
  self.ADOQuery1.Close;
  self.ADOQuery1.Parameters[0].Value:=3;
  self.ADOQuery1.Parameters[1].Value:=2;
  self.ADOQuery1.Parameters[7].Value:=dtpk1.Date;
  self.ADOQuery1.Parameters[8].Value:=dtpk2.Date+1;
  self.ADOQuery1.Prepared:=true;
  self.ADOQuery1.Open;
  field_name:='PO_REQ_NUMBER';
  Self.ADOQuery1.Sort:=field_name;
  if (strtoint(vprev) < 3) then
   begin
    dbgrid1.Columns[7].Visible:=false;
    dbgrid1.Columns[8].Visible:=false;
   end;
  FsSQL:=Self.ADOQuery1.SQL.Text;
end;

procedure Tfrm_Rqdetail.Edit1Change(Sender: TObject);
begin
 if trim(edit1.Text)<>'' then
  adoquery1.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  adoquery1.Filter:='';
end;

procedure Tfrm_Rqdetail.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;  
 end
else
 edit1.SetFocus;
end;

procedure Tfrm_Rqdetail.dtpk1Exit(Sender: TObject);
begin
self.ADOQuery1.Close;
self.ADOQuery1.Parameters[7].Value:=dtpk1.Date;
self.ADOQuery1.Parameters[8].Value:=dtpk2.Date+1;
self.ADOQuery1.Prepared:=true;
self.ADOQuery1.Open;
end;

procedure Tfrm_Rqdetail.CopyDbDataToExcel(Args:array of const);
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

procedure Tfrm_Rqdetail.Button2Click(Sender: TObject);
begin
CopyDbDataToExcel([dbgrid1]);
end;

procedure Tfrm_Rqdetail.ComboBox1Change(Sender: TObject);
begin
  Self.ADOQuery1.Close;
  if ComboBox1.ItemIndex=0 then
     Self.ADOQuery1.SQL.Text:=FsSQL
  else
  if ComboBox1.ItemIndex=1 then
     Self.ADOQuery1.SQL.Text:=FsSQL+' and Union_Db.flag='+quotedstr('S')
  else
     Self.ADOQuery1.SQL.Text:=FsSQL+' and Union_Db.flag='+quotedstr('M');
     Self.ADOQuery1.Open;
end;

procedure Tfrm_Rqdetail.checkvar;
begin
  ADOQuery1.Close;
  if  checkbox1.Checked then
   ADOQuery1.Parameters[0].Value:=1
  else
   ADOQuery1.Parameters[0].Value:=0;

  if  checkbox2.Checked then
   ADOQuery1.Parameters[1].Value:=2
  else
   ADOQuery1.Parameters[1].Value:=0;

  if  checkbox3.Checked then
   ADOQuery1.Parameters[2].Value:=3
  else
   ADOQuery1.Parameters[2].Value:=0;

  if  checkbox4.Checked then
   ADOQuery1.Parameters[3].Value:=4
  else
   ADOQuery1.Parameters[3].Value:=0;

  if   checkbox5.Checked then
   ADOQuery1.Parameters[4].Value:=5
  else
   ADOQuery1.Parameters[4].Value:=0;

  if  checkbox6.Checked then
   ADOQuery1.Parameters[5].Value:=6
  else
   ADOQuery1.Parameters[5].Value:=0;

  if   checkbox7.Checked then
   ADOQuery1.Parameters[6].Value:=7
  else
   ADOQuery1.Parameters[6].Value:=0;

   ADOQuery1.Prepared;
   ADOQuery1.open;
end;

procedure Tfrm_Rqdetail.CheckBox7Click(Sender: TObject);
begin
  checkvar;
end;

procedure Tfrm_Rqdetail.Button1Click(Sender: TObject);
begin
 Close;
end;

procedure Tfrm_Rqdetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 ModalResult:=mrOk;
end;

procedure Tfrm_Rqdetail.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
 showmessage(ADOQuery1.SQL.Text);
end;

end.
