unit inv_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  Tform_inv = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    RadioGroup1: TRadioGroup;
    ADOQuery1: TADOQuery;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1LAYERS: TWordField;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery1ANALYSIS_CODE_2: TStringField;
    ADOQuery1batch_or_formal: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  form_inv: Tform_inv;

implementation
uses  data_module;
{$R *.dfm}

procedure Tform_inv.NewGridWnd(var Message: TMessage);
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


procedure Tform_inv.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    if radiogroup1.ItemIndex=0 then
      Adoquery1.Filter :='MANU_PART_NUMBER like '''+Trim(Edit1.Text)+'%'''
    else
      Adoquery1.Filter :='MANU_PART_DESC like ''%'+Trim(Edit1.Text)+'%'''
  else
  Adoquery1.filter:='';
end;

procedure Tform_inv.BitBtn1Click(Sender: TObject);
begin
  edit1.Text :='';
  edit1.SetFocus;
end;

procedure Tform_inv.DBGrid1DblClick(Sender: TObject);
begin
  if not adoquery1.IsEmpty then ModalResult:=mrok;
end;

procedure Tform_inv.DBGrid1KeyDown(Sender: TObject; var Key: Word;
 Shift: TShiftState);
begin
  if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure Tform_inv.FormCreate(Sender: TObject);
begin
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

procedure Tform_inv.RadioGroup1Click(Sender: TObject);
begin
  label1.Caption := radiogroup1.Items.Strings[radiogroup1.itemindex];
  edit1.SetFocus;
end;

procedure Tform_inv.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if adoquery1.IsEmpty then
    button1.Enabled:=false
  else
    button1.Enabled:=true;
end;

end.
