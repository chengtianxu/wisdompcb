unit detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls;

type
  TFrm_authinfo = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_authinfo: TFrm_authinfo;

implementation

uses demo;

{$R *.dfm}

end.
