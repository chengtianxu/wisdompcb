unit PasCollect_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls;

type
  TFrmCollect2 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    ADOQuery1: TADOQuery;
    ADOQuery1DEPT_CODE: TStringField;
    ADOQuery1DEPT_NAME: TStringField;
    ADOQuery1d34Rkey: TAutoIncField;
    ADOQuery1iTotal: TIntegerField;
    ADOQuery1iPunctual: TIntegerField;
    DataSource1: TDataSource;
    ADOQuery1iPunctual2: TIntegerField;
    ADOQuery1dOnceFulfille: TBCDField;
    ADOQuery1dept_code1: TStringField;
    ADOQuery1dept_name1: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCollect2: TFrmCollect2;

implementation
uses common;

{$R *.dfm}

procedure TFrmCollect2.FormShow(Sender: TObject);
begin
  DBGridEh1.Columns[0].Footer.ValueType:=fvtStaticText;
  DBGridEh1.Columns[0].Footer.Value:='汇总';
  DBGridEh1.Columns[0].Footer.Alignment:=tacenter;
  DBGridEh1.Columns[6].Footer.ValueType:=fvtStaticText;
  DBGridEh1.Columns[6].Footer.Value:=FormatFloat('0.00',strtoInt(DBGridEh1.GetFooterValue(0,DBGridEh1.Columns[4]))/strtoInt(DBGridEh1.GetFooterValue(0,DBGridEh1.Columns[3]))*100);
  DBGridEh1.Columns[6].Title.Caption:='准期百分比';
  DBGridEh1.Columns[6].Width:=80;
end;

procedure TFrmCollect2.BitBtn2Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(dbgrideh1,self.Caption);
end;

end.
