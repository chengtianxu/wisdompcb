unit dig_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm_add = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
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
uses main,damo;
{$R *.dfm}

procedure TForm_add.Button1Click(Sender: TObject);
begin
if trim(combobox1.Text)='' then exit;
if trim(edit1.Text)='' then exit;
dm.ADOQuery1.MoveBy(combobox1.ItemIndex+1-dm.ADOQuery1.RecNo);
with dm.ADOQuery2 do
begin
 append;
 fieldbyname('grp_ptr').AsInteger:=dm.ADOQuery1.fieldbyname('rkey').AsInteger;
 fieldbyname('description').AsString:=edit1.Text;
 post;
end;
self.Close;
end;

procedure TForm_add.Button2Click(Sender: TObject);
begin
self.close;
end;

end.
