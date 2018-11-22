unit uEnterMod_25;

interface
uses
  Vcl.Forms,Vcl.Controls;

procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;

exports
  EnterMod;

implementation

uses MainFrm_Mod02;


procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;
begin
  case AModID of
    15: //单位代码定义
    begin
      //outModMainFrm := TfrmMain_Mod15.Create(AParent,AModID);
      outModMainFrm := TFrmMain_Mod02.Create(AParent,AModID);
    end;

  else
    outModMainFrm := nil;
  end;
end;

end.
