unit Frm_fileEdt_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrm_fileEdt = class(TForm)
    Label1: TLabel;
    EdtFName: TEdit;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    EdtFVer: TEdit;
    Label3: TLabel;
    EdtCrMan: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    OpenDialog1: TOpenDialog;
    MemScript: TMemo;
    Label4: TLabel;
    procedure EdtFVerKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
     M: TMemoryStream;
  end;



implementation

{$R *.dfm}

procedure TFrm_fileEdt.EdtFVerKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in  ['0'..'9',#8]) then abort;
end;

procedure TFrm_fileEdt.FormCreate(Sender: TObject);
begin
  M:=TMemoryStream.Create;
end;

procedure TFrm_fileEdt.SpeedButton1Click(Sender: TObject);
var i:integer;
    s:string;
begin
  if OpenDialog1.Execute then
  begin
    for i:=length(OpenDialog1.FileName) downto 1 do
    begin
      if  OpenDialog1.FileName[i]<>'\' then
         s:=OpenDialog1.FileName[i]+s
      else
         break;
    end;
    M.Clear;
    M.LoadFromFile(OpenDialog1.FileName);
    if M.Size>25*1024*1024 then
    begin
      M.Clear;
      showmessage('文件大小不能超过25M,请重新整理文件再保存...');
      exit;
    end;
    EdtFName.Text:=s;
    if EdtFVer.Text='' then  EdtFVer.Text:='1';
  end;
end;

procedure TFrm_fileEdt.BitBtn1Click(Sender: TObject);
begin
  if trim(EdtFName.Text)='' then
  begin
    showmessage('文件名称不能为空...');
    abort;
  end;
  if trim(EdtFVer.Text)='' then
  begin
    showmessage('文件版本不能为空...');
    abort;
  end;
  ModalResult:=mrok;
end;

end.
