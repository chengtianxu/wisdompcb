unit uEnterMod_20;

interface
uses
  Vcl.Forms,Vcl.Controls;

procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;

exports
  EnterMod;

implementation

uses MainFrm_Mod36, MainFrm_ModAll, MainFrm_ModShipped, Tree_Mod564,UMainfrm_mod496,
    UMainFrm_Mod497, UMainfrm_Mod38Caller,Mainfrm_Mod33;


procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;
begin
  case AModID of
    36: //库存材料检查
    begin
      if  checkPD_Mod36() then
        outModMainFrm := TfrmMain_Mod36.Create(AParent,AModID)
    end;
    40,41,352: //退货给供应商
    begin
      outModMainFrm := TfrmMain_Mod40Caller.Create(AParent,AModID);
    end;
    50,353: //装运到供应商
    begin
      outModMainFrm := TfrmMain_Mod50Caller.Create(AParent,AModID);
    end;
    564: //供应商VMI库存管理
    begin
      outModMainFrm := TfrmTree_Mod564.Create(AParent,AModID);
    end;
    496://生产领料申请
    begin
      outModMainFrm := TFrmMain_mod496.Create(AParent,AModID);
    end;
    497://工序领料审核
    begin
      outModMainFrm := TFrmMain_Mod497.Create(AParent,AModID);
    end;
    38://材料发放及退仓
    begin
      outModMainFrm := TfrmMain_Mod38Caller.Create(AParent,AModID);
    end;
    33://按采购接收入仓
    begin
      outModMainFrm := TfrmMain_Mod33.Create(AParent,AModID);
    end;
  else
    outModMainFrm := nil;
  end;
end;

end.
