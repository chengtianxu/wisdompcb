unit report5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, ppModule, raCodMod, ppCtrls, ppBands, ppClass, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, DB;

type
  TFrmReport5 = class(TForm)
    DataSource1: TDataSource;
    ppDB493: TppDBPipeline;
    ppDBPipeline1ppField1: TppField;
    ppDBPipeline1ppField2: TppField;
    ppDBPipeline1ppField3: TppField;
    ppDBPipeline1ppField4: TppField;
    ppDBPipeline1ppField5: TppField;
    ppDBPipeline1ppField6: TppField;
    ppDBPipeline1ppField7: TppField;
    ppDB207: TppDBPipeline;
    ppDB207ppField1: TppField;
    ppDB207ppField2: TppField;
    ppDB207ppField3: TppField;
    ppDB207ppField4: TppField;
    ppDB207ppField5: TppField;
    ppDB207ppField6: TppField;
    ppDB207ppField7: TppField;
    ppDB207ppField8: TppField;
    ppDB207ppField9: TppField;
    ppDB207ppField10: TppField;
    ppDB207ppField11: TppField;
    ppDB207ppField12: TppField;
    ppDB207ppField13: TppField;
    ppDB207ppField14: TppField;
    DataSource2: TDataSource;
    ppReport3: TppReport;
    ppDesigner3: TppDesigner;
    procedure ppReport3PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReport5: TFrmReport5;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmReport5.ppReport3PreviewFormCreate(Sender: TObject);
begin
  ppReport3.PreviewForm.WindowState := wsMaximized;
end;

end.
