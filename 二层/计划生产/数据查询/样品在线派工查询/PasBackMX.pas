unit PasBackMX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls;

type
  TfrmBackMX = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1step_number: TSmallintField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1dept_name: TStringField;
    ADOQuery1DataValues: TFloatField;
    ADOQuery1OutDate: TDateTimeField;
    procedure FormActivate(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackMX: TfrmBackMX;

implementation

uses PasDM;

{$R *.dfm}

procedure TfrmBackMX.FormActivate(Sender: TObject);
begin
//  D06.RKEY, D38.STEP_NUMBER,D06.PRIORITY_CODE
  ADOQuery1.Close;
  ADOQuery1.Parameters.ParamByName('D06RKEY').Value:=dm.Ado587Rkey.Value;
  ADOQuery1.Parameters.ParamByName('StepNum').Value:=DM.Ado587STEP_NUMBER.Value;
  ADOQuery1.Parameters.ParamByName('TType').Value:=DM.Ado587PRIORITY_CODE.Value;
  ADOQuery1.open;
end;

procedure TfrmBackMX.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
//  ADOQuery1OutDate.Value:=DM.Ado587ModernDate34.Value+dm.Ado586DataValues.Value;
end;

end.
