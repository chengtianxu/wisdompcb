unit Unit_progress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TForm_progress = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    vstepvalue1:integer;
    procedure get_stepvalue(const Value: integer);
    function set_stepvalue: integer;
    { Private declarations }
  public
    { Public declarations }
    property stepvalue:integer read set_stepvalue write get_stepvalue;
  end;

var
  Form_progress: TForm_progress;

implementation

{$R *.dfm}

procedure TForm_progress.get_stepvalue(const Value: integer);
begin
 vstepvalue1:=value;
end;

function TForm_progress.set_stepvalue: integer;
begin
  result:=vstepvalue1;
end;

procedure TForm_progress.Timer1Timer(Sender: TObject);
begin
  if vstepvalue1=0 then
  begin
    ProgressBar1.Step := vstepvalue1 +1;
    vstepvalue1:=vstepvalue1+1;
  end
  else if vstepvalue1=100 then
  begin
    vstepvalue1:=0;
    ProgressBar1.Step := vstepvalue1 +1;
  end;
end;

end.
