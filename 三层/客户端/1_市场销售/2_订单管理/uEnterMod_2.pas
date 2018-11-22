unit uEnterMod_2;

interface
uses
  Vcl.Forms,Vcl.Controls;

procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;

exports
  EnterMod;

implementation
uses
 MainFrm_Mod291,MainFrm_Mod599,MainFrm_OrderEditMarket_mod354,Mainfrm_OrderEditSChe_mod284
 ,MainFrm_Mod72,EP027_mod73,MainFrm_Mod623;

procedure EnterMod(AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;
begin
  case AModID of

    291:   //订单评审
    begin
      outModMainFrm := TfrmMain_Mod291.Create(AParent,AModID);
    end;
    599:   //订单回复交期更改
    begin
      outModMainFrm := TfrmMain_Mod599.Create(AParent,AModID);
    end;
     284://计划部门修改订单
    begin
      outModMainFrm := TfrmMain_OrderModiSChe_mod284.Create(AParent,AModID);
    end;
    354: //市场部修改订单
    begin
      outModMainFrm := TfrmMain_OrderEditMarket_mod354.Create(AParent,AModID);
    end;
     72: //订单输入
    begin
      outModMainFrm := Tfrm_MainMod72.Create(AParent,AModID);
    end;
    73: //订单确认
    begin
      outModMainFrm := TForm_mod73.Create(AParent,AModID);
    end;
   623: //订单预处理
    begin
      outModMainFrm := TfrmMain_Mod623.Create(AParent,AModID);
    end;
    else
    outModMainFrm := nil;


  end;
end;



end.
