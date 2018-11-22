unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    BitBtn1: TBitBtn;
    Button2: TButton;
    Button3: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo, voucher_report, ufrmGl, ufrmDetail,common;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Form_voucherreport:=tForm_voucherreport.Create(application);
Form_voucherreport.ppReport1.Reset;
Form_voucherreport.ppReport1.Template.FileName :=
  stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
    'VOUCHER_REPORT.rtm';  //D:\SJSYS\NIERP\REPORT\VOUCHER_REPORT.rtm
Form_voucherreport.ppReport1.Template.LoadFromFile;
Form_voucherreport.ppReport1.SaveAsTemplate:=true;
Form_voucherreport.ppDesigner1.ShowModal;
Form_voucherreport.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
 if not App_Init(dm.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;
  end;
  self.Caption :=Application.Title;
end;
//总帐
procedure TForm1.Button2Click(Sender: TObject);
begin
 frmGL:=TfrmGL.Create(application);

frmGL.ppReport1.Reset;
frmGL.ppReport1.Template.FileName :=
  stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
    'glrpt.rtm';
frmGL.ppReport1.Template.LoadFromFile;
frmGL.ppReport1.SaveAsTemplate:=true;

 frmGL.ppDesigner1.ShowModal;
 frmGL.Free;
end;
//明细帐
procedure TForm1.Button3Click(Sender: TObject);
begin
 frmDetail:=TfrmDetail.Create(application);
frmDetail.ppReport1.Reset;
frmDetail.ppReport1.Template.FileName :=
  stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
    'DetailRpt.rtm';      //R:\NIERP\Report\DetailRpt.rtm
frmDetail.ppReport1.Template.LoadFromFile;
frmDetail.ppReport1.SaveAsTemplate:=true;

 frmDetail.ppDesigner1.ShowModal;
 frmDetail.Free;
end;

end.
