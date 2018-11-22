unit dig_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm_edit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
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
 if trim(combobox1.Text)='' then exit;
  if trim(edit1.text)='' then exit;
  dm.ADOQuery1.MoveBy(combobox1.ItemIndex+1-dm.ADOQuery1.RecNo);
  with dm.ADOQuery2 do
  begin
   edit;
   fieldbyname('grp_ptr').AsString:=dm.ADOQuery1.fieldbyname('rkey').AsString;
   fieldbyname('description').AsString:=edit1.Text;
   post;
  end;
  self.Close;
end;

procedure TForm_edit.Button2Click(Sender: TObject);
begin
self.Close ;
end;

end.
