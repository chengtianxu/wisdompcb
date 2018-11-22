unit TotalPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ADODB,
  ppEndUsr, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppBands, ppCache, ppCtrls, ppVar, ppPrnabl,Math,ComObj,Excel2000,
  ppModule, raCodMod, Menus;

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
    ADOQuery1StringField: TStringField;
    ADO530DSDesigner1: TBCDField;
    ADOQuery1FloatField4: TFloatField;
    DB64ppField14: TppField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    ADOQuery1ABBR_NAME: TStringField;
    ABBR_Name: TppField;
    DB64ppField15: TppField;
    Label2: TLabel;
    ComboBox2: TComboBox;
    orig_customer: TppField;
    ADOQuery1CurrencyField: TCurrencyField;
    ADO530DSDesigner6: TBCDField;
    DB64ppField18: TppField;
    ADOQuery1CUSTOMER_PTR: TIntegerField;
    ADOQuery1FLIGHT_NO: TStringField;
    ADOQuery1orig_customer: TStringField;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery2DSDesigner: TStringField;
    ADOQuery2DSDesigner2: TStringField;
    DB05: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppShape1: TppShape;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel42: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppDBImage1: TppDBImage;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine19: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel11: TppLabel;
    ppLabel24: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText13: TppDBText;
    ppLine11: TppLine;
    ppLabel21: TppLabel;
    ppDBText5: TppDBText;
    ppLabel22: TppLabel;
    ppDBText6: TppDBText;
    ppDBCalc3: TppDBCalc;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppDBText1: TppDBText;
    ppDBText7: TppDBText;
    ppDBText11: TppDBText;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLabel23: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppLine18: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ADOQuery2DSDesigner3: TStringField;
    ADOQuery2DSDesigner4: TStringField;
    DBPP1ppField3: TppField;
    DBPP1ppField4: TppField;
    ADOQuery1employee_name: TStringField;
    DB64ppField5: TppField;
    ADOQuery1empl_ptr: TIntegerField;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1cust_code: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure Button7Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure ppReport1BeforePrint(Sender: TObject);
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
   ADOQuery1.Prepared;
   ADOQuery1.Open;
   ADOQuery2.Close;
   ADOQuery2.Parameters.ParamByName('dtpk1').Value:=dtpk1.Date;
   ADOQuery2.Parameters.ParamByName('dtpk2').Value:=dtpk2.Date;
   ADOQuery2.Prepared;
   ADOQuery2.Open;
   if ComboBox2.ItemIndex=0 then
   begin
     ADOQuery1.Filter:='';
   end
   else
   begin
     ADOQuery1.Filter:='flight_no='+quotedstr(combobox2.Text);
   end;
   if ADOQuery1.IsEmpty then showmessage('对不起没有找到符合条件的发货单!')
   else
   begin
    if vprev='4' then
    begin
     button3.Enabled:=true;
     Button5.Enabled:=True;
     Button6.Enabled:=True;
     Button7.Enabled:=True;
     //Button8.Enabled:=True;
    end
    else
    begin
     Button3.Enabled:=True;
    end;
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
 PopupMenu1.Popup(Mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm_TotalPrint.ADOQuery1CalcFields(DataSet: TDataSet);
var
  i:Extended;
begin
 ADO530.Close;
 ADO530.Parameters[0].Value:=ADOQuery1.Parameters[0].Value;
 ADO530.Parameters[1].Value:=ADOQuery1.Parameters[1].Value;
 ADO530.Parameters[2].Value:=ADOQuery1MANU_PART_DESC.Value;
 ADO530.Parameters[3].Value:=ADOQuery1layers.Value;
 ADO530.Parameters[4].Value:=ADOQuery1ANALYSIS_CODE_5.Value;
 ADO530.Parameters[5].Value:=adoquery1CUSTOMER_PTR.Value;
 ADO530.Parameters[6].Value:=ADOQuery1FLIGHT_NO.Value;
 ADO530.Parameters[7].Value:=ADOQuery1orig_customer.Value;
 ADO530.Parameters[8].Value:=ADOQuery1empl_ptr.Value;
 ADO530.Open;
 ADOQuery1FloatField.Value:=ADO530DSDesigner.Value;
 ADOQuery1FloatField2.Value:=ADO530DSDesigner3.Value;
 ADOQuery1FloatField3.Value:=RoundTo(ADO530DSDesigner5.Value,-2);
 ADOQuery1IntegerField.Value:=ADO530DSDesigner4.Value;
 ADOQuery1IntegerField2.Value:=ADO530DSDesigner2.Value;
 ADOQuery1CurrencyField.Value:=ADO530DSDesigner6.Value;
 ADOQuery1StringField.Value:='印刷电路板/空白'+inttostr(ADOQuery1layers.Value)+'层';
 ADOQuery1FloatField4.Value:=RoundTo(ADOQuery1FloatField3.Value/ADOQuery1IntegerField.Value,-4);
 ADOQuery1IntegerField3.Value:=Abs(ADOQuery1.RecNo);
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
   ADOQuery1FloatField3.Value:=RoundTo(ADOQuery1FloatField3.Value*i/ADOQuery1exch_rate.Value,-2);
   ADOQuery1FloatField4.Value:=RoundTo(ADOQuery1FloatField4.Value*i/ADOQuery1exch_rate.Value,-4);
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

procedure TForm_TotalPrint.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then showmessage(ADOQuery1.SQL.Text);
end;

procedure TForm_TotalPrint.N1Click(Sender: TObject);
begin
  ppReport1.Reset;
  ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'Contract529_Sz.rtm';
  ppReport1.Template.LoadFromFile;
  ppReport1.Print;
end;

procedure TForm_TotalPrint.N2Click(Sender: TObject);
begin
  ppReport1.Reset;
  ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'Contract529.rtm';
  ppReport1.Template.LoadFromFile;
  ppReport1.Print;
end;

procedure TForm_TotalPrint.Button3Click(Sender: TObject);
begin
PopupMenu2.Popup(Mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm_TotalPrint.N3Click(Sender: TObject);
begin
  ppReport1.Reset;
  ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'TotalPack529.rtm';
  ppReport1.Template.LoadFromFile;
  ppReport1BeforePrint(Sender);
  ppReport1.Print;
end;

procedure TForm_TotalPrint.N4Click(Sender: TObject);
begin
  ppReport1.Reset;
  ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'TotalPack529_In.rtm';
  ppReport1.Template.LoadFromFile;
  ppReport1.Print;
end;

procedure TForm_TotalPrint.ppReport1BeforePrint(Sender: TObject);
begin
 ppLabel4.Caption:=DateToStr(dtpk1.Date);
 if ComboBox1.ItemIndex=0 then
 ppLabel24.Caption:='美元' 
 else
 ppLabel24.Caption:=ComboBox1.Text;
end;

end.
