unit Uresponsibility;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls;

type
  TForm_FT = class(TForm)
    DBGridEh1: TDBGridEh;
    ControlBar1: TControlBar;
    BitBtn2: TBitBtn;
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_FT: TForm_FT;

implementation

uses Udemo,common;

{$R *.dfm}

procedure TForm_FT.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);

begin
 if gdSelected in State then Exit;
  if DM.adoft.RecNo mod 2 = 0 then
   DBGridEh1.Canvas.Brush.Color := clInfoBk
  else
  DBGridEh1.Canvas.Brush.Color := RGB(191, 255, 223);
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  DBGridEh1.Canvas.Pen.Color := $00C08000;
  DBGridEh1.Canvas.MoveTo(Rect.Left, Rect.Bottom);
  DBGridEh1.Canvas.LineTo(Rect.Right, Rect.Bottom);
  DBGridEh1.Canvas.MoveTo(Rect.Right, Rect.Top);
  DBGridEh1.Canvas.LineTo(Rect.Right, Rect.Bottom);

end;

procedure TForm_FT.FormShow(Sender: TObject);
  var area:Double;
  i:Integer;
begin
 while not dm.ADOft.Eof do
 begin
  area:=area+dm.adoft.FieldValues['sp_money'];
  dm.ADOft.Next;
 end;
 DBGridEh1.FooterRowCount:=1;//新添加一行脚注
 DBGridEh1.SumList.Active:=true;
 for i:=0 to DBGridEh1.Columns.Count-1 do
 begin
  DBGridEh1.Columns[i].Footer.FieldName:=DBGridEh1.Columns[i].Title.Caption;
  DBGridEh1.FooterColor:= clBtnFace;
  DBGridEh1.Columns[0].Footer.ValueType:=fvtStaticText;
  DBGridEh1.Columns[0].Footer.Value:='合计金额';
  DBGridEh1.Columns[2].Footer.Value:=FloatToStr(area);
  DBGridEh1.Columns[0].Footer.Alignment:=tacenter;

  DBGridEh1.Columns[1].Footer.ValueType:=fvtStaticText;
  DBGridEh1.Columns[3].Footer.ValueType:=fvtStaticText;
  DBGridEh1.Columns[3].Footer.Value:=FloatToStr(area);
 end;
end;

procedure TForm_FT.BitBtn2Click(Sender: TObject);
begin
 if DM.ADOft.IsEmpty then exit;
 Export_dbGridEH_to_Excel(DBGridEh1,'品质索赔申请')
end;

end.
