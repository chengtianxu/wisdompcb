unit much_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB, ppProd, ppClass, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppCtrls, ppBands, ppPrnabl, ppCache,
  ExtCtrls, ppStrtch, ppMemo, ppEndUsr, ComCtrls;

type
  TForm13 = class(TForm)
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
    ppTitleBand1: TppTitleBand;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppDBImage1: TppDBImage;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLabel31: TppLabel;
    ppLine40: TppLine;
    ppLabel32: TppLabel;
    ppLine42: TppLine;
    ppMemo1: TppMemo;
    ppLabel33: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppDBText13: TppDBText;
    ppLine41: TppLine;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLine43: TppLine;
    ppDBText16: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppShape2: TppShape;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLabel28: TppLabel;
    ppLine35: TppLine;
    ppLabel29: TppLabel;
    ppLine39: TppLine;
    ppLabel30: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel16: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDB60: TppDBPipeline;
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
    lblso_tp: TLabel;
    rdgso_tp: TRadioGroup;
    rdgttype: TRadioGroup;
    lblttype: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses damo;

{$R *.dfm}

procedure TForm13.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm13.Button1Click(Sender: TObject);
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
   adoquery1.Prepared;
   adoquery1.Open;
   if adoquery1.IsEmpty then showmessage('对不起没有找到符合条件的订单')
   else  button3.Enabled:=true;
//  end;
end;

procedure TForm13.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit2.SetFocus;
end;

procedure TForm13.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then button1.SetFocus;
end;

procedure TForm13.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then adoquery1.Delete;
if adoquery1.IsEmpty then button3.Enabled:=false;
end;

procedure TForm13.Button3Click(Sender: TObject);
begin
  ppReport1.Reset;
  ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'much_Asoreport.rtm';      //R:\NIERP\Report\much_Asoreport.rtm
  ppReport1.Template.LoadFromFile;
  ppReport1.Print;
end;

procedure TForm13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if adoquery1.Active=true then adoquery1.CancelBatch();
end;

end.
