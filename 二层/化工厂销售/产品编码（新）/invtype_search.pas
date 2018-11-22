unit invtype_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids, ExtCtrls;

type
  TForm_invtype = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    rg1: TRadioGroup;
    ADOQuery1: TADOQuery;
    ADOQuery1RKEY: TAutoIncField;
    ADOQuery1GROUP_NAME: TStringField;
    ADOQuery1if_flag: TWordField;
    ADOQuery1GROUP_DESC: TStringField;
    ADOQuery1ttype: TStringField;
    ADOQuery1mask_inv_number: TStringField;
    ADOQuery1inv_group_name: TStringField;
    ADOQuery1inv_group_desc: TStringField;
    adoquery1ctype: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure rg1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_invtype: TForm_invtype;

implementation
uses DM_u;
{$R *.dfm}

procedure TForm_invtype.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
 begin
  if rg1.ItemIndex=0 then
    Adoquery1.Filter :='group_name like '''+'%'+Trim(Edit1.Text)+'%'''
  else
    Adoquery1.Filter :='GROUP_DESC like '''+'%'+Trim(Edit1.Text)+'%''';
 end
 else Adoquery1.filter:='';
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
if not ADOQuery1.IsEmpty then
 ModalResult:=mrok;
end;

procedure TForm_invtype.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not ADOQuery1.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_invtype.FormCreate(Sender: TObject);
begin
 ADOQuery1.Open;
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

procedure TForm_invtype.FormShow(Sender: TObject);
begin
  rg1.ItemIndex:= 0;
end;

procedure TForm_invtype.rg1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

end.
