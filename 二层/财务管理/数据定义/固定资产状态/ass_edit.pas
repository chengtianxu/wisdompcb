unit ass_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm_edit = class(TForm)
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
  Form_edit: TForm_edit;

implementation

uses main,damo;
{$R *.dfm}

procedure TForm_edit.Button1Click(Sender: TObject);
begin
 if Trim(edit1.text)='' then exit;
  try
   dm.ADOConnection1.BeginTrans;
    with dm.ADOQuery1 do
    begin
      edit;
       dm.ADOQuery1IN_DEPRECIATION.Value:=self.RadioGroup1.ItemIndex;
      fieldbyname('FASSET_status').asstring:=edit1.text;
      post;
    end;
    dm.ADOConnection1.CommitTrans;
  except
    dm.ADOConnection1.RollbackTrans;
    dm.ADOQuery1.Cancel;
    messagedlg('请检查是否资产增减方式名称重复！',mtinformation,[mbok],0);
    exit;
  end;
  close;
end;

procedure TForm_edit.Button2Click(Sender: TObject);
begin
close;
end;

end.
