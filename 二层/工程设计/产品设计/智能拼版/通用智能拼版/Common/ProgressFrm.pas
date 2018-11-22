unit ProgressFrm;

interface
uses
  ExtCtrls, Controls, ComCtrls, Buttons, Classes, StdCtrls, CalcParam, Forms,
  IRetIntf, Generics.Collections, SysUtils, CalcHelper;


type
  TParamArr = array of TCutParam;
  TCalcThread = class;
  TfrmProgress = class(TForm)
    pb1: TProgressBar;
    lbl1: TLabel;
    tmr1: TTimer;
    procedure tmr1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FParamArr: TParamArr;
    FRetList: TList<IRet>;
    FCalcThread: TCalcThread;
    procedure ThreadCalc;
  public
    { Public declarations }
  end;

  TCalcThread = class(TThread)
  private
    FCutParam: TCutParam;
    FRetList: TList<IRet>;
  protected
    procedure Execute;override;
  public
    constructor Create(ACutParam: TCutParam; ARetList: TList<IRet>);
  end;

function ShowProgressFrm(AOwner: TComponent; AParam: TParamArr; RetLst: TList<IRet>): Integer;

implementation

{$R *.dfm}

function ShowProgressFrm(AOwner: TComponent; AParam: TParamArr;RetLst: TList<IRet>): Integer;
var
  frmProgress: TfrmProgress;
begin
  frmProgress := TfrmProgress.Create(AOwner);
  try
    frmProgress.FParamArr := AParam;
    frmProgress.FRetList := RetLst;
    Result := frmProgress.ShowModal;
  finally
    frmProgress.Free;
  end;
end;

procedure TfrmProgress.FormShow(Sender: TObject);
begin
  tmr1.Enabled := True;
end;

procedure TfrmProgress.ThreadCalc;
var
  I: Integer;
  LNowProgress,LMaxProgress: Integer;
begin
  for I := 0 to Length(FParamArr) - 1 do
  begin
    lbl1.Caption := '正在进行：' + FormatFloat('0.00', FParamArr[I].SheetW) + ' X '
      + FormatFloat('0.00', FParamArr[I].SheetH) + ' 大料开料';
    FCalcThread := TCalcThread.Create(FParamArr[I],FRetList);
    while not FCalcThread.Terminated do
    begin
      CalcHelper.GetCutProgress(LNowProgress,LMaxProgress);
      pb1.Max := LMaxProgress;
      pb1.Position := LNowProgress;
      Application.ProcessMessages;
      Sleep(50);;
    end;
    FCalcThread.Free;
  end;
  ModalResult := mrOk;
end;

procedure TfrmProgress.tmr1Timer(Sender: TObject);
begin
  tmr1.Enabled := False;
  ThreadCalc;
end;

{ TCalcThread }

constructor TCalcThread.Create(ACutParam: TCutParam; ARetList: TList<IRet>);
begin
  FCutParam := ACutParam;
  FRetList := ARetList;
  FreeOnTerminate := False;
  inherited Create(False);
end;

procedure TCalcThread.Execute;
begin
  inherited;
  try
    if FCutParam.DoublePnl then
      Cut_AB(FCutParam,FRetList)
    else
      Cut_A(FCutParam,FRetList);
  finally
    Terminate;
  end;
end;

end.
