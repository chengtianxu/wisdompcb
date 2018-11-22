unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmMain = class(TForm)
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TBitBtn;
    btn6: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  TagReadFrm, TagCompareFrm, PrintFrm, CmpFrmNew, TagInfo;

{$R *.dfm}

procedure TfrmMain.btn1Click(Sender: TObject);
begin
  ShowFrmTagRead(Self);
end;

procedure TfrmMain.btn2Click(Sender: TObject);
begin
  ShowFrmbarComp(Self);
end;

procedure TfrmMain.btn3Click(Sender: TObject);
begin
  with TfrmPrint.Create(Self) do
  begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TfrmMain.btn4Click(Sender: TObject);
var
  LFrm: TfrmCmpNew;
begin
  LFrm := TfrmCmpNew.Create(Self);
  try
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.btn5Click(Sender: TObject);
var
  LStr: string;
begin
  LStr := '1: 普通人员 ' + #13 +
          '2：打印ASN仓库人员 ' + #13 +
          '4: 品质专项 ' + #13 +
          '3：暂留不要开' + #13+
          '5: OQC解锁 需手动添加';
  ShowMessage(LStr);
end;

procedure TfrmMain.btn6Click(Sender: TObject);
var
  LFrm: TfrmTagInfo;
begin
  LFrm := TfrmTagInfo.Create(Self);
  try
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

end.
