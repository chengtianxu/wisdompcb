unit TMyThread2_u;

interface

uses
  Classes,forms,windows,SysUtils;

type
  TMyThread2 = class(TThread)
  private
    procedure Run;
  protected
    procedure Execute; override;
  end;

implementation

uses frm_emp_choose_u, frm_dataoperating_u;

procedure TMyThread2.Execute;
begin
   self.Synchronize(run);
end;

procedure TMyThread2.Run;
var i,k : integer ;
begin
  k :=1;
  while ((frm_dataoperating.prepare_flag<>1) and (k<8)) do
  begin
      with frm_dataoperating do
      begin
        for i := 1 to 49900 do
          ProgressBar1.Position := i;
          Application.ProcessMessages;
      end;
      k := k+1;
  end;
  with frm_dataoperating do
    begin
      for i := 49900 to 50000 do
        ProgressBar1.Position := i;
        Application.ProcessMessages;
    end;
  frm_emp_choose.Enabled:=true;
  Application.ProcessMessages;
  frm_dataoperating.Button1.Click;
  
end;

end.
