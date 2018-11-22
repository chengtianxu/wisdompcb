unit report4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, ppModule, raCodMod, ppCtrls, ppBands, ppClass, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, DB;

type
  TFrmreport4 = class(TForm)
    DataSource1: TDataSource;
    ppDB493: TppDBPipeline;
    ppDBPipeline1ppField1: TppField;
    ppDBPipeline1ppField2: TppField;
    ppDBPipeline1ppField3: TppField;
    ppDBPipeline1ppField4: TppField;
    ppDBPipeline1ppField5: TppField;
    ppDBPipeline1ppField6: TppField;
    ppDBPipeline1ppField7: TppField;
    ppDB0022: TppDBPipeline;
    DataSource4: TDataSource;
    ppReport2: TppReport;
    ppDesigner2: TppDesigner;
    procedure ppReport2PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmreport4: TFrmreport4;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmreport4.ppReport2PreviewFormCreate(Sender: TObject);
begin
// ppReport2.PreviewForm.WindowState := wsMaximized;
end;

end.
