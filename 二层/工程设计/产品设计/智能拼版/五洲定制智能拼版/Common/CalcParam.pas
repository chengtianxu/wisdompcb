
unit CalcParam;

interface
uses
  IniFiles, Classes;

type
  TZK = record
    W,H: Double;
  end;

  TCutParam = record
    SheetW,SheetH: Double;
    PnlAMinW,PnlAMinH,PnlAMaxW,PnlAMaxH: Double;
    PnlASetW,PnlASetH: Double;
    PnlASetHorzSpace,PnlASetVertSpace: Double;
    PnlABorderLeftRightWidth, PnlABorderTopBottomWidth: Double;
    PnlAZKArr: array of TZK;
    PnlAZKPos: Integer;//1 板边 2 中央
    PnlASelfRotate, PnlARotateSet: Boolean;

    PnlBMinW,PnlBMinH,PnlBMaxW,PnlBMaxH: Double;
    PnlBSetW,PnlBSetH: Double;
    PnlBSetHorzSpace,PnlBSetVertSpace: Double;
    PnlBBorderLeftRightWidth, PnlBBorderTopBottomWidth: Double;
    PnlBZKArr: array of TZK;
    PnlBZKPos: Integer;//1 板边 2 中央
    PnlBSelfRotate ,PnlBRotateSet: Boolean;

    DoublePnl: Boolean;
    WDivH: Double;//长宽不超过1:7
    MinUseage: Double;//只显示利用率

    m3ZKLength,m6ZKLength: Double;//3mm阻抗和6mm阻抗的长度
  end;
  PCutParam = ^TCutParam;

implementation


end.
