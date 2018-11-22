unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses unit1;
{$R *.dfm}

procedure TForm2.DBGrid1DblClick(Sender: TObject);
begin
 modalresult:=mrok;
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
 frmmain.adodataset1.Filter := dbgrid1.Columns[0].FieldName+
  ' like '''+trim(edit1.Text)+'%'''
else
 frmmain.adodataset1.Filter :='';
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
 label1.Caption:=dbgrid1.Columns[0].Title.caption;
end;

end.
