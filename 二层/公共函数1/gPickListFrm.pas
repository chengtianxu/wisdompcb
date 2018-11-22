{*******************************************************}
{                                                       }
{       通用选择窗体                                    }
{                                                       }
{       作者：ChengTX                                   }
{                                                       }
{       时间：2012-06-27 10:47:26                       }
{                                                       }
{*******************************************************}


unit gPickListFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, gDGFram, DBClient, gADODB;

type
  TDSPickListFrmInitData = record
    Field: array of TFieldVisble;
    SqlS:string;
    AdoConn: IADOCON;
  end;

  TDSPickOnGetData = function (AWHERE: string): TDSPickListFrmInitData of object;

  TfrmDSPickList = class(TForm)
    dgF1: TdgF;
    pnl1: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    procedure dgF1btnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dgF1edtFilterKeyPress(Sender: TObject; var Key: Char);
    procedure dgF1dgFDblClick(Sender: TObject);
  private
    FOnGetData: TDSPickOnGetData;
    function GetData(AWhere: string): OleVariant;
    { Private declarations }
  public
    { Public declarations }
    property OnGetData: TDSPickOnGetData read FOnGetData write FOnGetData;
  end;

  function ShowDSPickList(AOwner: TComponent;AOnGetData: TDSPickOnGetData ; out outDS: TClientDataSet): Boolean;

implementation

uses
  gFun;

function ShowDSPickList(AOwner: TComponent;AOnGetData: TDSPickOnGetData ; out outDS: TClientDataSet): Boolean;
var
  frmDSPickList: TfrmDSPickList;
begin
  Result := False;
  if not Assigned(outDS) then Exit;
  frmDSPickList := TfrmDSPickList.Create(AOwner);
  try
    frmDSPickList.dgF1.dsF.DataSet := outDS;
    frmDSPickList.FOnGetData := AOnGetData;
    Result := frmDSPickList.ShowModal = mrOk;
  finally
    FreeAndNil(frmDSPickList);
  end;
end;

{$R *.dfm}

procedure TfrmDSPickList.dgF1btnExitClick(Sender: TObject);
begin
  //dgF1.btnExitClick(Sender);
  ModalResult := mrCancel;
end;

procedure TfrmDSPickList.dgF1dgFDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmDSPickList.dgF1edtFilterKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then ModalResult := mrOk;
end;

procedure TfrmDSPickList.FormShow(Sender: TObject);
begin
  dgF1.GetData := GetData;
  dgF1.btnFreshClick(nil);
end;

function TfrmDSPickList.GetData(AWhere: string): OleVariant;
var
  LSQL: IADOSQL;
  LParam: TDSPickListFrmInitData;
  tmpDS: TClientDataSet;
begin
  LSQL := TADOSQL.Create;
  if Assigned(FOnGetData) then
  begin
    tmpDS := TClientDataSet.Create(nil);
    try
      LParam := FOnGetData(AWhere);
      dgF1.SetField(LParam.Field);
      if CallC(LSQL.SQLGetData(LParam.AdoConn,LParam.SqlS,tmpDS)) then
        Result := tmpDS.Data;
    finally
      tmpDS.Free;
    end;
  end;
end;

end.
