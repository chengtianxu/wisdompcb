unit forpro_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DB, DBGrids;

type
  TForm_forpro = class(TForm)
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
    Edit2: TEdit;
    Edit1: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit8: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    Edit9: TEdit;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_forpro: TForm_forpro;

implementation

{$R *.dfm}
uses damo;

procedure TForm_forpro.BitBtn2Click(Sender: TObject);
begin
self.Close;
end;

end.
