unit ViewInfoFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls, DBClient, DB, Grids;

type

  TfrmViewInfo = class(TForm)
    lbl1: TLabel;
    pnl1: TPanel;
    btn1: TSpeedButton;
    sg1: TStringGrid;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmViewInfo.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;


end.
