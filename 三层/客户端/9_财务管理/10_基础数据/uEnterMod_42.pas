unit uEnterMod_42;

interface
uses
  Vcl.Forms,Vcl.Controls;

procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;

exports
  EnterMod;

implementation

uses MainFrm_Mod01;


procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;
begin
  case AModID of
    225: //Ñש°ו
    begin
      //outModMainFrm := TfrmMain_Mod15.Create(AParent,AModID);
      outModMainFrm := TFrmMain_Mod01.Create(AParent,AModID);
    end;
  else
    outModMainFrm := nil;
  end;
end;

end.
