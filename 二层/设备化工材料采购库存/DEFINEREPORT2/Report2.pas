unit Report2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, ppProd, ppClass,
  ppReport, ppModule, raCodMod, ppBands, ppCtrls, ppVar, ppPrnabl, ppCache,
  ppEndUsr;

type
  TFrmreport2 = class(TForm)
    DataSource1: TDataSource;
    ppDB493: TppDBPipeline;
    ppDB439: TppDBPipeline;
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
  Frmreport2: TFrmreport2;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmreport2.ppReport1PreviewFormCreate(Sender: TObject);
begin
 ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
