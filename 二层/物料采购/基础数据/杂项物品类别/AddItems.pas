unit AddItems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrmAddItems = class(TForm)
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAddItems: TFrmAddItems;

implementation
uses Main;

{$R *.dfm}

procedure TFrmAddItems.BitBtn6Click(Sender: TObject);
begin
  if Trim(edit1.text)='' then exit;
  try
    with FrmMain.ADOData0075 do
    begin
      append;
      fieldbyname('Description').asstring:=edit1.text;
      post;
    end;
  except
    FrmMain.ADOData0075.delete;
    messagedlg('请检查是否杂项物品类别名称重复！',mtinformation,[mbok],0);
    exit;
  end;
  close;
end;

procedure TFrmAddItems.BitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TFrmAddItems.BitBtn1Click(Sender: TObject);
begin
  if Trim(edit1.text)='' then exit;
  try
    with FrmMain.ADOData0075 do
    begin
      append;
      fieldbyname('Description').asstring:=edit1.text;
      post;
    end;
  except
    messagedlg('请检查是否杂项物品类别名称重复！',mtinformation,[mbok],0);
    exit;
  end;
  edit1.Text :='';
end;

end.
