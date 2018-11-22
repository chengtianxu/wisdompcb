unit PasCollectPZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls;

type
  TfrmFrmCollectPZ = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    ADOQuery1: TADOQuery;
    ADOQuery1iTotal: TIntegerField;
    ADOQuery1iPunctual: TIntegerField;
    ADOQuery1iPunctual2: TIntegerField;
    ADOQuery1dOnceFulfille: TBCDField;
    DataSource1: TDataSource;
    ADOQuery1dept_code1: TStringField;
    ADOQuery1dept_name1: TStringField;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFrmCollectPZ: TfrmFrmCollectPZ;

implementation
uses common;

{$R *.dfm}

procedure TfrmFrmCollectPZ.BitBtn2Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(dbgrideh1,self.Caption);
end;

procedure TfrmFrmCollectPZ.FormShow(Sender: TObject);
begin
  DBGridEh1.Columns[0].Footer.ValueType:=fvtStaticText;
  DBGridEh1.Columns[0].Footer.Value:='汇总';
  DBGridEh1.Columns[0].Footer.Alignment:=tacenter;
  DBGridEh1.Columns[5].Footer.ValueType:=fvtStaticText;
  DBGridEh1.Columns[5].Footer.Value:=FormatFloat('0.00',strtoInt(DBGridEh1.GetFooterValue(0,DBGridEh1.Columns[3]))/strtoInt(DBGridEh1.GetFooterValue(0,DBGridEh1.Columns[2]))*100);
  DBGridEh1.Columns[5].Title.Caption:='准期百分比';
  DBGridEh1.Columns[5].Width:=80;
end;

end.
