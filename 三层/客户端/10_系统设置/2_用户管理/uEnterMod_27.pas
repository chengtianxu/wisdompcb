unit uEnterMod_27;

interface
uses
  Vcl.Forms,Vcl.Controls;

procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;

exports
  EnterMod;

implementation

uses
  MainFrm_Mod474Caller;


procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;
begin
  case AModID of
    -1: //样板
    begin
      //outModMainFrm := TfrmMain_Mod15.Create(AParent,AModID);
    end;
    474://系统用户管理
    begin
      outModMainFrm := TfrmMain_Mod474Caller.Create(AParent,AModID);
    end;
  else
    outModMainFrm := nil;
  end;
end;

end.
