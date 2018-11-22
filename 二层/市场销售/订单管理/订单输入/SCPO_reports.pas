unit SCPO_reports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB, ppProd, ppClass, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppCtrls, ppBands, ppPrnabl, ppCache,
  ExtCtrls, ppStrtch, ppMemo, ppEndUsr, ComCtrls, Buttons, ppVar, ppModule,
  raCodMod;

type
  TfrmSCPOrpt = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ppReport1: TppReport;
    ppDB493: TppDBPipeline;
    DataSource2: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Panel2: TPanel;
    Button2: TButton;
    Button3: TButton;
    ppDesigner1: TppDesigner;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1DSDesigner2: TStringField;
    ADOQuery1DSDesigner3: TStringField;
    ADOQuery1DSDesigner4: TDateTimeField;
    ADOQuery1DSDesigner5: TFloatField;
    ADOQuery1DSDesigner6: TStringField;
    ADOQuery1DSDesigner7: TFloatField;
    ADOQuery1DSDesigner8: TFloatField;
    ADOQuery1DSDesigner9: TFloatField;
    ADOQuery1DSDesigner10: TStringField;
    ADOQuery1DSDesigner11: TFloatField;
    ADOQuery1DSDesigner12: TStringField;
    ADOQuery1DSDesigner13: TStringField;
    ADOQuery1DSDesigner14: TStringField;
    ADOQuery1DSDesigner15: TStringField;
    ADOQuery1DSDesigner16: TDateTimeField;
    ADOQuery1DSDesigner17: TStringField;
    ADOQuery1DSDesigner18: TStringField;
    ADOQuery1DSDesigner19: TStringField;
    ADOQuery1DSDesigner20: TStringField;
    ADOQuery1DSDesigner21: TStringField;
    ADOQuery1DSDesigner22: TStringField;
    ADOQuery1DSDesigner23: TFloatField;
    ADOQuery1rohs: TStringField;
    ADOQuery1DSDesigner24: TDateTimeField;
    ADOQuery1DSDesigner25: TStringField;
    ADOQuery1DSDesigner26: TIntegerField;
    Label4: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label3: TLabel;
    lblttype: TLabel;
    lblso_tp: TLabel;
    rdgttype: TRadioGroup;
    rdgso_tp: TRadioGroup;
    ADOQuery1DSDesigner27: TFloatField;
    Label5: TLabel;
    Edit11: TEdit;
    BitBtn10: TBitBtn;
    Label85: TLabel;
    ADOQuery1DSDesigner28: TStringField;
    ADOQuery1DSDesigner29: TStringField;
    Label6: TLabel;
    Edit3: TEdit;
    ADOQuery1DSDesigner30: TFloatField;
    ADOQuery1DSDesigner31: TStringField;
    ADOQuery1DSDesigner32: TStringField;
    ADOQuery1DSDesigner33: TStringField;
    ADOQuery1DSDesigner34: TStringField;
    ADOQuery1DSDesigner35: TStringField;
    ADOQuery1DSDesigner36: TStringField;
    ADOQuery1DSDesigner37: TStringField;
    ADOQuery1DSDesigner38: TStringField;
    ppDB60: TppDBPipeline;
    ADOQuery1DSDesigner39: TLargeintField;
    ADOQuery1DSDesigner40: TStringField;
    ppTitleBand1: TppTitleBand;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppDBImage1: TppDBImage;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppLabel13: TppLabel;
    ppDBText7: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppDBText8: TppDBText;
    ppLabel16: TppLabel;
    ppDBText11: TppDBText;
    ppLabel17: TppLabel;
    ppDBText13: TppDBText;
    ppLabel18: TppLabel;
    ppDBText15: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDBText17: TppDBText;
    ppLabel21: TppLabel;
    ppDBText18: TppDBText;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDBText19: TppDBText;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel6: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine40: TppLine;
    ppLabel33: TppLabel;
    ppLine5: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel11: TppLabel;
    ppLabel7: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppDBText6: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppLine12: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine23: TppLine;
    ppLine41: TppLine;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppLine16: TppLine;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppMemo1: TppMemo;
    ppLabel2: TppLabel;
    ppLabel8: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppShape2: TppShape;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel5: TppLabel;
    ppLabel24: TppLabel;
    ppDBText20: TppDBText;
    ADOQuery1DSDesigner41: TStringField;
    Button4: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn10Click(Sender: TObject);
    procedure Edit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSCPOrpt: TfrmSCPOrpt;

implementation

uses common,damo, waif_supp;

{$R *.dfm}

procedure TfrmSCPOrpt.Button2Click(Sender: TObject);
begin
close;
end;

procedure TfrmSCPOrpt.Button1Click(Sender: TObject);
begin
//if trim(edit1.Text)='' then
// begin
//  edit1.SetFocus;
//  showmessage('请输入订单起始编号');
// end
//else
// if trim(edit2.Text)='' then
//  begin
//   edit2.SetFocus;
//   showmessage('请输入订单结束编号');
//  end
// else
//  begin
   adoquery1.Close;
   adoquery1.Parameters[0].Value:=rdgso_tp.ItemIndex;
   adoquery1.Parameters[1].Value:=rdgso_tp.ItemIndex;
   adoquery1.Parameters[2].Value:=rdgttype.ItemIndex;
   adoquery1.Parameters[3].Value:=rdgttype.ItemIndex;
   adoquery1.Parameters[4].Value:=Trim(Edit1.Text);
   adoquery1.Parameters[5].Value:=Trim(Edit1.Text);
   adoquery1.Parameters[6].Value:=Trim(Edit2.Text);
   adoquery1.Parameters[7].Value:=Trim(Edit2.Text);
   adoquery1.Parameters.ParamByName('dtpk1').Value:=dtpk1.Date;
   adoquery1.Parameters.ParamByName('dtpk2').Value:=dtpk2.Date+1;
   adoquery1.Parameters[10].Value:=Edit11.Text;
   adoquery1.Parameters[11].Value:=Edit11.Text;
   adoquery1.Parameters[12].Value:=Edit3.Text;
   adoquery1.Parameters[13].Value:=Edit3.Text;
   adoquery1.Prepared;
   adoquery1.Open;
   if adoquery1.IsEmpty then showmessage('对不起没有找到符合条件的订单')
   else  button3.Enabled:=true;
//  end;
end;

procedure TfrmSCPOrpt.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit2.SetFocus;
end;

procedure TfrmSCPOrpt.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then button1.SetFocus;
end;

procedure TfrmSCPOrpt.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then adoquery1.Delete;
if adoquery1.IsEmpty then button3.Enabled:=false;
end;

procedure TfrmSCPOrpt.Button3Click(Sender: TObject);
var CusCode,CusPO,Sup: string;
begin
  if not ADOQuery1.Active then Exit;
  ADOQuery1.First;
  CusCode:=ADOQuery1.FieldByName('客户代码').AsString;
  CusPO:=ADOQuery1.FieldByName('客户订单号').AsString;
  Sup:=ADOQuery1.FieldByName('外发供应商代码').AsString;
//  while not ADOQuery1.Eof do
//  begin
//    if ((CusCode<>ADOQuery1.FieldByName('客户代码').AsString) or
//        (CusPO<>ADOQuery1.FieldByName('客户订单号').AsString) or
//        (Sup<>ADOQuery1.FieldByName('外发供应商代码').AsString))
//    then
//    begin
//      showmessage('必须是同一客户代码、客户订单号、外发供应商');
//      Abort;
//    end;
//    ADOQuery1.Next;
//  end;
  ppReport1.Reset;
  ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'SCPurPOrpt.rtm';      //R:\NIERP\Report\SCPurPOrpt.rtm
  ppReport1.Template.LoadFromFile;
  ppReport1.Print;
end;

procedure TfrmSCPOrpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if adoquery1.Active=true then adoquery1.CancelBatch();
end;

procedure TfrmSCPOrpt.BitBtn10Click(Sender: TObject);
begin
  f_supp:=tf_supp.Create(application);
  try
    if f_supp.ADOQuery1.IsEmpty then
     showmessage('对不起,没有找到外发供应商类型!')
    else
     if f_supp.ShowModal=mrok then
      begin
       edit11.Text:=f_supp.ADOQuery1code.Value;
       label85.Caption:=f_supp.ADOQuery1ABBR_NAME.Value;
       edit11.Tag:=f_supp.ADOQuery1rkey.Value;
      end;
  finally
    f_supp.free;
  end;
end;

procedure TfrmSCPOrpt.Edit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_BACK) or (Key = VK_DELETE) then
  begin
   edit11.Text:='';
   label85.Caption:='';
   edit11.Tag:=0;
  end;
end;

procedure TfrmSCPOrpt.Button4Click(Sender: TObject);
begin
  Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

end.
