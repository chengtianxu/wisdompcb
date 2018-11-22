unit Report11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppModule, raCodMod, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, DB, ADODB,
  StdCtrls, ppEndUsr;

type
  TFrmReport11 = class(TForm)
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    ADOData0493: TADODataSet;
    ADO1: TADOQuery;
    Data0493: TppDBPipeline;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReport11: TFrmReport11;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmReport11.ppReport1PreviewFormCreate(Sender: TObject);
begin
//  ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
