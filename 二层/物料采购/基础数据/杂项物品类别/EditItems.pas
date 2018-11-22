unit EditItems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrmEditItems = class(TForm)
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEditItems: TFrmEditItems;

implementation
uses Main;

{$R *.dfm}

procedure TFrmEditItems.BitBtn6Click(Sender: TObject);
begin
  if Trim(edit1.text)='' then exit;
  try
    FrmMain.ADOConnection1.BeginTrans;
    with FrmMain.ADOData0075 do
    begin
      edit;
      fieldbyname('Description').asstring:=edit1.text;
      post;
    end;
    FrmMain.ADOConnection1.CommitTrans;
  except
    FrmMain.ADOConnection1.RollbackTrans;
    FrmMain.ADOData0075.Cancel;
    messagedlg('请检查是否杂项物品类别名称重复！',mtinformation,[mbok],0);
    exit;
  end;
  close;
end;

procedure TFrmEditItems.BitBtn5Click(Sender: TObject);
begin
  close;
end;

end.
