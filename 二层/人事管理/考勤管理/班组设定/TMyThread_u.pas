unit TMyThread_u;

interface

uses
  Classes,forms,windows,SysUtils;

type
  TMyThread = class(TThread)

  private
    procedure Run;
  protected
    procedure Execute; override;
  end;
implementation
uses frm_emp_choose_u, damo, frm_dataoperating_u, frm_detail_u, frm_main_u;

procedure TMyThread.Execute;
begin
  run;
  frm_dataoperating.prepare_flag:=1;
end;

procedure TMyThread.Run;
begin
  frm_dataoperating.prepare_flag:=0;
  with frm_emp_choose do
  begin
    dm.ADODataSet_emplist.Close;
    dm.ADODataSet_emplist.CommandText := damo.sSql_fiter_0 + sSql_fiter;
    dm.ADODataSet_emplist.Open;
    statictext1.Caption := inttostr(Grd1.DataSource.DataSet.RecordCount);
    Application.ProcessMessages;
  end;

end;

end.
