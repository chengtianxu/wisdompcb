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
    ADOQuery1INSPECT: TWideStringField;
    ADOQuery1SHELF_LIFE: TSmallintField;
    ADOQuery1CATALOG_NUM: TWideStringField;
    ADOQuery1AVL_FLAG: TWideStringField;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1Rkey595: TIntegerField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery11CalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
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
 begin
  if rg1.ItemIndex=0 then
   Adoquery1.Filter :='group_name like '''+'%'+Trim(Edit1.Text)+'%'''
  else
    Adoquery1.Filter :='GROUP_DESC like '''+'%'+Trim(Edit1.Text)+'%''';
 end
 else
  Adoquery1.filter:='';

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

procedure TForm_invtype.ADOQuery11CalcFields(DataSet: TDataSet);
begin
//if adoquery1ttype.Value='P' then
// adoquery1ctype.Value:='原材料'
//else
// if adoquery1ttype.Value='T' then
//  adoquery1ctype.Value:='外发加工'
// else
//  adoquery1ctype.Value:='杂项';
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

procedure TForm_invtype.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
begin
   if gdSelected in State then
    Exit;
  if ADOQuery1.RecNo mod 2 = 0 then
    DBGrid1.Canvas.Brush.Color := clInfoBk
  else
    DBGrid1.Canvas.Brush.Color := RGB(191, 255, 223);
    
    DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    DBGrid1.Canvas.Pen.Color := $00C08000;
    DBGrid1.Canvas.MoveTo(Rect.Left, Rect.Bottom);
    DBGrid1.Canvas.LineTo(Rect.Right, Rect.Bottom);
    DBGrid1.Canvas.MoveTo(Rect.Right, Rect.Top);
    DBGrid1.Canvas.LineTo(Rect.Right, Rect.Bottom);
end;
end;

procedure TForm_invtype.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
 if adoquery1.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;
end;

end.
