unit IES_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  TForm_ies = class(TForm)
    Edit1: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    aq278: TADOStoredProc;
    aq278rkey: TIntegerField;
    aq278PARAMETER_NAME: TStringField;
    aq278PARAMETER_DESC: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ies: TForm_ies;

implementation
uses damo;
{$R *.dfm}

procedure TForm_ies.BitBtn1Click(Sender: TObject);
begin
 edit1.Text :='';
 edit1.SetFocus;
end;

procedure TForm_ies.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
 aq278.Filter :='parameter_name like '''+trim(edit1.Text)+'%'''
else
 aq278.Filter :='';
if aq278.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_ies.DBGrid1DblClick(Sender: TObject);
begin
if not aq278.IsEmpty then
 ModalResult:=mrok;
end;

procedure TForm_ies.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not aq278.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_ies.FormCreate(Sender: TObject);
begin
 aq278.Open;
end;

end.

