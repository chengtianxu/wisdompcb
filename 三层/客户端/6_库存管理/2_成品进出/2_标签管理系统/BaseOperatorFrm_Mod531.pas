unit BaseOperatorFrm_Mod531;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrm, Vcl.ExtCtrls, Bde.DBTables, Datasnap.DBClient;

type
  TfrmBaseOperator_Mod531 = class(TfrmBase)
    pnlDisplay: TPanel;
    UpdateSQL1: TUpdateSQL;
  private
    { Private declarations }
  public
    { Public declarations }
    function DecodeTagInfo(ATagIDArr: TArray<string>;var outCds: TClientDataSet; var ErrorTagID: TArray<string>): Boolean;overload;virtual;
    function DecodeTagInfo(ADBName: string;ATagIDArr: TArray<string>;var outCds: TClientDataSet; var ErrorTagID: TArray<string>): Boolean;overload;virtual;
  end;


implementation

uses
  uCommFunc;

{$R *.dfm}



{ TfrmBaseOperator_Mod531 }

function TfrmBaseOperator_Mod531.DecodeTagInfo(ATagIDArr: TArray<string>;
  var outCds: TClientDataSet;var ErrorTagID: TArray<string>): Boolean;
begin
  Result := DecodeTagInfo(gVar.SvrDB,ATagIDArr,outCds,ErrorTagID);
end;

function TfrmBaseOperator_Mod531.DecodeTagInfo(ADBName: string;
  ATagIDArr: TArray<string>; var outCds: TClientDataSet;
  var ErrorTagID: TArray<string>): Boolean;
var
  LSql: string;
  I: Integer;
  LTagArr: string;
  LIndex: Integer;
  LS: TStringList;
  LData: OleVariant;
  LErrorMsg: string;
begin
  SetLength(ErrorTagID,0);
  LTagArr := '-1';
  for I := 0 to Length(ATagIDArr) -1 do
    LTagArr := LTagArr + ',' + ATagIDArr[I];

  LSql := UpdateSQL1.DeleteSQL.Text;
  LSql := StringReplace(LSql,':TagIDArr',QuotedStr(LTagArr),[rfReplaceAll, rfIgnoreCase]);
  Result := gSvrIntf.IntfGetDataBySql(LSql,LData,LErrorMsg,ADBName,'公共基础');
  if not Result then
  begin
    ShowMessage(LErrorMsg);
    Exit;
  end;
  if Result then
  begin
    outCds.Data := LData;
    if outCds.RecordCount <> Length(ATagIDArr) then
    begin
      outCds.DisableControls;
      LS := TStringList.Create;
      try
        for I := 0 to Length(ATagIDArr) - 1 do
        begin
          LS.Add(ATagIDArr[I]);
        end;

        outCds.First;
        while not outCds.Eof do
        begin
          LIndex := LS.IndexOf(outCds.FieldByName('标签ID').AsString);
          if LIndex <> -1 then
          begin
            LS.Delete(LIndex);
          end;
          outCds.Next;
        end;

        if LS.Count > 0 then
          ErrorTagID := LS.ToStringArray;
      finally
        outCds.EnableControls;
        LS.Free;
      end;
      ShowMessage('有无法解析的标签ID');
    end;
  end;
end;

end.
