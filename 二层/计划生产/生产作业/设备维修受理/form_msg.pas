unit form_msg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tfrm_msg = class(TForm)
    Label_Msg: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    ResultValue:   Integer;
    { Private declarations }
  public
    { Public declarations }
  end;
Function Show_Msg(AOwnerForm:TForm; Msg:string;ButtonCaption:array of String):Integer;

var
  frm_msg: Tfrm_msg;

implementation

{$R *.dfm}

Function Show_Msg(AOwnerForm:TForm; Msg:string;ButtonCaption:array of String):Integer;
var
  I:Integer;
  B_IsDisplay :Boolean;
begin
  Result:=0;
  try  
    frm_msg:=Tfrm_msg.Create(Application);
    frm_msg.Font.Size    := AOwnerForm.Font.Size;
    frm_msg.Font.Charset := AOwnerForm.Font.Charset;
    frm_msg.Font.Name    := AOwnerForm.Font.Name;
    frm_msg.Label_Msg.Caption:=  Msg;
    frm_msg.ResultValue:=0;
    frm_msg.ShowModal;
    Result:=frm_msg.ResultValue;
  finally

  end;
end;

procedure Tfrm_msg.Button1Click(Sender: TObject);
begin
  ResultValue:=1;
end;

procedure Tfrm_msg.Button2Click(Sender: TObject);
begin
  ResultValue:=2;
end;

procedure Tfrm_msg.Button3Click(Sender: TObject);
begin
  ResultValue:=3;
end;

end.
