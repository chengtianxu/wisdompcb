unit mater_Report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport,
  ppEndUsr;

type
  TFrmReport = class(TForm)
    DataSource1: TDataSource;
    ppDB493: TppDBPipeline;
    ppDB22: TppDBPipeline;
    DataSource3: TDataSource;
    ppDB22ppField8: TppField;
    ppDB22ppField2: TppField;
    ppDB22ppField9: TppField;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReport: TFrmReport;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmReport.ppReport1PreviewFormCreate(Sender: TObject);
begin
//  ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
