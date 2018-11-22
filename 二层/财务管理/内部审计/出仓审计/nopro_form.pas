unit nopro_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB;

type
  TForm_nopro = class(TForm)
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit8: TEdit;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit9: TEdit;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_nopro: TForm_nopro;

implementation

uses damo;
{$R *.dfm}

procedure TForm_nopro.BitBtn2Click(Sender: TObject);
begin
self.Close;
end;

end.
