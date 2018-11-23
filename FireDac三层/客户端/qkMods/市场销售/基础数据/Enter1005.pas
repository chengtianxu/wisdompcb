unit Enter1005;

interface
uses
  Vcl.Controls, system.SysUtils, system.Classes, Vcl.Dialogs;

procedure Enter(AParent: TWinControl; AModIDKey: int64); stdcall ;
exports
  Enter;
implementation
uses
  qk1005001Fram,
  qk1005002Fram;

procedure Enter(AParent: TWinControl; AModIDKey: int64); stdcall;
begin
  case AModIDKey of
    1005001://客户信息管理
    begin
      try
        with Tfrmqk1005001Fram.Create(AParent) do
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
    1005002://报价规则定义
    begin
      try
        with Tfrmqk1005002Fram.Create(AParent) do
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
