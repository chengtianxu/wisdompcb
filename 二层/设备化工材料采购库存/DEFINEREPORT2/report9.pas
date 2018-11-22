unit report9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, DB, ppModule, raCodMod, ppBands, ppClass, ppCtrls,
  ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe;

type
  TFrmreport9 = class(TForm)
    ppDBS112: TppDBPipeline;
    ppDBS112ppField1: TppField;
    ppDBS112ppField2: TppField;
    ppDBS112ppField3: TppField;
    ppDBS112ppField4: TppField;
    ppDBS112ppField5: TppField;
    ppDBS112ppField6: TppField;
    ppDBS112ppField7: TppField;
    ppDBS112ppField8: TppField;
    ppDBS112ppField9: TppField;
    ppDBS112ppField10: TppField;
    ppDBS112ppField11: TppField;
    ppDBS112ppField12: TppField;
    ppDBS112ppField13: TppField;
    ppDBS112ppField14: TppField;
    ppDBS112ppField15: TppField;
    ppDBS112ppField16: TppField;
    ppDBS112ppField17: TppField;
    ppDBS112ppField18: TppField;
    ppDBS112ppField19: TppField;
    DataSource4: TDataSource;
    DataSource1: TDataSource;
    ppDB493: TppDBPipeline;
    ppDB493ppField1: TppField;
    ppDB493ppField2: TppField;
    ppDB493ppField3: TppField;
    ppDB493ppField4: TppField;
    ppDB493ppField5: TppField;
    ppDB493ppField6: TppField;
    ppDB493ppField7: TppField;
    ppReport3: TppReport;
    ppDesigner3: TppDesigner;
    procedure ppReport3PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmreport9: TFrmreport9;

implementation

{$R *.dfm}

procedure TFrmreport9.ppReport3PreviewFormCreate(Sender: TObject);
begin
 ppReport3.PreviewForm.WindowState := wsMaximized;
end;

end.
