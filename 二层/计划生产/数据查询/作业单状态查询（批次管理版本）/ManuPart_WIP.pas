unit ManuPart_WIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids, DBGridEh, DB, ADODB,
  main,  Excel2000,  DBCtrlsEh;



type
  TfrmManuPart_WIP = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    lbl1: TLabel;
    edt1: TEdit;
    btnQuery: TBitBtn;
    btn1: TBitBtn;
    eh1: TDBGridEh;
    eh2: TDBGridEh;
    eh3: TDBGridEh;
    eh4: TDBGridEh;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    dbmmoDEF_ROUT_INST: TDBMemo;
    lbl6: TLabel;
    ds38: TDataSource;
    ds38_494: TDataSource;
    ds56: TDataSource;
    ds53: TDataSource;
    ads38: TADODataSet;
    ads56: TADODataSet;
    ads38_494: TADODataSet;
    ads53: TADODataSet;
    ads38STEP_NUMBER: TSmallintField;
    ads38DEPT_CODE: TStringField;
    ads38DEPT_NAME: TStringField;
    ads38rkey25: TAutoIncField;
    ads56RKEY: TAutoIncField;
    ads56WORK_ORDER_NUMBER: TStringField;
    ads56DEPT_CODE: TStringField;
    ads56QTY_BACKLOG: TFloatField;
    ads56PANELS: TIntegerField;
    ads56TO_BE_STOCKED: TFloatField;
    ads56PROD_STATUS: TSmallintField;
    ads56wtype: TWordField;
    ads56prod_Square: TFloatField;
    ads38DEF_ROUT_INST: TStringField;
    ads38_494seq_no: TSmallintField;
    ads38_494step_number: TSmallintField;
    ads38_494PARAMETER_NAME: TStringField;
    ads38_494PARAMETER_VALUE: TStringField;
    ads38rkey34: TAutoIncField;
    ads38rkey38: TAutoIncField;
    ads38_494PARAMETER_DESC: TStringField;
    ads53CODE: TStringField;
    ads53LOCATION: TStringField;
    ads53COLUMN1: TIntegerField;
    ads53ABBR_NAME: TStringField;
    ads38OnLinePcs: TFloatField;
    ads38OnLinesPnl: TIntegerField;
    ads56unit_sq_includingBoader: TFloatField;
    cbx1: TCheckBox;
    ads56INTIME: TDateTimeField;
    ads56SCH_COMPL_DATE: TDateTimeField;
    BitBtn1: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure ads38AfterScroll(DataSet: TDataSet);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure cbx1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuPart_WIP: TfrmManuPart_WIP;

implementation

uses common;
{$R *.dfm}

procedure TfrmManuPart_WIP.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmManuPart_WIP.btnQueryClick(Sender: TObject);
begin
  ads38.Close;
  ads38.Parameters[0].Value := edt1.Text;
  ads38.Open;

  ads56.Open;
  ads38_494.Open;
  ads53.Open;
end;

procedure TfrmManuPart_WIP.ads38AfterScroll(DataSet: TDataSet);
begin
  eh2.SumList.RecalcAll;
end;

procedure TfrmManuPart_WIP.edt1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then btnQueryClick(btnQuery);
end;

procedure TfrmManuPart_WIP.cbx1Click(Sender: TObject);
begin
  eh2.Columns[5].Visible := cbx1.Checked;
end;

procedure TfrmManuPart_WIP.FormShow(Sender: TObject);
begin
  if frmMain.adsWo_List.FieldByName('manu_part_number').AsString <> '' then
  begin
    edt1.Text := frmMain.adsWo_List.FieldByName('manu_part_number').AsString;
    btnQueryClick(btnQuery);
  end;
end;


procedure TfrmManuPart_WIP.BitBtn1Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(eh1,Self.Caption);
end;

end.
