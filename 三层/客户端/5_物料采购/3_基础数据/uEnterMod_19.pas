unit uEnterMod_19;

interface
uses
  Vcl.Forms,Vcl.Controls;

procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;

exports
  EnterMod;

implementation

uses MainFrm_Mod63,PurBugetFrmMain_mod25,MainFrm_mod26,auditFLowMainFrm_mod67,
       PurAuditMainFrm_mod274,AuditAuthMainFrm_mod315,OtherMtrlTypeMainFrm_mod278;

procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;
begin
  case AModID of
    63:
    begin
      outModMainFrm := TFrmMain_Mod63.Create(AParent,AModID);
    end;
    25:
    begin
      outModMainFrm := TfrmMainPurBuget_Mod25.Create(AParent,AModID);
    end;
     26:
    begin
      outModMainFrm := TFrmMainVendorPrice_Mod26.Create(AParent,AModID);
    end;
      67:
    begin
      outModMainFrm := TfrmMainAuditFLow_mod67.Create(AParent,AModID);
    end;

    274:
    begin
      outModMainFrm := TfrmMainPurAudit_mod274.Create(AParent,AModID);
    end;

    315:
    begin
      outModMainFrm := TfrmMainAuditAuth_mod315.Create(AParent,AModID);
    end;

    278:
    begin
      outModMainFrm := TfrmMainOtherMtrlType_mod278.Create(AParent,AModID);
    end;


  end;

end;

end.
