unit PackPrintFrm_SanDiHOTYI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePackPrintFrm_525, Bde.DBTables,
  frxClass, frxDBSet, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, Vcl.Grids, Vcl.ValEdit, Vcl.ExtCtrls, frxDesgn;

type
  TfrmPackReportFrm_SanDiHOTYI = class(TfrmBasePackPrint_525)
    mmoSql: TMemo;
    procedure edtWOBarKeyPress(Sender: TObject; var Key: Char);
    procedure vePackInfoValidate(Sender: TObject; ACol, ARow: Integer;
      const KeyName, KeyValue: string);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetWOInfoDS(ACds: TClientDataSet): Boolean;override;
    procedure BeforeSaveToDB; override;
  end;

implementation

uses
  uCommFunc, System.DateUtils;

{$R *.dfm}

procedure TfrmPackReportFrm_SanDiHOTYI.BeforeSaveToDB;
var
  LParamID: Integer;
begin
  inherited;
//@Q60
  //if FPackType = 0 then
  begin
    if cdsPackType.Locate('ParamName','客户二维码',[loCaseInsensitive]) then
    begin
      LParamID := cdsPackType.FieldByName('ParamID').AsInteger;

      vePackInfo.Values['客户二维码'] :=
        '[)>@06@12S0002' +
        '@P'+ vePackInfo.Values['客户物料号'] +
        '@1P'+ vePackInfo.Values['本厂编号'] +
        '@31P@12VWuzhu@10V@2P@20P' +
        '@6D' + vePackInfo.Values['制造日期'] +
        '@14D' + vePackInfo.Values['有效期'] +
        '@30PY@ZN@K@16K@V@3S' +
        '@Q' + vePackInfo.Values['PCS数量'] + 'NAR000@20T' +
        '@1T ' + vePackInfo.Values['配料单号'] + '@2T@1Z@@';


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

procedure TfrmPackReportFrm_SanDiHOTYI.edtWOBarKeyPress(Sender: TObject;
  var Key: Char);
var
  LFM: TFormatSettings;
  Y,M,D: string;
  Ldt: TDateTime;
begin
  inherited;
  if Key =#13 then
  begin
    vePackInfo.Values['制造日期'] := FormatDateTime('yyyymmdd',now());

    Y := copy(vePackInfo.Values['制造日期'],1,4);
    M := copy(vePackInfo.Values['制造日期'],5,2);
    D := Copy(vePackInfo.Values['制造日期'],7,2);

    LFM.ShortDateFormat := 'yyyy-mm-dd';
    LFM.DateSeparator := '-';
    ldt := IncMonth(StrToDate(Y+'-'+M+'-'+D,LFM),6);


    vePackInfo.Values['有效期'] := FormatDateTime('yyyymmdd',ldt);
    vePackInfo.Values['配料单号'] := vePackInfo.Values['配料单号'].Split(['-'])[0];
  end;
end;

function TfrmPackReportFrm_SanDiHOTYI.GetWOInfoDS(
  ACds: TClientDataSet): Boolean;

begin
  UpdateSQL1.DeleteSQL.Assign(mmoSql.Lines);
  Result := inherited GetWOInfoDS(ACds);
  if Result then
  begin
    if ACds.IsEmpty then Exit;

    if ACds.FieldByName('客户代码').AsString <> '7328' then
    begin
      Result := False;
      ShowMessage('请登录香港系统打印');
      Exit;
    end;

  end;
end;

procedure TfrmPackReportFrm_SanDiHOTYI.vePackInfoValidate(Sender: TObject; ACol,
  ARow: Integer;const KeyName, KeyValue: string);
var
  LFM: TFormatSettings;
  Y,M,D: string;
  Ldt: TDateTime;
begin
  inherited;
  if KeyName = '制造日期' then
  begin
    Y := copy(vePackInfo.Values['制造日期'],1,4);
    M := copy(vePackInfo.Values['制造日期'],5,2);
    D := Copy(vePackInfo.Values['制造日期'],7,2);

    LFM.ShortDateFormat := 'yyyy-mm-dd';
    LFM.DateSeparator := '-';
    ldt := IncMonth(StrToDate(Y+'-'+M+'-'+D,LFM),6);


    vePackInfo.Values['有效期'] := FormatDateTime('yyyymmdd',ldt);
  end;
end;

end.
