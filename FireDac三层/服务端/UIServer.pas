unit UIServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.IniFiles,System.Generics.Collections;

type
  TfrmServerUI = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TButton;
    lbl3: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServerUI: TfrmServerUI;

implementation
uses
  Container, Method;

{$R *.dfm}

procedure TfrmServerUI.btn1Click(Sender: TObject);
var
  LIni: TIniFile;
  Llst: TStringList;
  I: Integer;
  Lerr: OleVariant;
begin
  Llst := TStringList.Create;
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'DBCon.ini');
  try
    LIni.ReadSections(Llst);
    with TSvrMethods.Create do
    begin
      for I := 0 to Llst.Count - 1 do
      begin
        if not Intf_RefreshSqlBuffer(Llst[I],Lerr) then
          lbl3.Caption := (VarToStr(Lerr));
          //ShowMessage(VarToStr(Lerr));
      end;
      Free;
    end;
    lbl3.Caption := 'Refresh OK  ' + DateTimeToStr(Now);
  finally
    Llst.Free;
    lini.Free;
  end;
end;

procedure TfrmServerUI.FormShow(Sender: TObject);
begin
  btn1Click(btn1);
end;

end.
