unit shipmeoth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, Buttons;

type
  Tform_shipmethod = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOStoredProc;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_shipmethod: Tform_shipmethod;

implementation
uses damo;
{$R *.dfm}

procedure Tform_shipmethod.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 ModalResult:=mrok;
end;

procedure Tform_shipmethod.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure Tform_shipmethod.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Adoquery1.Filter :='code like '''+Trim(Edit1.Text)+'%'''
 else
  Adoquery1.filter:='';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;  
end;

procedure Tform_shipmethod.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure Tform_shipmethod.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
end;

end.
