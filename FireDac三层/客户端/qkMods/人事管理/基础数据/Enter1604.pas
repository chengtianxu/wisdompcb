unit Enter1604;

interface
uses
  Vcl.Controls, system.SysUtils, system.Classes, Vcl.Dialogs;

procedure Enter(AParent: TWinControl; AModIDKey: int64); stdcall ;
exports
  Enter;

implementation
uses
  qk1604001Fram;



procedure Enter(AParent: TWinControl; AModIDKey: int64); stdcall;
begin
  case AModIDKey of
    1604001://员工管理
    begin
      try
        with Tfrmqk1604001Fram.Create(AParent) do
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
    1604002://部门岗位定义
    begin
//      try
//        with Tfrmqk1604002Fram.Create(AParent) do
//        begin
//          ModID := AModIDKey;
//          Init(AModIDKey);
//        end;
//      except
//        on E: Exception do
//        begin
//          ShowMessage(e.Message);
//          Exit;
//        end;
//      end;
    end;
  end;
end;

end.
