unit part_out;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj, Excel2000,ClipBrd,
  Buttons;

type
  TForm3 = class(TForm)
    ado52: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ado52SALES_ORDER: TStringField;
    ado52delivery_no: TStringField;
    ado52PROD_CODE: TStringField;
    ado52CUST_CODE: TStringField;
    ado52WAREHOUSE_CODE: TStringField;
    ado52CODE: TStringField;
    ado52QUAN_SHP: TFloatField;
    ado52part_price: TFloatField;
    ado52amount: TFloatField;
    ado52SHIPMENT_NO: TSmallintField;
    ado52WORK_ORDER_NUMBER: TStringField;
    ado52EXCH_RATE: TFloatField;
    ado52DATE_ASSIGN: TDateTimeField;
    ado52date_shipped: TDateTimeField;
    Label3: TLabel;
    Edit3: TEdit;
    ado52out_weight: TFloatField;
    Label4: TLabel;
    Edit4: TEdit;
    ado52so_mianji: TFloatField;
    ado52PO_NUMBER: TStringField;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    ado52taxpart_price: TFloatField;
    ado52taxamount: TFloatField;
    ado52RMA_PTR: TIntegerField;
    ado52intype: TStringField;
    ado52ANALYSIS_CODE_2: TStringField;
    ado52abbr_name: TStringField;
    ado52product_name: TStringField;
    ado52MANU_PART_NUMBER: TStringField;
    ado52MANU_PART_DESC: TStringField;
    ado52CURR_CODE: TStringField;
    ado52REFERENCE_NUMBER: TStringField;
    ado52set_lngth: TBCDField;
    ado52set_width: TBCDField;
    ado52layers: TWordField;
    ado52LOCATION: TStringField;
    ado52fed_tax_id_no: TStringField;
    ado52EMPLOYEE_NAME: TStringField;
    ado52cust_decl: TStringField;
    ado52number: TStringField;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    ado52abbr_name23: TStringField;
    ado52total_sq: TFloatField;
    ado52total_cost: TFloatField;
    ado52sys_date: TDateTimeField;
    ado52PR_GRP_CODE: TStringField;
    ado52PRODUCT_GROUP_NAME: TStringField;
    ado52ORIG_CUSTOMER: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ado52CalcFields(DataSet: TDataSet);
    procedure Button5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses main, partin_report,common;
{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
 form1.Show;
 close;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form1.Show;
end;

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado52.SQL.Text);
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
try
 form_report:=tform_report.Create(application);
 if strtoint(vprev)<=2 then       //权限
  begin
   form_report.ppDBText26.Visible:=false;
   form_report.ppDBText11.Visible:=false;
   form_report.ppDBCalc4.Visible:=false;
  end;

 ado52.DisableControls;

 Form_report.ppReport1.Reset;
 Form_report.ppReport1.Template.FileName:=
    StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
          'exhale_custpart.rtm';
 Form_report.ppReport1.Template.LoadFromFile;
 Form_report.ppReport1.SaveAsTemplate:=False;

 form_report.ppReport3.Print;
 ado52.EnableControls;
finally
 form_report.free;
end;
end;

procedure TForm3.Button2Click(Sender: TObject);

 begin
 Export_dbGrid_to_Excel(dbgrid1,self.Caption);
  end;
  
procedure TForm3.ado52CalcFields(DataSet: TDataSet);
begin
 case self.Ado52rma_ptr.Value of
  0:self.Ado52intype.Value:='正常过数入仓';
  1:self.Ado52intype.Value:='退货重检入仓';
  2:self.Ado52intype.Value:='返修重检入仓';
  3:self.Ado52intype.Value:='直接入仓';
  4:self.Ado52intype.Value:='委外加工入仓';
  5:self.Ado52intype.Value:='委外加工退货入仓';
  6:self.Ado52intype.Value:='销售退货入仓';
  7:self.Ado52intype.Value:='转换入仓';
  8:self.Ado52intype.Value:='盘点入仓';
 end;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
 try
   Form_report:=TForm_report.Create(Application);
   Form_report.ppReport1.Reset;
   Form_report.ppReport1.Template.FileName:=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'exhale_custpart.rtm';
   Form_report.ppReport1.Template.LoadFromFile;
   Form_report.ppReport1.SaveAsTemplate:=True;
   Form_report.ppDesigner1.ShowModal;
 finally
   Form_report.Free;
 end;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
 form1.Show;
 close;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
 Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
try
 form_report:=tform_report.Create(application);
 if strtoint(vprev)<=2 then       //权限
  begin
   form_report.ppDBText26.Visible:=false;
   form_report.ppDBText11.Visible:=false;
   form_report.ppDBCalc4.Visible:=false;
  end;

 ado52.DisableControls;

 Form_report.ppReport3.Reset;
 Form_report.ppReport3.Template.FileName:=
    StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
          'exhale_custpart.rtm';
 Form_report.ppReport3.Template.LoadFromFile;
 Form_report.ppReport3.SaveAsTemplate:=False;

 form_report.ppReport3.Print;
 ado52.EnableControls;
finally
 form_report.free;
end;
end;

procedure TForm3.BitBtn5Click(Sender: TObject);
begin
 try
   Form_report:=TForm_report.Create(Application);
   Form_report.ppReport1.Reset;
   Form_report.ppReport1.Template.FileName:=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'exhale_custpart.rtm';
   Form_report.ppReport1.Template.LoadFromFile;
   Form_report.ppReport1.SaveAsTemplate := True;
   Form_report.ppDesigner1.ShowModal;
 finally
   Form_report.Free;
 end;
end;

end.
