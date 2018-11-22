unit PasMulti_so;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm,ucommfunc, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask;

type
  TfrmMulti_so = class(TfrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    set_qty:Integer;
  end;

var
  frmMulti_so: TfrmMulti_so;

implementation

{$R *.dfm}

procedure TfrmMulti_so.Edit1Exit(Sender: TObject);
begin
  if trim(edit1.Text)='' then edit1.Text:='0';
end;

procedure TfrmMulti_so.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort;
end;

procedure TfrmMulti_so.Edit2Exit(Sender: TObject);
begin
  if trim(edit2.Text)='' then edit2.Text:='1';
end;

procedure TfrmMulti_so.Edit3Exit(Sender: TObject);
begin
  if trim(edit3.Text)='' then edit3.Text:='0';
   edit4.Text:=inttostr(strtoint(edit3.Text)*set_qty);
end;

procedure TfrmMulti_so.Edit4Exit(Sender: TObject);
begin
 if edit4.Text='' then edit4.Text:='0';   //数量pcs
  if (strtoint(edit4.Text) mod set_qty) <> 0 then
  begin
    if messagedlg('订单数量pcs不是出货板数set的倍数,是否继续?',mtconfirmation,[mbYes,mbNo],0)=mryes then
     edit3.Text:=inttostr(round(strtoint(edit4.Text)/set_qty))
    else
     edit4.SetFocus;
  end
  else
   edit3.Text:=floattostr(strtoint(edit4.Text)/set_qty);
end;

end.
