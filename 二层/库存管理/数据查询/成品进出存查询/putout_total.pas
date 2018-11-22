unit putout_total;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj,Excel2000,ClipBrd,
  Buttons;

type
  TForm7 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1PROD_CODE: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1putout_total: TFloatField;
    Label2: TLabel;
    Label3: TLabel;
    ADOQuery1amount: TFloatField;
    Label4: TLabel;
    Edit3: TEdit;
    ADOQuery1weight: TFloatField;
    Label5: TLabel;
    Edit4: TEdit;
    ADOQuery1so_mianqi: TFloatField;
    ADOQuery1ANALYSIS_CODE_2: TStringField;
    ADOQuery1product_name: TStringField;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery1tax_amount: TFloatField;
    Label6: TLabel;
    Edit5: TEdit;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    ADOQuery1orig_customer: TStringField;
    ADOQuery1total_cost: TFloatField;
    ADOQuery1cust_code: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses main,common;

{$R *.dfm}

procedure TForm7.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  form1.Show;
end;

procedure TForm7.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
    showmessage(adoquery1.SQL.Text);
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
  Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm7.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm7.BitBtn4Click(Sender: TObject);
begin
Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

end.
