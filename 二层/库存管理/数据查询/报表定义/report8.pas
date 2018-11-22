unit report8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, DB, ppModule, raCodMod, ppBands, ppClass, ppCtrls,
  ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe;

type
  TFrmreport8 = class(TForm)
    ppDB530: TppDBPipeline;
    ppDB530ppField1: TppField;
    ppDB530ppField2: TppField;
    ppDB530ppField3: TppField;
    ppDB530ppField4: TppField;
    ppDB530ppField5: TppField;
    ppDB530ppField6: TppField;
    ppDB530ppField7: TppField;
    ppDB530ppField8: TppField;
    ppDB530ppField9: TppField;
    ppDB530ppField10: TppField;
    ppDB530ppField11: TppField;
    ppDB530ppField12: TppField;
    ppDB530ppField13: TppField;
    ppDB530ppField14: TppField;
    ppDB530ppField15: TppField;
    ppDB530ppField16: TppField;
    ppDB530ppField17: TppField;
    DataSource3: TDataSource;
    DataSource1: TDataSource;
    ppDB493: TppDBPipeline;
    ppDB493ppField1: TppField;
    ppDB493ppField2: TppField;
    ppDB493ppField3: TppField;
    ppDB493ppField4: TppField;
    ppDB493ppField5: TppField;
    ppDB493ppField6: TppField;
    ppDB493ppField7: TppField;
    ppReport2: TppReport;
    ppDesigner2: TppDesigner;
    procedure ppReport2PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmreport8: TFrmreport8;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmreport8.ppReport2PreviewFormCreate(Sender: TObject);
begin
 ppReport2.PreviewForm.WindowState := wsMaximized;
end;

end.
