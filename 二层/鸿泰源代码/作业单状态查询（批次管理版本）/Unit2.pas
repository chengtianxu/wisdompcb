unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    lbl1: TLabel;
    edt1: TEdit;
    lbl2: TLabel;
    mmo1: TMemo;
    btn1: TButton;
    btn2: TButton;
    lbl3: TLabel;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses damo;

{$R *.dfm}

procedure TForm2.btn2Click(Sender: TObject);
begin
  Close ;
end;

procedure TForm2.btn1Click(Sender: TObject);
begin
   with dm.ADOQuery1 do
    begin
      Close;
      sql.clear;
      SQL.Add('update data0060 set RemarkSO='''+mmo1.text+''' where rkey ='''+lbl3.Caption+''''  );
      ExecSQL;
    end;
   showmessage('更改成功！');
   Close;
end;

end.
