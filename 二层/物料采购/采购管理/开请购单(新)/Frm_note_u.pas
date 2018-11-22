unit Frm_note_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, DB, ADODB;

type
  TFrm_note = class(TForm)
    DBMemo1: TDBMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DS11: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_note: TFrm_note;

implementation
 uses DM_u;
{$R *.dfm}

end.
