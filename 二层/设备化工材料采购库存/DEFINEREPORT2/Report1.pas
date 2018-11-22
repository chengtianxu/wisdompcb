unit Report1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport,
  ppEndUsr;

type
  TFrmreport1 = class(TForm)
    DataSource1: TDataSource;
    ppDB493: TppDBPipeline;
    ppDB53: TppDBPipeline;
    DataSource2: TDataSource;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmreport1: TFrmreport1;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmreport1.ppReport1PreviewFormCreate(Sender: TObject);
begin
// ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
