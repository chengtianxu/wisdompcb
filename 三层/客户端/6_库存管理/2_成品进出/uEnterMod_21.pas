unit uEnterMod_21;

interface
uses
  Vcl.Forms,Vcl.Controls;

procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;

exports
  EnterMod;

implementation
uses
  MainFrm_Mod525, MainFrm_Mod531;

procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;
begin
  case AModID of
    -1: //样板
    begin
      //outModMainFrm := TfrmMain_Mod15.Create(AParent,AModID);
    end;
    525://新包装标签打印
    begin
      outModMainFrm := TfrmMainMod_525.Create(AParent,AModID);
    end;
    531:
    begin
      outModMainFrm := TfrmMain_Mod531.Create(AParent,AModID);
    end
  else
    outModMainFrm := nil;
  end;
end;

end.
