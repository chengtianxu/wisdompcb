unit PackPrintfrm_SanDiDaYan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePackPrintFrm_525, Bde.DBTables,
  frxClass, frxDBSet, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, Vcl.Grids, Vcl.ValEdit, Vcl.ExtCtrls, frxDesgn;

type
  TfrmPackPrint_SanDiDaYan = class(TfrmBasePackPrint_525)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BeforeSaveToDB; override;
  end;

var
  frmPackPrint_SanDiDaYan: TfrmPackPrint_SanDiDaYan;

implementation

uses
  uCommFunc,System.StrUtils;


{$R *.dfm}

{ TfrmPackPrint_SanDiDaYan }

procedure TfrmPackPrint_SanDiDaYan.BeforeSaveToDB;
var
  LSql: string;
  LCds: TClientDataSet;
  LFlowNo: Integer;
begin
  inherited;
  LFlowNo := 1;
  LSql := 'select top 1 * from pack_printMain where PackID = ' + IntToStr(FPackID) +
          //' AND FlowBy = ' + QuotedStr(vePackInfo.Values['周期年月']) +
          ' order by rkey Desc';
  LCds := TClientDataSet.Create(Self);
  try
    if gSvrIntf.IntfGetDataBySql(LSql,LCds) then
    begin
      if LCds.IsEmpty or (LCds.FieldByName('FLowNo').AsString = '') then
      begin
        LFlowNo := 1;
      end else
      begin
        LFlowNo := LCds.FieldByName('FLowNo').AsInteger + 1;
      end;
    end;
    cdsPrintMain.First;
    while not cdsPrintMain.Eof do
    begin
      cdsPrintMain.Edit;
      //cdsPrintMain.FieldByName('Flowby').AsString := vePackInfo.Values['周期年月'];
      cdsPrintMain.FieldByName('FLowNo').AsString := RightStr('00000' + IntToStr(LFlowNo),5);
      cdsPrintMain.Post;
      Inc(LFlowNo);
      cdsPrintMain.Next;
    end;
  finally
    LCds.Free;
  end;
end;



end.
