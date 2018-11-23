unit Enter2001;

interface
uses
  Vcl.Controls, system.SysUtils, system.Classes, Vcl.Dialogs;

procedure Enter(AParent: TWinControl; AModIDKey: int64); stdcall ;
exports
  Enter;
implementation
uses
  qk10000Fram;

procedure Enter(AParent: TWinControl; AModIDKey: int64); stdcall;
begin
  case AModIDKey of
    10000://系统用户管理
    begin
      try
        with Tfrmqk10000Fram.Create(AParent) do
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
