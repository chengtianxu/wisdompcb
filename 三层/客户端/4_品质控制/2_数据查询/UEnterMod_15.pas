unit UEnterMod_15;

interface

uses
  Vcl.Forms,Vcl.Controls;

procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;

exports
  EnterMod;


implementation

uses
  MainFrm_Mod725;

procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;
begin
  case AModID of
    725:
    begin
      outModMainFrm := TfrmMain_Mod725.Create(AParent,AModID);
    end;
  end;
end;

end.
