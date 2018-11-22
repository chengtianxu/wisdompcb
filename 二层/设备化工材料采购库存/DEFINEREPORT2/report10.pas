unit report10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, DB, ppModule, raCodMod, ppBands, ppCtrls, ppVar,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe;

type
  TFrmreport10 = class(TForm)
    ppDBt112: TppDBPipeline;
    ppDBt112ppField1: TppField;
    ppDBt112ppField2: TppField;
    ppDBt112ppField3: TppField;
    ppDBt112ppField4: TppField;
    ppDBt112ppField5: TppField;
    ppDBt112ppField6: TppField;
    ppDBt112ppField7: TppField;
    ppDBt112ppField8: TppField;
    ppDBt112ppField9: TppField;
    ppDBt112ppField10: TppField;
    DataSource5: TDataSource;
    DataSource1: TDataSource;
    ppDB493: TppDBPipeline;
    ppDB493ppField1: TppField;
    ppDB493ppField2: TppField;
    ppDB493ppField3: TppField;
    ppDB493ppField4: TppField;
    ppDB493ppField5: TppField;
    ppDB493ppField6: TppField;
    ppDB493ppField7: TppField;
    ppReport4: TppReport;
    ppDesigner4: TppDesigner;
    procedure ppReport4PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmreport10: TFrmreport10;

implementation

{$R *.dfm}

procedure TFrmreport10.ppReport4PreviewFormCreate(Sender: TObject);
begin
 ppReport4.PreviewForm.WindowState := wsMaximized;
end;

end.
