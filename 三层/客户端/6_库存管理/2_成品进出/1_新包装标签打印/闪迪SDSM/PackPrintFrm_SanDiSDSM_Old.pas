unit PackPrintFrm_SanDiSDSM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePackPrintFrm_525, Bde.DBTables,
  frxClass, frxDBSet, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, Vcl.Grids, Vcl.ValEdit, Vcl.ExtCtrls, frxDesgn;

type
  TfrmPackPrint_SanDiSDSM = class(TfrmBasePackPrint_525)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BeforeSaveToDB; override;
  end;

implementation

{$R *.dfm}

procedure TfrmPackPrint_SanDiSDSM.BeforeSaveToDB;
var
  LParamID: Integer;
begin
  inherited;

  if FPackType = 1 then
  begin
    if cdsPackType.Locate('ParamName','客户二维码',[loCaseInsensitive]) then
    begin
      LParamID := cdsPackType.FieldByName('ParamID').AsInteger;

      vePackInfo.Values['客户二维码'] :=

        vePackInfo.Values['客户订单号'] + ';' +
        vePackInfo.Values['SDSM订单行'] + ';' +
        vePackInfo.Values['客户型号'] + ';' +
        vePackInfo.Values['测试成型备注'] + ';' +
        vePackInfo.Values['PCS数量'] + ';' +
        vePackInfo.Values['产地'] + ';' +
        vePackInfo.Values['MSL'] + ';' +
        vePackInfo.Values['周期年月'] + ';' +
        vePackInfo.Values['LotNo'];// + ';' +
        //vePackInfo.Values['毛重'] + ';' +
        //vePackInfo.Values['有效期'];

      cdsPrintDetail.First;
      while not cdsPrintDetail.Eof do
      begin
        if cdsPrintDetail.FieldByName('ParamID').AsInteger = LParamID then
        begin
          cdsPrintDetail.Edit;
          cdsPrintDetail.FieldByName('ParamValue').AsString := vePackInfo.Values['客户二维码'];
          cdsPrintDetail.Post;

        end;

        cdsPrintDetail.Next;
      end;
    end else
      ShowMessage('没找到客户二维码');

  end;

end;

end.
