unit pasSupplier_report;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm,ucommfunc, Vcl.Buttons,uBaseSinglePickListFrm,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, frxClass,
  frxDBSet, Data.DB, Datasnap.DBClient, Datasnap.Provider, Data.Win.ADODB,
  frxDesgn,PasPublic;

type
  TfrmSupplier_report = class(TfrmBase)
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    lblttype: TLabel;
    Label5: TLabel;
    Label85: TLabel;
    Label6: TLabel;
    rdgttype: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    Button3: TButton;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Edit11: TEdit;
    BitBtn10: TBitBtn;
    Edit3: TEdit;
    cds493s: TClientDataSet;
    fdb493: TfrxDBDataset;
    Label7: TLabel;
    ds60: TDataSource;
    cds60: TClientDataSet;
    fdb60: TfrxDBDataset;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    Button4: TButton;
    procedure BitBtn10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData;
  end;

var
  frmSupplier_report: TfrmSupplier_report;

implementation

{$R *.dfm}
procedure TfrmSupplier_report.Button1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmSupplier_report.Button3Click(Sender: TObject);
var Lstr:string;
begin
  inherited;
  if (rdgttype.ItemIndex<>2) then
    Lstr:=Lstr+' and data0025.ttype='+IntToStr(rdgttype.ItemIndex)+''
  else Lstr:='';
  if (Trim(Edit1.Text)<>'') then Lstr:=Lstr+' and Data0060.SALES_ORDER >='+quotedstr(Trim(Edit1.Text))+'';
  if (Trim(Edit2.Text)<>'') then Lstr:=Lstr+' and Data0060.SALES_ORDER <='+quotedstr(Trim(Edit2.Text))+'';
  if (Trim(Edit3.Text)<>'') then Lstr:=Lstr+' and Data0097.PO_NUMBER ='+quotedstr(Trim(Edit3.Text))+'';
  if (Trim(Edit11.Text)<>'') then Lstr:=Lstr+' and Data0023.code='+quotedstr(Trim(Edit11.Text))+'';
  Lstr:=Lstr+' and Data0060.ent_date >='+quotedstr(FormatDateTime('yyyy-MM-dd',dtpk1.Date));
  Lstr:=Lstr+' and Data0060.ent_date <='+quotedstr(FormatDateTime('yyyy-MM-dd',dtpk2.Date));
  gSvrIntf.IntfGetDataBySql(cds60.CommandText+Lstr,cds60);
end;

procedure TfrmSupplier_report.Button4Click(Sender: TObject);
begin
  PasPublic.Export_dbGrid_to_Excel(DBGrid1);
end;

procedure TfrmSupplier_report.FormShow(Sender: TObject);
begin
  dtpk1.Date:=gFunc.GetSvrDateTime-9;
  dtpk2.Date:=gFunc.GetSvrDateTime;
end;

procedure TfrmSupplier_report.GetData;
var
  LSql493:string;
begin
  LSql493:= cds493s.CommandText;
  gSvrIntf.IntfGetDataBySql(LSql493,cds493s);
end;

procedure TfrmSupplier_report.BitBtn10Click(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(72,8);
    if LFrm.ShowModal = mrOk then
    begin
      Edit11.Text:=LFrm.cdsPick.FieldByName('code').AsString;//
      Label7.Caption:=LFrm.cdsPick.FieldByName('SUPPLIER_NAME').AsString;//
    end;
  finally
    LFrm.Free;
  end;
end;

end.
