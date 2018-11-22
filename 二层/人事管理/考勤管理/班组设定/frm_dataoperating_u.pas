unit frm_dataoperating_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,TMyThread_u,TMyThread2_u, StdCtrls;

type
  Tfrm_dataoperating = class(TForm)
    ProgressBar1: TProgressBar;
    Button1: TButton;
    procedure prepare;
    procedure prepare2;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    prepare_flag: integer;
  end;

var
  frm_dataoperating: Tfrm_dataoperating;
  MyThread: TMyThread;
  MyThread2: TMyThread2;

implementation

uses frm_emp_choose_u;
{$R *.dfm}

procedure Tfrm_dataoperating.prepare;
begin
prepare_flag:=0;
prepare2;
end;

procedure Tfrm_dataoperating.prepare2;
var i,j: integer;
begin
  MyThread := TMyThread.create(False);
  MyThread2 := TMyThread2.create(False);
end;

procedure Tfrm_dataoperating.Button1Click(Sender: TObject);
begin
frm_dataoperating.Free;
end;

end.
