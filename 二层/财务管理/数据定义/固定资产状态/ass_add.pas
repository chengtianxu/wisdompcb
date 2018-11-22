unit ass_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm_add = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
     private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_add: TForm_add;

implementation

{$R *.dfm}
uses damo,main;



procedure TForm_add.Button1Click(Sender: TObject);
begin
if Trim(edit1.text)='' then exit;
  try
    with dm.ADOQuery1 do
    begin
      append;
      dm.ADOQuery1IN_DEPRECIATION.Value:=self.RadioGroup1.ItemIndex;
      fieldbyname('FASSET_status').asstring:=edit1.text;
      post;
    end;
  except
   dm.ADOQuery1.Delete;
    messagedlg('请检查是否资产增减方式名称重复！',mtinformation,[mbok],0);
    exit;
  end;
  close;
end;

procedure TForm_add.Button2Click(Sender: TObject);
begin
close;
end;

end.
