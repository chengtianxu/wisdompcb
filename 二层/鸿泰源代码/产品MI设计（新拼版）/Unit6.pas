unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm6 = class(TForm)
    btn1: TButton;
    mmo1: TMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation
uses
  damo;

{$R *.dfm}

procedure TForm6.btn1Click(Sender: TObject);
begin
         DM.qry1.Close;
         DM.qry1.Open;
         dm.qry1.Append;
         DM.qry1.FieldValues['tdatetime']:= FormatDateTime('YYYY-MM-DD hh:nn:ss',Now());
        dm.qry1.FieldValues['ttype']:='ÕÀªÿ –≥°';
        dm.qry1.FieldValues['cust_ptr']:=lbl3.Caption;
        dm.qry1.FieldValues['NOTE_INFO']:=Mmo1.Text;
        dm.qry1.FieldValues['EMPL_PTR']:=lbl4.Caption;
        DM.qry1.Post;
        Close;
end;

end.
