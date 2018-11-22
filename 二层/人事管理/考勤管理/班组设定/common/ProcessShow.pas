unit ProcessShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPrgres, StdCtrls, ExtCtrls;

type
  TfrmProcessShow = class(TForm)
    progressbar: TRzProgressBar;
    Label1: TLabel;
    Bevel1: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure ShowProgress(Msg:string);
  public
    { Public declarations }
    procedure IncStep(StepNum:integer;Msg:string);
  end;

var
  frmProcessShow: TfrmProcessShow;

implementation

{$R *.dfm}

{ TfrmProcessShow }

procedure TfrmProcessShow.IncStep(StepNum: integer; Msg: string);
var
 i:integer;
begin
{
  if progressbar.Percent < 100 then
  if StepNum > 1 then
  begin
    for i := 1 to StepNum do
    begin
      progressbar.Percent := progressbar.Percent + 1;
      progressbar.Update;
      Update;
    end
  end
  else
    progressbar.Percent := progressbar.Percent + StepNum;
  Label1.Caption := Msg;
  progressbar.Refresh;
  Update;}
  for i := 1 to StepNum do
    ShowProgress(Msg);
end;

procedure TfrmProcessShow.ShowProgress(Msg: string);
begin
  Label1.Caption := Msg;
  progressbar.Percent := progressbar.Percent + 1;
  progressbar.Update;
  Update;
end;

procedure TfrmProcessShow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
  frmProcessShow := nil;
end;

end.
