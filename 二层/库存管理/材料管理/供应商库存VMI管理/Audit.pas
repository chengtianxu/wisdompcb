unit Audit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Menus, ComCtrls,
  DB, ADODB;

type
  TForm_Audit = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    DBGrid3: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADO149: TADOQuery;
    ADO149quantity: TBCDField;
    ADO149rtn_quantity: TBCDField;
    ADO149tax_price: TBCDField;
    ADO149tax_2: TBCDField;
    ADO149d0134_ptr: TIntegerField;
    ADO149inv_part_number: TStringField;
    ADO149inv_name: TStringField;
    ADO149quan_on_hand: TBCDField;
    ADS148: TADODataSet;
    ADS148rkey: TIntegerField;
    ADS148gon_number: TStringField;
    ADS148ttype: TSmallintField;
    ADS148status: TWordField;
    ADS148stype: TStringField;
    ADS148sstatus: TStringField;
    ADS148create_date: TDateTimeField;
    ADS148ref_number: TStringField;
    ADS148warehouse_code: TStringField;
    ADS148warehouse_name: TStringField;
    ADS148employee_name: TStringField;
    ADS148employee_name_1: TStringField;
    ADS148code: TStringField;
    ADS148supplier_name: TStringField;
    BitBtn2: TBitBtn;
    ADOQuery1: TADOQuery;
    ADOQuery1quan_on_hand: TBCDField;
    ADOQuery1quantity: TBCDField;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    ADO149rkey: TAutoIncField;
    N6: TMenuItem;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dtpk1CloseUp(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
  end;

var
  Form_Audit: TForm_Audit;

implementation

uses demo, Main, OutEdit, out_report;

{$R *.dfm}

procedure TForm_Audit.FormCreate(Sender: TObject);
begin
 with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    active:=true;
    form_main.sys_longdate := fieldvalues['v_dt']; //长格式
    form_main.sys_sortdate:=strtodate(datetostr(form_main.sys_longdate));
   end;
  dtpk2.Date := form_main.sys_sortdate;
  dtpk1.Date := dtpk2.Date - 5;
  field_name:='GON_NUMBER';
  self.ADS148.Close;
  self.ADS148.Parameters[0].Value := dtpk1.Date;
  self.ADS148.Parameters[1].Value := dtpk2.Date+1;
  self.ADS148.Open;
  self.ADO149.Open;
end;


procedure TForm_Audit.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TForm_Audit.dtpk1CloseUp(Sender: TObject);
begin
 self.ADS148.Close;
 self.ADS148.Parameters[0].Value := dtpk1.Date;
 self.ADS148.Parameters[1].Value := dtpk2.Date+1;
 self.ADS148.Open;
end;


procedure TForm_Audit.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
  self.ADS148.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  self.ADS148.Filter:='';
end;

procedure TForm_Audit.BitBtn3Click(Sender: TObject);
begin
self.ADS148.Close;
self.ADS148.Open;
end;

procedure TForm_Audit.N6Click(Sender: TObject);
begin
self.ADOQuery1.Close;
self.ADOQuery1.Parameters[0].Value:=self.ADO149rkey.Value;
self.ADOQuery1.Open;
Form_OutEdit:=TForm_OutEdit.Create(nil);
try
Form_OutEdit.Edit1.Text:=self.ADO149quantity.AsString;
Form_OutEdit.Edit2.Text:=self.ADO149rtn_quantity.AsString;
Form_OutEdit.Edit3.Text:=self.ADO149tax_price.AsString;
Form_OutEdit.Edit4.Text:=self.ADOQuery1quantity.AsString;
Form_OutEdit.Edit5.Text:=self.ADOQuery1quan_on_hand.AsString;
if self.ADS148ttype.Value=0 then
begin
Form_OutEdit.Edit1.Enabled:=false;
Form_OutEdit.Edit1.Color:=clInfoBk;
end
else
begin
Form_OutEdit.Edit2.Enabled:=false;
Form_OutEdit.Edit2.Color:=clInfoBk;
end;
Form_OutEdit.ShowModal;
finally
Form_OutEdit.Free;
end;
end;

procedure TForm_Audit.PopupMenu1Popup(Sender: TObject);
begin
if self.ADO149.IsEmpty then
begin
n6.enabled:=false;
n5.Enabled:=false;//审核
end
else
begin
//n2.Enabled:=(self.ADS148status.Value=0);
n5.Enabled:=(self.ADS148status.Value=0) and (self.ADS148ttype.Value=0);
n6.Enabled:=true;
end;
end;

procedure TForm_Audit.N5Click(Sender: TObject);
begin
if Application.MessageBox('确认此材料出库?', PChar('提示'),MB_YESNO)=6 then
begin
self.ADS148.Edit;
self.ADS148status.Value:=1;
self.ADS148.Post;
self.ADS148.Close;
self.ADS148.Open;
end
else
exit;
end;

procedure TForm_Audit.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if self.ADS148status.value=0 then
  DBGrid1.Canvas.Font.Color := clRed
 else
  if self.ADS148status.value=1 then
   DBGrid1.Canvas.Font.Color := cllime;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_Audit.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin

if (self.ADS148.IndexFieldNames<>column.FieldName) and
   (column.FieldName<>'sstatus') then
   self.ADS148.IndexFieldNames:=column.FieldName;

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

procedure TForm_Audit.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(self.ADS148.CommandText);
end;

procedure TForm_Audit.BitBtn2Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_Audit.PopupMenu2Popup(Sender: TObject);
begin
if self.ADO149.IsEmpty then
begin
n1.Enabled:=false;//审核
end
else
begin
n1.Enabled:=(self.ADS148status.Value=0);
end;
end;

procedure TForm_Audit.N1Click(Sender: TObject);
begin
 try
  form_outreport:=tform_outreport.Create(application);
  form_outreport.ADO149.Close;
  form_outreport.ADO149.Parameters[0].Value:=self.ADS148rkey.Value;
  form_outreport.ADO149.Open;
  form_outreport.ADO493.Close;
  form_outreport.ADO493.Open;
  form_outreport.ppReport1.Print;
 finally
  form_outreport.free;
 end;
end;

procedure TForm_Audit.Button2Click(Sender: TObject);
begin
form_outreport:=tform_outreport.Create(application);
form_outreport.ppReport1.Reset;
form_outreport.ppReport1.Template.FileName:=stringReplace(uppercase(getcurrentdir),'EXEC','NIERP\Report\',[rfReplaceAll])+'wzpr133.rtm';
form_outreport.ppReport1.Template.LoadFromFile;
form_outreport.ppReport1.SaveAsTemplate:=true;
form_outreport.ppDesigner1.ShowModal;
form_outreport.Free;
end;

end.
