unit rep_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  Trep_form = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rep_form: Trep_form;

implementation
uses main;
{$R *.dfm}

procedure Trep_form.DBGrid1DblClick(Sender: TObject);
begin
if not FrmMain.Ado009.IsEmpty then
 ModalResult:=mrok;
end;

procedure Trep_form.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
   FrmMain.Ado009.Filter :='rep_code like '''+Trim(Edit1.Text)+'%'''
  else
   FrmMain.Ado009.filter:='';
if FrmMain.Ado009.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;   
end;

procedure Trep_form.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure Trep_form.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not FrmMain.Ado009.IsEmpty) then
 ModalResult:=mrok;
end;

end.
