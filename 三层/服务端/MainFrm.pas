{*******************************************************}
{                                                       }
{       Chengtx                                         }
{                                                       }
{       版权所有 (C) 2016 5.17                          }
{                                                       }
{*******************************************************}


unit MainFrm;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls,Vcl.ExtCtrls, DM, Vcl.StdCtrls,
  Vcl.Menus, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  Vcl.Samples.Spin;

type
  TfrmMain = class(TForm)
    mm1: TMainMenu;
    mniN1: TMenuItem;
    mniLoadAllEng: TMenuItem;
    mniN3: TMenuItem;
    mniN4: TMenuItem;
    mniN5: TMenuItem;
    mniEngLoad: TMenuItem;
    mniEngStart: TMenuItem;
    mniEngStop: TMenuItem;
    mniEngUnLoad: TMenuItem;
    pm1: TPopupMenu;
    mniCloseConnect: TMenuItem;
    cdsEng: TClientDataSet;
    dsEng: TDataSource;
    strngfldEngEngName: TStringField;
    lrgntfldEngAllCallCount: TLargeintField;
    intgrfldEngIntfGetDataBySql: TIntegerField;
    intgrfldEngIntfPostDataByTable: TIntegerField;
    intgrfldEngIntfGetDataBySqlArr: TIntegerField;
    intgrfldEngIntfPostDataBySqlArr: TIntegerField;
    intgrfldEngIntfPostModData: TIntegerField;
    intgrfldEngIntfspGetDataByID: TIntegerField;
    intgrfldEngIntfspExecByID: TIntegerField;
    intgrfldEngHandle: TIntegerField;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    eh2: TDBGrid;
    eh1: TDBGrid;
    pnl1: TPanel;
    lbl1: TLabel;
    lblConNum: TLabel;
    btnRefreshUser: TButton;
    pnl3: TPanel;
    btnRefreshEng: TButton;
    lbl2: TLabel;
    seMaxCon: TSpinEdit;
    mniN6: TMenuItem;
    mniN7: TMenuItem;
    mniRefreshDB: TMenuItem;
    procedure mniLoadAllEngClick(Sender: TObject);
    procedure mniN4Click(Sender: TObject);
    procedure mniN5Click(Sender: TObject);
    procedure mniN3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mniEngLoadClick(Sender: TObject);
    procedure mniEngStartClick(Sender: TObject);
    procedure mniEngStopClick(Sender: TObject);
    procedure mniEngUnLoadClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure mniCloseConnectClick(Sender: TObject);
    procedure btnRefreshUserClick(Sender: TObject);
    procedure btnRefreshEngClick(Sender: TObject);
    procedure seMaxConChange(Sender: TObject);
    procedure mniRefreshDBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses
  ServerContainerUnit1, IdTCPConnection;

{$R *.dfm}

procedure TfrmMain.btnRefreshEngClick(Sender: TObject);
begin
  System.TMonitor.Enter(dm1.cdsSvrEng);
  try
    cdsEng.Data := dm1.cdsSvrEng.Data;
  finally
    System.TMonitor.Exit(dm1.cdsSvrEng);
  end;
end;

procedure TfrmMain.btnRefreshUserClick(Sender: TObject);
begin
  ServerContainer1.RefreshUserList;
  lblConNum.Caption := IntToStr(dm1.cdsUser.RecordCount);
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  LEngName: string;
  LItem: TMenuItem;
begin
  for LEngName in dm1.FEngNameLS do
  begin
    //加载
    LItem := TMenuItem.Create(mniEngLoad);
    LItem.Caption := LEngName;
    LItem.OnClick := mniEngLoadClick;
    mniEngLoad.Add(LItem);
    //开始
    LItem := TMenuItem.Create(mniEngStart);
    LItem.Caption := LEngName;
    LItem.OnClick := mniEngStartClick;
    mniEngStart.Add(LItem);
    //停止
    LItem := TMenuItem.Create(mniEngStop);
    LItem.Caption := LEngName;
    LItem.OnClick := mniEngStopClick;
    mniEngStop.Add(LItem);
    //卸载
    LItem := TMenuItem.Create(mniEngUnLoad);
    LItem.Caption := LEngName;
    LItem.OnClick := mniEngUnLoadClick;
    mniEngUnLoad.Add(LItem);
  end;

  mniLoadAllEngClick(mniLoadAllEng);
  pgc1.ActivePageIndex := 0;
  btnRefreshEngClick(btnRefreshEng);
end;


procedure TfrmMain.mniCloseConnectClick(Sender: TObject);
var
  LCon: TIdTCPConnection;
begin
  LCon := TIdTCPConnection(Pointer(dm1.cdsUser.FieldByName('PConObj').AsInteger));
  ServerContainer1.DisConnectConnection(LCon);
  btnRefreshUserClick(btnRefreshUser);
end;

procedure TfrmMain.mniEngLoadClick(Sender: TObject);
var
  LEngName: string;
begin
  LEngName := (Sender as TMenuItem).Caption;
  dm1.LoadEng(LEngName);
end;

procedure TfrmMain.mniEngStartClick(Sender: TObject);
var
  LEngName: string;
  Ltmp: Integer;
begin
  LEngName := (Sender as TMenuItem).Caption;
  Ltmp := dm1.FEngNameLS.IndexOf(LEngName);
  dm1.FBEngStop[Ltmp] := False;
end;

procedure TfrmMain.mniEngStopClick(Sender: TObject);
var
  LEngName: string;
  Ltmp: Integer;
begin
  LEngName := (Sender as TMenuItem).Caption;
  Ltmp := dm1.FEngNameLS.IndexOf(LEngName);
  dm1.FBEngStop[Ltmp] := True;
end;

procedure TfrmMain.mniEngUnLoadClick(Sender: TObject);
var
  LEngName: string;
begin
  LEngName := (Sender as TMenuItem).Caption;
  dm1.UnloadEng(LEngName);
end;

procedure TfrmMain.mniLoadAllEngClick(Sender: TObject);
begin
  dm1.LoadAllEng;
end;

procedure TfrmMain.mniN3Click(Sender: TObject);
var
  I: Integer;
begin
  dm1.FBAllStop := True;
  for I := 0 to High(dm1.FBEngStop) do
    dm1.FBEngStop[I] := True;
end;

procedure TfrmMain.mniN4Click(Sender: TObject);
begin
  dm1.UnLoadAllEng;
end;

procedure TfrmMain.mniN5Click(Sender: TObject);
var
  I: Integer;
begin
  dm1.FBAllStop := False;
  for I := 0 to High(dm1.FBEngStop) do
    dm1.FBEngStop[I] := False;
end;

procedure TfrmMain.mniRefreshDBClick(Sender: TObject);
begin
  System.TMonitor.Enter(dm1.FDBConStrList);
  try
    dm1.FDBConStrList.Clear;
  finally
    System.TMonitor.Exit(dm1.FDBConStrList);
  end;
end;

procedure TfrmMain.pm1Popup(Sender: TObject);
begin
  mniCloseConnect.Enabled := not dm1.cdsUser.IsEmpty;
end;

procedure TfrmMain.seMaxConChange(Sender: TObject);
begin
  dm1.FMaxConCount := seMaxCon.Value;
end;

end.

