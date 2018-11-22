unit report7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, ppModule, raCodMod, ppCtrls, ppBands, ppClass, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, DB;

type
  TFrmreport7 = class(TForm)
    DataSource1: TDataSource;
    ppDB493: TppDBPipeline;
    ppDB493ppField1: TppField;
    ppDB493ppField2: TppField;
    ppDB493ppField3: TppField;
    ppDB493ppField4: TppField;
    ppDB493ppField5: TppField;
    ppDB493ppField6: TppField;
    ppDB493ppField7: TppField;
    ppDB52: TppDBPipeline;
    DataSource4: TDataSource;
    ppReport3: TppReport;
    ppDesigner3: TppDesigner;
    procedure ppReport3PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmreport7: TFrmreport7;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmreport7.ppReport3PreviewFormCreate(Sender: TObject);
begin
 ppReport3.PreviewForm.WindowState := wsMaximized;
end;

end.
