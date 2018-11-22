unit invtype_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TForm_invtype = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOStoredProc;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1GROUP_NAME: TStringField;
    ADOQuery1GROUP_DESC: TStringField;
    ADOQuery1ttype: TStringField;
    ADOQuery1ctype: TStringField;
    ADOQuery1inv_group_name: TStringField;
    ADOQuery1inv_group_desc: TStringField;
    ADOQuery1mask_inv_number: TStringField;
    ADOQuery1if_flag: TWordField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_invtype: TForm_invtype;

implementation
uses damo;
{$R *.dfm}

procedure TForm_invtype.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Adoquery1.Filter :='group_name like '''+Trim(Edit1.Text)+'%'''
 else
  Adoquery1.filter:='';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_invtype.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm_invtype.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 ModalResult:=mrok;
end;

procedure TForm_invtype.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_invtype.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
end;

procedure TForm_invtype.ADOQuery1CalcFields(DataSet: TDataSet);
begin
if adoquery1ttype.Value='P' then
 adoquery1ctype.Value:='原材料'
else
 if adoquery1ttype.Value='T' then
  adoquery1ctype.Value:='外发加工'
 else
  adoquery1ctype.Value:='杂项';
end;

end.
