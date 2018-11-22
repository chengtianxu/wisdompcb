unit Result;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, Menus,Math, DB, DBClient;
type
 TExcludeColumns = set of 0..255;

type
  

  TFrm_Result = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Popup1: TPopupMenu;
    SGrd: TStringGrid;
    CheckBox1: TCheckBox;
    BitBtn5: TBitBtn;
    SGrd2: TStringGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SGrdDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Fitem_click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SetOptimalGridCellWidth(sg: TStringGrid;ExcludeColumns: TExcludeColumns);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SGrdMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn5Click(Sender: TObject);
    function RowSave(row:Integer;term:string;value:string):Integer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    v_RptType:Integer;
    FaWidth:array[0..79] of integer;
  public
    { Public declarations }
  end;

var
  Frm_Result: TFrm_Result;

implementation

uses common, Main, Search, dmo;

{$R *.dfm}

procedure TFrm_Result.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Result.BitBtn3Click(Sender: TObject);
var
  i:Integer;
  cm_excel:TMyIntSet;
begin
  cm_excel:=[];
  for i:=0 to SGrd.ColCount-1 do
  begin
   if (SGrd.Cells[i,0]='客户订单号') or
      (SGrd.Cells[i,0]='本厂编号') or
      (SGrd.Cells[i,0]='客户型号') or
      (SGrd.Cells[i,0]='客户物料号') or
      (SGrd.Cells[i,0]='客户代码') then
   begin
    Include(cm_excel, i);
   end;
  end;

  Export_Grid_to_Excel(SGrd,Self.Caption,cm_excel);
end;

procedure TFrm_Result.SGrdDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
//  if ARow<>0 then
//  begin
//    if (ARow mod 2=1) and (SGrd.RowCount>2) then
//    begin
//      SGrd.Canvas.Font.Color:=clBlack;
//      SGrd.Canvas.Brush.Color :=$00FFF0F5;
//      SGrd.Canvas.TextRect(rect,Rect.Left,Rect.Top,SGrd.Cells[acol, arow]);
//      SGrd.Canvas.FrameRect(Rect);
//    end
//    else
//    begin
//      SGrd.Canvas.Font.Color:=clBlack;
//      SGrd.Canvas.Brush.Color :=clWhite;
//      SGrd.Canvas.TextRect(rect,Rect.Left,Rect.Top,SGrd.Cells[acol, arow]);
//      SGrd.Canvas.FrameRect(Rect);
//    end;
//  end;
  if ((Sender as TStringGrid).Cells[0,ARow]='') and (SGrd.RowCount>2) then
  begin
    Frm_Result.SGrd.Canvas.Font.Color:=clRed;
    Frm_Result.SGrd.Canvas.Brush.Color :=clMoneyGreen;
    Frm_Result.SGrd.Canvas.TextRect(rect,rect.Left,rect.Top,SGrd.Cells[acol,arow]);
    Frm_Result.SGrd.Canvas.FrameRect(Rect);
  end;
end;
procedure TFrm_Result.BitBtn4Click(Sender: TObject);
begin
  Popup1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrm_Result.FormShow(Sender: TObject);
var
  i:Byte;
  item:TMenuItem;
begin
  for i := 0 to SGrd.ColCount-1 do
  begin
    item:=TMenuItem.Create(self);
    item.Caption:=SGrd.Cells[i,0];
    FaWidth[i]:=SGrd.ColWidths[i];
    //or ((v_RptType=1) and (i=15)) or ((v_RptType=1) and (i=30)) or ((v_RptType=1) and (i=41))
    //if ((v_RptType=1) and (i=8))  or ((v_RptType=1) and (i=40))  then
    // if ((v_RptType=1) and (i=8)) or ((v_RptType=1) and (i=15)) or ((v_RptType=1) and (i=19))  or ((v_RptType=1) and (i=30))  or ((v_RptType=1) and (i=40)) then
    if ((v_RptType=1) and (i=str_list.IndexOfName('帐龄日期')))  or ((v_RptType=1) and (i=str_list.IndexOfName('指派类型')))  then  //2个字段默认隐藏
       SGrd.ColWidths[i]:=-1;
    item.Checked :=SGrd.ColWidths[i]>0 ;
    item.OnClick := Fitem_click ;
    Popup1.Items.Add(item);
  end;
end;

procedure TFrm_Result.Fitem_click(Sender: TObject);
var
  I:Integer;
begin
  if TMenuItem(Sender).Checked then
  begin
    for I := 1 to SGrd.ColCount do
    begin
      if TMenuItem(Sender).Caption=SGrd.Cells[I,0] then
      begin
        FaWidth[I]:=SGrd.ColWidths[I];
        SGrd.ColWidths[I]:=-1;
        TMenuItem(Sender).Tag:=I;
      end;
    end;
  end
  else
  begin 
    for I := 1 to SGrd.ColCount do
    begin
      if TMenuItem(Sender).Caption=SGrd.Cells[I,0] then
      begin
        SGrd.ColWidths[I]:=FaWidth[I];
      end;
    end;
  end;
  TMenuItem(sender).Checked:=not TMenuItem(sender).Checked;
end;

procedure TFrm_Result.FormCreate(Sender: TObject);
begin
  v_RptType:=1;
end;

procedure TFrm_Result.SetOptimalGridCellWidth(sg: TStringGrid;
  ExcludeColumns: TExcludeColumns);
var
  i : Integer;
  j : Integer;
  max_width : Integer;
begin
  with sg do
  begin
    Canvas.Font.Assign(Font);
    for i := 0 to (ColCount - 1) do
    begin
      if i in ExcludeColumns then Continue;
      max_width := 0;
      for j := 0 to (RowCount - 1) do
        max_width := Math.Max(max_width,Canvas.TextWidth(Cells[i,j]));
      if max_width > 0 then
        ColWidths[i] := max_width + 4
      else
        ColWidths[i] := DefaultColWidth;
    end;
  end;
end;

procedure TFrm_Result.CheckBox1Click(Sender: TObject);
var
  i:integer;
  ExcludeColumns: TExcludeColumns;
begin
  for i:=0 to SGrd.ColCount-1 do
  begin
    if SGrd.ColWidths[i] < 0 then
      ExcludeColumns:=ExcludeColumns+[i];
  end;
  if CheckBox1.Checked then
    SetOptimalGridCellWidth(SGrd,ExcludeColumns)
  else
  begin
   for i:=0 to SGrd.ColCount-1 do
     if SGrd.ColWidths[i] > 0 then
       SGrd.ColWidths[i]:= FaWidth[i];
  end;
end;
procedure TFrm_Result.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Frm_Main.i:=1;
end;

procedure TFrm_Result.SGrdMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Column,Row: Longint;
//  s:TStrings;
//  i:Byte;
begin
  SGrd.MouseToCell(X,Y,Column,Row);
end;

procedure TFrm_Result.BitBtn5Click(Sender: TObject);
var
  i,j,k,l:Byte;
  bsp,omb:Integer;
  oam,sam:Double;
begin
  frm_Search:=Tfrm_Search.Create(Application);
  SGrd2.RowCount:=2;
  l:=1;
  bsp:=0;
  omb:=0;
  oam:=0;
  sam:=0;
  if frm_Search.ShowModal=mrok then
  begin
    for i := 1 to SGrd.RowCount-2 do
    begin
      for j := 1  to frm_Search.SGrd.RowCount-1 do
      begin
        if (RowSave(i,frm_Search.SGrd.Cells[0,j],frm_Search.SGrd.Cells[1,j])<>-1) then
        begin
          for k := 0 to SGrd2.ColCount-1 do
          begin
            SGrd2.Cells[k,l]:=SGrd.Cells[k,i];
          end;
          l:=l+1;
          SGrd2.RowCount:=SGrd2.RowCount+1;
        end;
      end;
    end;
    SGrd.RowCount:=2;
    for i := 0 to SGrd.ColCount-1 do
    begin
      SGrd.Cells[i,SGrd.RowCount-1]:='';
    end;
    for i := 1 to SGrd2.RowCount-2 do
    begin
      for j := 0 to SGrd2.ColCount-1 do
      begin
        SGrd.Cells[j,i]:=SGrd2.Cells[j,i];
      end;
      if SGrd.Cells[str_list.IndexOfName('出货数量'),i]='' then
        bsp:=bsp+0
      else
        bsp:=bsp+StrToInt(SGrd.Cells[str_list.IndexOfName('出货数量'),i]);
      if SGrd.Cells[str_list.IndexOfName('已开票数量'),i]='' then
        omb:=omb+0
      else
        omb:=omb+StrToInt(SGrd.Cells[str_list.IndexOfName('已开票数量'),i]);
      if SGrd.Cells[str_list.IndexOfName('开票金额'),i]='' then
        oam:=oam+0
      else
        oam:=oam+StrToFloat(SGrd.Cells[str_list.IndexOfName('开票金额'),i]);   
      if SGrd.Cells[str_list.IndexOfName('出货金额(含税)'),i]='' then
        sam:=sam+0
      else
        sam:=sam+StrToFloat(SGrd.Cells[str_list.IndexOfName('出货金额(含税)'),i]);
      SGrd.RowCount:=SGrd.RowCount+1;
      for k := 0 to SGrd.ColCount-1 do
      begin
        SGrd.Cells[k,SGrd.RowCount-1]:='';
        SGrd.Cells[2,SGrd.RowCount-1]:=SGrd.Cells[2,SGrd.RowCount-2];
        SGrd.Cells[str_list.IndexOfName('出货数量'),SGrd.RowCount-1]:=IntToStr(bsp);
        SGrd.Cells[str_list.IndexOfName('已开票数量'),SGrd.RowCount-1]:=IntToStr(omb);
        SGrd.Cells[str_list.IndexOfName('开票金额'),SGrd.RowCount-1]:=FormatFloat('0.00',oam);
        SGrd.Cells[str_list.IndexOfName('出货金额(含税)'),SGrd.RowCount-1]:=FormatFloat('0.00',sam);
      end;
    end;
  end;
end;

function TFrm_Result.RowSave(row:Integer;term:string;value:string):Integer;
begin 
  Result:=-1;
  if term='本厂编号' then
  begin
    //if AnsiUpperCase(Trim(SGrd.Cells[13,row]))=AnsiUpperCase(Trim(value)) then
    if AnsiUpperCase(Trim(SGrd.Cells[str_list.IndexOfName('本厂编号'),row]))=AnsiUpperCase(Trim(value)) then
      Result:=row;
  end;
  if term='客户订单' then
  begin
//    //if AnsiUpperCase(Trim(SGrd.Cells[12,row]))=AnsiUpperCase(Trim(value)) then
      if AnsiUpperCase(Trim(SGrd.Cells[str_list.IndexOfName('客户订单号'),row]))=AnsiUpperCase(Trim(value)) then
      Result:=row;
  end;
  if term='客户型号' then
  begin
    //if AnsiUpperCase(Trim(SGrd.Cells[14,row]))=AnsiUpperCase(Trim(value)) then
    if AnsiUpperCase(Trim(SGrd.Cells[str_list.IndexOfName('客户型号'),row]))=AnsiUpperCase(Trim(value)) then
      Result:=row;
  end;
  if term='装箱单号' then
  begin
    //if AnsiUpperCase(Trim(SGrd.Cells[20,row]))=AnsiUpperCase(Trim(value)) then
    if AnsiUpperCase(Trim(SGrd.Cells[str_list.IndexOfName('装箱单号'),row]))=AnsiUpperCase(Trim(value)) then
      Result:=row;
  end;
  if term='销售订单' then
  begin
   // if AnsiUpperCase(Trim(SGrd.Cells[21,row]))=AnsiUpperCase(Trim(value)) then
    if AnsiUpperCase(Trim(SGrd.Cells[str_list.IndexOfName('销售订单'),row]))=AnsiUpperCase(Trim(value)) then
      Result:=row;
  end;
end;
procedure TFrm_Result.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 DM.ADOStandard.Close;
 dm.ADOTool.Close;
 dm.ADOSundry.Close;
 dm.ADOReturnMemo.Close;
 dm.ADONoReturnMemo.Close; 
end;

end.
