unit uFAEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons,ConstVar, ComCtrls,common;

type
  TFrmFAEdit = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
     v_close:byte;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFAEdit: TFrmFAEdit;

implementation

uses uDM,uNew,Pick_Item_Single, uEdit2;

{$R *.dfm}

procedure TFrmFAEdit.Button2Click(Sender: TObject);
begin
    Close;
    FormEdit2.Show;

end;

procedure TFrmFAEdit.Button1Click(Sender: TObject);
var
   flag:Integer;
begin

  if Memo1.Text='' then
  begin
   ShowMessage('请输入内容');
    Memo1.SetFocus;
    exit;
  end;
  try

  except
    MessageDlg('保存失败，请检查代码是否重复',mtwarning,[mbok],0);
    exit;
    end;
   close;
   modalresult:=mrok;
   FormEdit2.Show;
end;

end.
