unit Enter1901;

interface
uses
  Vcl.Controls, system.SysUtils, system.Classes, Vcl.Dialogs;

procedure Enter(AParent: TWinControl; AModIDKey: int64); stdcall ;
exports
  Enter;
implementation
uses
  qk1909001Fram;

procedure Enter(AParent: TWinControl; AModIDKey: int64); stdcall;
begin
  case AModIDKey of
    1909001://ªı±“…Ë÷√
    begin
      try
        with Tfrmqk1909001Fram.Create(AParent) do
        begin
          ModID := AModIDKey;
          Init(AModIDKey);
        end;
      except
        on E: Exception do
        begin
          ShowMessage(e.Message);
          Exit;
        end;
      end;
    end;
  end;
end;

end.
