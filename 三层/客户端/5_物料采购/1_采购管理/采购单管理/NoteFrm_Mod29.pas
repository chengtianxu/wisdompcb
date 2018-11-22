unit NoteFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,uBaseFrm;

type
  TfrmNote_Mod29 = class(TfrmBase)
    pnl1: TPanel;
    pnl2: TPanel;
    btnS: TBitBtn;
    btnC: TBitBtn;
    mmo1: TMemo;
    btnSelect: TBitBtn;
    procedure btnSelectClick(Sender: TObject);
    procedure btnSClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(ARkey:string;AType:Integer);
  end;

var
  frmNote_Mod29: TfrmNote_Mod29;

implementation

uses uCommFunc,Datasnap.DBClient, CommFrm_Mod29;

{$R *.dfm}

{ TfrmNote_Mod29 }

procedure TfrmNote_Mod29.btnSClick(Sender: TObject);
begin
  if Trim(mmo1.Text) = '' then
  begin
    ShowMessage('不能保存空数据或使用取消功能！');
    exit;
  end;
  ModalResult:= mrOk;
end;

procedure TfrmNote_Mod29.btnSelectClick(Sender: TObject);
var
  LFrm:TfrmComm_Mod29;
  i:Integer;
begin
  LFrm:= TfrmComm_Mod29.Create(Self);
  try
    LFrm.Caption:= Self.Caption;
    LFrm.GetData('0',4);     //
    LFrm.InitCds();
    if LFrm.ShowModal = mrOk then
    begin
      for i := 1 to 4 do
        mmo1.Lines.Add(LFrm.cds1.FieldByName('名称'+ IntToStr(i)).AsString);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmNote_Mod29.GetData(ARkey: string;AType:Integer);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  LSql:='SELECT * FROM DATA0070 WHERE RKEY = ' + ARkey;
  LCds:= TClientDataSet.Create(Self);
  if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then exit;  
  try
    case AType of
      0:
        mmo1.Lines.Add(LCds.FieldByName('remark1070').AsString);     //交货记事本
      1:
        mmo1.Lines.Add(LCds.FieldByName('remark70').AsString);     //订单记事本
      2:
        mmo1.Lines.Add(LCds.FieldByName('Remark2070').AsString);    //退回原因
    end;
  finally
    LCds.Free;
  end;
end;

end.
