unit PasMany_So_report;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm,ucommfunc, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient,
  frxDesgn, frxClass, Datasnap.Provider, Data.Win.ADODB, frxDBSet;

type
  TfrmMany_So_report = class(TfrmBase)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    lblso_tp: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    lblttype: TLabel;
    Label5: TLabel;
    rdgttype: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    Button3: TButton;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    rdgso_tp: TRadioGroup;
    ComboBox1: TComboBox;
    DBGrid1: TDBGrid;
    ds60: TDataSource;
    cds60: TClientDataSet;
    cds15: TClientDataSet;
    cds493s: TClientDataSet;
    fdb493: TfrxDBDataset;
    fdb60: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData();
  end;

var
  frmMany_So_report: TfrmMany_So_report;

implementation

{$R *.dfm}

{ TfrmMany_So_report }

procedure TfrmMany_So_report.Button1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmMany_So_report.Button2Click(Sender: TObject);
var LFileName:string;
begin
  if not cds60.IsEmpty then
  begin
  LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
    'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\市场销售_订单管理\', [rfReplaceAll]) +
    'much_Asoreport.fr3';
  frxReport1.LoadFromFile(LFileName, true);
  frxReport1.ShowReport;
  end;
end;

procedure TfrmMany_So_report.Button3Click(Sender: TObject);
var Lstr:string;
begin
  inherited;
  if (rdgso_tp.ItemIndex<>3) then
  begin
    lstr:=' and data0060.so_tp='+IntToStr(rdgso_tp.ItemIndex)+'';
  end else lstr:='';
  if (rdgttype.ItemIndex<>2) then
    Lstr:=Lstr+' and data0025.ttype='+IntToStr(rdgttype.ItemIndex)+''
  else Lstr:=Lstr;
  if (Trim(Edit1.Text)<>'') then Lstr:=Lstr+' and Data0060.SALES_ORDER >='+quotedstr(Trim(Edit1.Text))+'';
  if (Trim(Edit2.Text)<>'') then Lstr:=Lstr+' and Data0060.SALES_ORDER <='+quotedstr(Trim(Edit2.Text))+'';
  Lstr:=Lstr+' and Data0060.ent_date >='+quotedstr(FormatDateTime('yyyy-MM-dd',dtpk1.Date));
  Lstr:=Lstr+' and Data0060.ent_date <='+quotedstr(FormatDateTime('yyyy-MM-dd',dtpk2.Date));
  gSvrIntf.IntfGetDataBySql(cds60.CommandText+Lstr,cds60);
end;

procedure TfrmMany_So_report.ComboBox1Change(Sender: TObject);
begin
  inherited;
  cds60.Filter:='ABBR_NAME='''+Trim(ComboBox1.Text)+'''';
end;

procedure TfrmMany_So_report.FormShow(Sender: TObject);
begin
  dtpk1.Date:=gFunc.GetSvrDateTime-9;
  dtpk2.Date:=gFunc.GetSvrDateTime;
  gSvrIntf.IntfGetDataBySql(cds15.CommandText,cds15);
  if not cds15.IsEmpty then
  begin
    cds15.First;
    while not cds15.Eof do
    begin
      ComboBox1.Items.Add(cds15.FieldByName('ABBR_NAME').AsString);
      cds15.Next;
    end;
  end;
end;

procedure TfrmMany_So_report.GetData;
var
  LSql493:string;
begin
  LSql493:= cds493s.CommandText;
  gSvrIntf.IntfGetDataBySql(LSql493,cds493s);
end;

end.
