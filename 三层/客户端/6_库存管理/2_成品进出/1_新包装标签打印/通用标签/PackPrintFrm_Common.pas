unit PackPrintFrm_Common;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,BasePackPrintFrm_525, frxDesgn,
  Bde.DBTables, frxClass, frxDBSet, Data.DB, Datasnap.DBClient, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, Vcl.Grids, Vcl.ValEdit, Vcl.ExtCtrls;

type
  TfrmPackPrint_Common = class(TfrmBasePackPrint_525)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPackPrint_Common: TfrmPackPrint_Common;

implementation

{$R *.dfm}

end.
