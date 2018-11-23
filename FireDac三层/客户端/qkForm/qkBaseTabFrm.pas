unit qkBaseTabFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseFrm, RzTabs, Vcl.ExtCtrls, RzPanel, qkBaseMainFrm,
  FireDAC.Stan.Param, FireDAC.Comp.Client, System.Generics.Collections, qkSvrIntf.ClientIntf,
  qkFunc.Commfunc;

type
  TqkMainFrmClass = class of TfrmqkBaseMain;
  TfrmqkTabFormbase = class(TfrmqkBase)
    pnlBase: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FMainFrm: TfrmqkBaseMain;
  public
    { Public declarations }
    FModDs: TFDMemTable;
    procedure InitFram(AModID: Int64;AfrmClass: TqkMainFrmClass);virtual;
  end;

implementation

{$R *.dfm}




procedure TfrmqkTabFormbase.FormCreate(Sender: TObject);
begin
  inherited;
  FModDs := TFDMemTable.Create(Self);
end;

procedure TfrmqkTabFormbase.InitFram(AModID: Int64;AfrmClass: TqkMainFrmClass);
const
  SQLNAME = 'Mod.GetMod';
var
  Lpms: TFDParams;
  LdsList: TList<TFDMemTable>;
begin
  LdsList := nil;

  Lpms := TFDParams.Create;
  with Lpms.Add do
  begin
    Name := 'p1';
    Value := AModID;
  end;
  try
  try
    LdsList := dmSvrIntf.SqlOpen(SQLNAME,Lpms);
    if LdsList = nil then
      Exit;
    FModDs.Data := ldslist[0].Data;
    FMainFrm := AfrmClass.Create(self);
    FMainFrm.ModID := AModID;
    FMainFrm.InitMainFrm(AModID,FModDs.FieldByName('MainSqlIDKey').AsLargeInt);
    FMainFrm.pnlbase.Parent := TWinControl(Self.Owner);

  except
    on E: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
  finally
    Lpms.Free;
    qkCommfunc.ReleaseDsList(LdsList);
  end;
  //pnlBase.Parent := TWinControl(Self.Owner);
end;

end.
