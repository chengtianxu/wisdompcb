unit TotalPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ADODB,
  ppEndUsr, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppBands, ppCache, ppCtrls, ppVar, ppPrnabl,Math,ComObj,Excel2000,
  ppModule, raCodMod;

type
  TForm_TotalPrint = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    Button1: TButton;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Panel2: TPanel;
    Button2: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    DB493: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    Aq493: TADOQuery;
    Aq493Company_Name: TStringField;
    Aq493Company_Name2: TStringField;
    Aq493Company_Name3: TStringField;
    Aq493ship_address: TStringField;
    Aq493Company_Icon: TBlobField;
    Aq493SITE_INFO_ADD_1: TStringField;
    Aq493SITE_INFO_ADD_2: TStringField;
    Aq493SITE_INFO_ADD_3: TStringField;
    Aq493SITE_INFO_PHONE: TStringField;
    DataSource3: TDataSource;
    DB64: TppDBPipeline;
    Button5: TButton;
    Button6: TButton;
    ADOQuery1: TADOQuery;
    ADOQuery1layers: TWordField;
    DataSource1: TDataSource;
    ADOQuery1ANALYSIS_CODE_5: TStringField;
    ADOQuery1FloatField: TFloatField;
    ADOQuery1FloatField2: TFloatField;
    ADOQuery1FloatField3: TFloatField;
    ADOQuery1IntegerField: TIntegerField;
    ADOQuery1IntegerField2: TIntegerField;
    ADOQuery1IntegerField3: TIntegerField;
    Button7: TButton;
    ADOQuery1part_price: TFloatField;
    ADO530: TADOQuery;
    ADO530DSDesigner: TBCDField;
    ADO530DSDesigner2: TIntegerField;
    ADO530DSDesigner3: TBCDField;
    ADO530DSDesigner4: TIntegerField;
    ADO530DSDesigner5: TFloatField;
    ComboBox1: TComboBox;
    ADOQuery1curr_code: TStringField;
    ADOQuery1exch_rate: TFloatField;
    Label1: TLabel;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery1IntegerField4: TIntegerField;
    ppTitleBand1: TppTitleBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBImage1: TppDBImage;
    ppLabel1: TppLabel;
    ppDBText10: TppDBText;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel2: TppLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure Button7Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_TotalPrint: TForm_TotalPrint;

implementation

uses Demo,common;

{$R *.dfm}

procedure TForm_TotalPrint.Button1Click(Sender: TObject);
begin
   ADOQuery1.Close;
   ADOQuery1.Parameters.ParamByName('dtpk1').Value:=dtpk1.Date;
   ADOQuery1.Parameters.ParamByName('dtpk2').Value:=dtpk2.Date;
   ADOQuery1.Parameters.ParamByName('v1').Value:=0;
   ADOQuery1.Parameters.ParamByName('v2').Value:=1;
   ADOQuery1.Parameters.ParamByName('v3').Value:=3;
   ADOQuery1.Prepared;
   ADOQuery1.Open;
   if ADOQuery1.IsEmpty then showmessage('对不起没有找到符合条件的发货单!')
   else
   begin
    button3.Enabled:=true;
    Button5.Enabled:=True;
    Button6.Enabled:=True;
    Button7.Enabled:=True;
   end;
end;


procedure TForm_TotalPrint.Button2Click(Sender: TObject);
begin
 ADOQuery1.Close;
 Close;
end;

procedure TForm_TotalPrint.DBGrid1DblClick(Sender: TObject);
begin
  if not ADOQuery1.IsEmpty then ADOQuery1.Delete;
  if ADOQuery1.IsEmpty then
  begin
   button3.Enabled:=false;
   Button5.Enabled:=False;
   Button7.Enabled:=False;
   Button6.Enabled:=False;
  end;
end;

procedure TForm_TotalPrint.Button3Click(Sender: TObject);
begin
  ppReport1.Reset;
  ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'TotalPack529.rtm';
  ppReport1.Template.LoadFromFile;
  ppReport1.Print;
end;

procedure TForm_TotalPrint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ADOQuery1.Active=true then ADOQuery1.CancelBatch();
end;



procedure TForm_TotalPrint.Button5Click(Sender: TObject);
begin
  ppReport1.Reset;
  ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'TotalInvoice529.rtm';
  ppReport1.Template.LoadFromFile;
  ppReport1.Print;
end;

procedure TForm_TotalPrint.Button6Click(Sender: TObject);
begin
  ppReport1.Reset;
  ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'Contract529.rtm';
  ppReport1.Template.LoadFromFile;
  ppReport1.Print;
end;

procedure TForm_TotalPrint.ADOQuery1CalcFields(DataSet: TDataSet);
var
  i:Extended;
begin
 ADO530.Close;
 ADO530.Parameters[0].Value:=ADOQuery1.Parameters[0].Value;
 ADO530.Parameters[1].Value:=ADOQuery1.Parameters[1].Value;
 ADO530.Parameters[2].Value:=ADOQuery1.Parameters[2].Value;
 ADO530.Parameters[3].Value:=ADOQuery1.Parameters[3].Value;
 ADO530.Parameters[4].Value:=ADOQuery1.Parameters[4].Value;
 ADO530.Parameters[5].Value:=ADOQuery1MANU_PART_DESC.Value;
 ADO530.Parameters[6].Value:=ADOQuery1part_price.Value;
 ADO530.Parameters[7].Value:=ADOQuery1layers.Value;
 ADO530.Parameters[8].Value:=ADOQuery1ANALYSIS_CODE_5.Value;
 ADO530.Open;
 ADOQuery1FloatField.Value:=ADO530DSDesigner.Value;
 ADOQuery1FloatField2.Value:=ADO530DSDesigner3.Value;
 ADOQuery1FloatField3.Value:=ADO530DSDesigner5.Value;
 ADOQuery1IntegerField.Value:=ADO530DSDesigner4.Value;
 ADOQuery1IntegerField2.Value:=ADO530DSDesigner2.Value;
 if ADOQuery1.Bof=True then
  ADOQuery1IntegerField3.Value:=1
 else
  ADOQuery1IntegerField3.Value:=ADOQuery1.RecNo;
 if Self.ComboBox1.ItemIndex=0 then
 begin
  with dm.ADOQuery1 do
  begin
   Close;
   sql.Clear;
   sql.Add('select * from data0001 where CURR_CODE='+'''USD''');
   Open;
   i:=dm.ADOQuery1.FieldValues['exch_rate'];
   ADOQuery1curr_code.Value:='USD';
   ADOQuery1part_price.Value:=RoundTo(ADOQuery1PART_PRICE.Value*i/ADOQuery1exch_rate.Value,-4);
   ADOQuery1FloatField3.Value:=RoundTo(ADOQuery1FloatField3.Value*i/ADOQuery1exch_rate.Value,-2);
  end;
 end;
 if (ADOQuery1IntegerField3.Value>0) and (ADOQuery1IntegerField3.Value<=20) then //每20行分组
 begin
   ADOQuery1IntegerField4.Value:=1;
 end;
 if (ADOQuery1IntegerField3.Value>20) and (ADOQuery1IntegerField3.Value<=40) then
 begin
   ADOQuery1IntegerField4.Value:=2;
 end;
 if (ADOQuery1IntegerField3.Value>40) and (ADOQuery1IntegerField3.Value<=60) then
 begin
   ADOQuery1IntegerField4.Value:=3;
 end;
 if (ADOQuery1IntegerField3.Value>60) and (ADOQuery1IntegerField3.Value<=80) then
 begin
   ADOQuery1IntegerField4.Value:=4;
 end;
  if (ADOQuery1IntegerField3.Value>80) and (ADOQuery1IntegerField3.Value<=100) then
 begin
   ADOQuery1IntegerField4.Value:=5;
 end;
  if (ADOQuery1IntegerField3.Value>100) and (ADOQuery1IntegerField3.Value<=120) then
 begin
   ADOQuery1IntegerField4.Value:=6;
 end;
end;

procedure TForm_TotalPrint.Button7Click(Sender: TObject);
begin
 Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm_TotalPrint.ComboBox1Click(Sender: TObject);
begin
 case ComboBox1.ItemIndex of
  0:
  begin
   ADOQuery1.Parameters.ParamByName('str1').Value:='';
   ADOQuery1.Parameters.ParamByName('str2').Value:='';
   ADOQuery1.Parameters.ParamByName('str3').Value:='';
   ADOQuery1.Parameters.ParamByName('str4').Value:='';
  end;
  1:
  begin
   ADOQuery1.Parameters.ParamByName('str1').Value:='HKD';
   ADOQuery1.Parameters.ParamByName('str2').Value:='EUR';
   ADOQuery1.Parameters.ParamByName('str3').Value:='JPY';
   ADOQuery1.Parameters.ParamByName('str4').Value:='RMB';
  end;
  2:
  begin
   ADOQuery1.Parameters.ParamByName('str1').Value:='USD';
   ADOQuery1.Parameters.ParamByName('str2').Value:='EUR';
   ADOQuery1.Parameters.ParamByName('str3').Value:='JPY';
   ADOQuery1.Parameters.ParamByName('str4').Value:='RMB';
  end;
  3:
  begin
   ADOQuery1.Parameters.ParamByName('str1').Value:='HKD';
   ADOQuery1.Parameters.ParamByName('str2').Value:='USD';
   ADOQuery1.Parameters.ParamByName('str3').Value:='JPY';
   ADOQuery1.Parameters.ParamByName('str4').Value:='RMB';
  end;
  4:
  begin
   ADOQuery1.Parameters.ParamByName('str1').Value:='HKD';
   ADOQuery1.Parameters.ParamByName('str2').Value:='EUR';
   ADOQuery1.Parameters.ParamByName('str3').Value:='USD';
   ADOQuery1.Parameters.ParamByName('str4').Value:='RMB';
  end;
  5:
  begin
   ADOQuery1.Parameters.ParamByName('str1').Value:='HKD';
   ADOQuery1.Parameters.ParamByName('str2').Value:='EUR';
   ADOQuery1.Parameters.ParamByName('str3').Value:='JPY';
   ADOQuery1.Parameters.ParamByName('str4').Value:='USD';
  end;
 end;
end;

procedure TForm_TotalPrint.FormShow(Sender: TObject);
begin
 Self.ComboBox1.ItemIndex:=0;
 Self.ComboBox1Click(Sender);
end;

end.
