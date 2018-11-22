unit technics_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TForm_technics = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADODataSet;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1ADDER_NAME: TStringField;
    ADOQuery1FORMULA: TMemoField;
    ADOQuery1MIN_VALUE: TMemoField;
    ADOQuery1MAX_VALUE: TMemoField;
    ADOQuery1cac_meoth: TStringField;
    procedure MaskEdit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form_technics: TForm_technics;

implementation

uses damo;

{$R *.dfm}
procedure TForm_technics.NewGridWnd(var Message: TMessage);
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

procedure TForm_technics.MaskEdit1Change(Sender: TObject);
begin
 if trim(MaskEdit1.text)<>'' then
  Adoquery1.Filter :='ADDER_NAME like ''%'+Trim(MaskEdit1.Text)+'%'''
 else
  Adoquery1.filter:='';
end;

procedure TForm_technics.DBGrid1DblClick(Sender: TObject);
begin
 if not adoquery1.IsEmpty then modalresult:=mrok;
end;

procedure TForm_technics.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then  modalresult:=mrok;
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(adoquery1.CommandText);
end;

procedure TForm_technics.BitBtn2Click(Sender: TObject);
begin
 Maskedit1.Text := '';
 maskedit1.SetFocus;
end;

procedure TForm_technics.FormCreate(Sender: TObject);
begin
 adoquery1.Open;

 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm_technics.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
 if adoquery1.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;
end;

end.
