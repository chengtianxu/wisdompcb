unit part_in;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls,ComObj, Excel2000,ClipBrd,
  Menus;

type
  TForm2 = class(TForm)
    ADO53: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADO53WORK_ORDER_NUMBER: TStringField;
    ADO53CUST_CODE: TStringField;
    ADO53WAREHOUSE_CODE: TStringField;
    ADO53LOCATION: TStringField;
    ADO53QUANTITY: TFloatField;
    ADO53QTY_ON_HAND: TFloatField;
    ADO53MFG_DATE: TDateTimeField;
    ADO53REFERENCE_NUMBER: TStringField;
    Panel1: TPanel;
    ADO53LATEST_PRICE: TFloatField;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    ADO53PROD_CODE: TStringField;
    Label3: TLabel;
    Edit3: TEdit;
    ADO53number: TStringField;
    ADO53type: TWordField;
    ADO53c_type: TStringField;
    ADO53so_mianqi: TFloatField;
    ADO53SO_NO: TStringField;
    ADO53inweight: TFloatField;
    ADO53rma_ptr: TIntegerField;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    ADO53TAXLATEST_PRICE: TFloatField;
    ADO53zhuanchang: TStringField;
    ADO53ANALYSIS_CODE_2: TStringField;
    ADO53MANU_PART_NUMBER: TStringField;
    ADO53MANU_PART_DESC: TStringField;
    ADO53so_REFERENCE_NUMBER: TStringField;
    ADO53PRODUCT_NAME: TStringField;
    PopupMenu1: TPopupMenu;
    Button4: TButton;
    ADO53LATEST_ORIG_PRICE: TFloatField;
    ADO53TAXLATEST_ORIG_PRICE: TFloatField;
    ADO53employee_name: TStringField;
    ADO53CUST_CODE2: TStringField;
    ADO53layers: TWordField;
    Button5: TButton;
    ADO53PO_NUMBER: TStringField;
    ADO53curr_code: TStringField;
    ADO53abbr_name23: TStringField;
    ADO53total_sq: TFloatField;
    ADO53exch_rate: TFloatField;
    ADO53SAMPLE_NR: TStringField;
    ADO53total_cost: TFloatField;
    ADO53spec_place: TStringField;
    intgrfldADO53ischaban: TIntegerField;
    strngfldADO53zhouqi: TStringField;
    ADO53PR_GRP_CODE: TStringField;
    ADO53PRODUCT_GROUP_NAME: TStringField;
    ADO53ORIG_CUSTOMER: TStringField;
    ADO53SCH_DATE: TDateTimeField;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ADO53CalcFields(DataSet: TDataSet);
    procedure Button4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses main, partin_report,common;
{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado53.SQL.Text);
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
try
 form_report:=tform_report.Create(application);
 if strtoint(vprev)<=2 then       //权限
  form_report.ppDBText19.Visible:=false;
 ado53.DisableControls;

 Form_report.ppReport2.Reset;
 Form_report.ppReport2.Template.FileName:=
    StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
          'received_custpart.rtm';
 Form_report.ppReport2.Template.LoadFromFile;
 Form_report.ppReport2.SaveAsTemplate:=False;

 form_report.ppReport2.Print;
 ado53.EnableControls;
finally
 form_report.free;
end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
 Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm2.ADO53CalcFields(DataSet: TDataSet);
begin
 case self.Ado53rma_ptr.Value of
  0:self.Ado53C_type.Value:='正常过数入仓';
  1:self.Ado53C_type.Value:='退货重检入仓';
  2:self.Ado53C_type.Value:='返修重检入仓';
  3:self.Ado53C_type.Value:='直接入仓';
  4:self.Ado53C_type.Value:='委外加工入仓';
  5:self.Ado53C_type.Value:='委外加工退货入仓';
  6:self.Ado53C_type.Value:='销售退货入仓';
  7:self.Ado53C_type.Value:='转换入仓';
  8:self.Ado53C_type.Value:='特殊入仓'; 
 end;
end;


procedure TForm2.Button4Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i:byte;
 item:TMenuItem;
begin
  for i:=1 to dbgrid1.FieldCount do
  begin
   item:=TmenuItem.Create(self);
   item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
   if dbgrid1.Columns[i-1].Visible then
    item.Checked:=true;
   item.OnClick:=item_click;
   self.PopupMenu1.Items.Add(item);
  end;
end;

procedure TForm2.item_click(sender:TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;
procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
  if (strtoint(vprev) <= 2)  then
//    (pos('价格',(sender as TPopupmenu).Items.Items[14].)>0)  then
   begin
   (sender as TPopupmenu).Items[17].Enabled:=false;
   (sender as TPopupmenu).Items[18].Enabled:=false;
   (sender as TPopupmenu).Items[19].Enabled:=false;
   (sender as TPopupmenu).Items[20].Enabled:=false;   
   (sender as TPopupmenu).Items[21].Enabled:=false;
   (sender as TPopupmenu).Items[23].Enabled:=false;
   end;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
 try
   Form_report:=TForm_report.Create(Application);
   Form_report.ppReport1.Reset;
   Form_report.ppReport1.Template.FileName:=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'received_custpart.rtm';
   Form_report.ppReport1.Template.LoadFromFile;
   Form_report.ppReport1.SaveAsTemplate:=True;
   Form_report.ppDesigner1.ShowModal;
 finally
   Form_report.Free;
 end;
end;

end.
