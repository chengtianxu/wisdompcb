unit uEnterMod_17;

interface
uses
  Vcl.Forms,Vcl.Controls;

procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;

exports
  EnterMod;

implementation

uses
   Mainfrm_Mod280,MainFrm_Mod29OrderManager,MainFrm_Mod30OrderAuth;



procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;
begin
  case AModID of
    280,28,27:
    begin
      outModMainFrm := TfrmMain_Mod280.Create(AParent,AModID);
    end;
    29:
    begin
      outModMainFrm := TfrmMain_Mod29OrderManager.Create(AParent,AModID);
    end;
    30:
    begin
      outModMainFrm := TfrmMain_Mod30OrderAuth.Create(AParent,AModID);
    end;
  end;
end;

end.
