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
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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

procedure TForm2.DBGrid1TitleClick(Column: TColumn);
begin
label1.Caption := column.Title.Caption+'£º';
with form1.ADOStoredProc1 do
begin
 Close;
 parameters.ParamByName('@order').Value := column.Index;
 open;
end;
edit1.SetFocus;
end;

procedure TForm2.DBGrid1DblClick(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin

if form1.ADOStoredProc1.Parameters.ParamByName('@order').Value = 0 then
 if trim(edit1.Text)='' then
   form1.ADOStoredProc1.Filter := ''
  else
   form1.ADOStoredProc1.Filter := 'cust_code like '''+trim(edit1.Text)+'%'''
else
 if trim(edit1.Text)='' then
   form1.ADOStoredProc1.Filter := ''
  else
   form1.ADOStoredProc1.Filter := 'abbr_name like '''+trim(edit1.Text)+'%''';

end;

end.
