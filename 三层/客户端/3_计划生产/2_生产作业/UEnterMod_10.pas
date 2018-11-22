unit UEnterMod_10;

interface

uses
  Vcl.Forms,Vcl.Controls;

procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;

exports
  EnterMod;


implementation

procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;
begin
  case AModID of
    724:
    begin
//      outModMainFrm := TfrmMain_Mod280.Create(AParent,AModID);
    end;
  end;
end;

end.
