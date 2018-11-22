unit RecMsgFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Data.DB, Datasnap.DBClient,uBaseFrm;

type
  TfrmRecMsg_Mod29 = class(TfrmBase)
    pnl1: TPanel;
    pnl2: TPanel;
    btnClose: TBitBtn;
    grpPO: TGroupBox;
    grpRec: TGroupBox;
    eh71: TDBGridEh;
    eh1: TDBGridEh;
    cds71: TClientDataSet;
    ds71: TDataSource;
    cds456: TClientDataSet;
    ds456: TDataSource;
    grpVMI: TGroupBox;
    ehVMI: TDBGridEh;
    cdsVMI: TClientDataSet;
    dsVMI: TDataSource;
    procedure cds71AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(ARkey:string);
  end;

var
  frmRecMsg_Mod29: TfrmRecMsg_Mod29;

implementation

uses uCommFunc;

{$R *.dfm}

{ TfrmRecMsg_Mod29 }

procedure TfrmRecMsg_Mod29.cds71AfterScroll(DataSet: TDataSet);
begin
  gSvrIntf.IntfGetDataBySql(cds456.CommandText + ' WHERE data0022.source_ptr = '
              + cds71.FieldByName('rkey').AsString,cds456);

  if (cds71.FieldByName('PO_TYPE').AsString = 'S')
        and (cds71.FieldByName('STATE_INVT_TAX_FLAG').AsString = 'Y')  then
    if not gSvrIntf.IntfGetDataBySql(cdsVMI.CommandText + ' AND data0134.SOURCE_PTR = '
                + cds71.FieldByName('rkey').AsString,cdsVMI) then Exit;
//    ShowMessage(IntToStr(cdsVMI.RecordCount));
end;

procedure TfrmRecMsg_Mod29.GetData(ARkey: string);
begin
  if gSvrIntf.IntfGetDataBySql(cds71.CommandText + ' WHERE Data0071.PO_PTR = '
                  + ARkey,cds71) then Exit;

end;

end.
