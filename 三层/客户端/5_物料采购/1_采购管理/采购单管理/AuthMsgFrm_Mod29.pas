unit AuthMsgFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,uBaseFrm;

type
  TfrmAuthMsg_Mod29 = class(TfrmBase)
    pnl1: TPanel;
    pnl2: TPanel;
    btnClose: TBitBtn;
    ehAuthMsg: TDBGridEh;
    cds78: TClientDataSet;
    ds78: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(ARkey:string);
  end;

var
  frmAuthMsg_Mod29: TfrmAuthMsg_Mod29;

implementation

uses uCommFunc;
{$R *.dfm}

{ TfrmAuthMsg_Mod29 }

procedure TfrmAuthMsg_Mod29.GetData(ARkey: string);
begin
  if gSvrIntf.IntfGetDataBySql(cds78.CommandText + ' WHERE po_ptr = ' + ARkey ,cds78) then exit;
end;

end.
