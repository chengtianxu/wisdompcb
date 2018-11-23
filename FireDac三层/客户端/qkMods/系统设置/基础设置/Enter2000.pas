unit Enter2000;

interface
uses
  Vcl.Controls, system.SysUtils, system.Classes, Vcl.Dialogs;

procedure Enter(AParent: TWinControl; AModIDKey: int64); stdcall ;
exports
  Enter;
implementation
uses
  qk200000001Fram,
  qk20000003Fram,
  qk200002Fram;

procedure Enter(AParent: TWinControl; AModIDKey: int64); stdcall;
begin
  case AModIDKey of
    200001://单位字典
    begin
      try
        with Tfrmqk200000001Fram.Create(AParent) do
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
    200002://流水码控制
    begin
      try
        with Tfrmqk200002Fram.Create(AParent) do
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
    200003://单位定义
    begin
      try
        with Tfrmqk20000003Fram.Create(AParent) do
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
