unit uBaseGY;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  TfrmBaseGY = class(TForm)
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
  private
    OldGridWnd : TWndMethod;
    procedure NewGridWnd(var Message: TMessage);
  public
    { Public declarations }
  end;

var
  frmBaseGY: TfrmBaseGY;

implementation

uses uDm;

{$R *.dfm}
procedure TfrmBaseGY.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;
procedure TfrmBaseGY.FormCreate(Sender: TObject);
begin
 if ADOQuery1.Active =false then ADOQuery1.Open ;
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;
procedure TfrmBaseGY.BitBtn1Click(Sender: TObject);
begin
 edit1.Text :='';
 edit1.SetFocus;
end;

procedure TfrmBaseGY.Edit1Change(Sender: TObject);
begin
if edit1.Text<>'' then
 adoquery1.Filter := 'ADDER_NAME like '''+trim(edit1.Text)+'%'''
else
 adoquery1.Filter := '';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TfrmBaseGY.DBGrid1DblClick(Sender: TObject);
begin
 if not adoquery1.IsEmpty then
  ModalResult := mrok;
end;

procedure TfrmBaseGY.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then
  ModalResult := mrok;
end;



end.
