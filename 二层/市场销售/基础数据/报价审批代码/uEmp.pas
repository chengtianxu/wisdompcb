unit uEmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  TfrmEmp = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmp: TfrmEmp;

implementation

uses uDm;

{$R *.dfm}
procedure TfrmEmp.FormCreate(Sender: TObject);
begin
 if ADOQuery1.Active =false then ADOQuery1.Open ;
end;

procedure TfrmEmp.BitBtn1Click(Sender: TObject);
begin
 edit1.Text :='';
 edit1.SetFocus;
end;

procedure TfrmEmp.Edit1Change(Sender: TObject);
begin
if edit1.Text<>'' then
 adoquery1.Filter := 'user_id like '''+trim(edit1.Text)+'%'''
else
 adoquery1.Filter := '';
end;

procedure TfrmEmp.DBGrid1DblClick(Sender: TObject);
begin
 if not adoquery1.IsEmpty then
  ModalResult := mrok;
end;

procedure TfrmEmp.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then
  ModalResult := mrok;
end;

procedure TfrmEmp.DataSource1DataChange(Sender: TObject; Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
