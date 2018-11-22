unit report6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, DB, ppModule, raCodMod, ppCtrls, ppBands, ppClass,
  ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe;

type
  TFrmreport6 = class(TForm)
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
    ppDB53_in: TppDBPipeline;
    procedure ppReport2PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmreport6: TFrmreport6;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmreport6.ppReport2PreviewFormCreate(Sender: TObject);
begin
 ppReport2.PreviewForm.WindowState := wsMaximized;
end;

end.
