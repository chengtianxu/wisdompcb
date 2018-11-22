unit Frm_AudInf_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, ADODB;

type
  TFrm_AudInf = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_AudInf: TFrm_AudInf;

implementation
uses DM_u;
{$R *.dfm}

procedure TFrm_AudInf.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=27 then self.ModalResult:=mrcancel;
end;

end.
