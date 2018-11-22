unit MultiPrintFrm_Mod29;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Data.DB, Datasnap.DBClient,uBaseFrm;

type
  TfrmMultiPrint_Mod29 = class(TfrmBase)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    btnPrint: TBitBtn;
    btnCancel: TBitBtn;
    sg1: TStringGrid;
    sg2: TStringGrid;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    cds1: TClientDataSet;
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData();
    procedure Init_UI();
  end;

var
  frmMultiPrint_Mod29: TfrmMultiPrint_Mod29;

implementation

uses uCommFunc;

{$R *.dfm}

{ TfrmMultiPrint_Mod29 }

procedure TfrmMultiPrint_Mod29.btn1Click(Sender: TObject);
var
 i,j:integer;
begin
  for i:=sg1.Selection.Top to sg1.Selection.Bottom do
  begin
    if i = sg1.RowCount - 1 then Break;
    sg2.Rows[sg2.RowCount -1]:= sg1.Rows[i];
    sg2.RowCount:= sg2.RowCount + 1;
  end;
  for i:=sg1.Selection.Top to sg1.Selection.Bottom do//第二步实现stringgrid2的删除
  begin
    for j:=sg1.Selection.Top to sg1.RowCount-2 do sg1.Rows[j].Text:=sg1.Rows[j+1].Text;
    if sg1.Selection.Top<=sg1.RowCount-2 then sg1.RowCount:=sg1.RowCount-1;
  end;

                         //第一步实现stg2的插入
//for i:=sg1.Selection.Top to sg1.Selection.Bottom do
// if i<>sg1.RowCount-1 then       //如果当前行不是最后一行
//  begin
//   if sg2.RowCount=2 then        //如果STG2当前是空行
//    sg2.Rows[1].Text := sg1.Rows[i].Text
//   else
//    for ii:=1 to sg2.RowCount-2 do  //排序寻找插入的位置 大于当前行
//     if strtoint(sg2.Cells[3,ii])>strtoint(sg1.Cells[3,i]) then
//      begin
//       for jj:=sg2.RowCount-1 downto ii do
//        if jj<>ii then
//         sg2.Rows[jj].Text := sg2.Rows[jj-1].Text
//        else
//         sg2.Rows[jj].Text := sg1.Rows[i].Text;
//       break;   //插入后跳出内循环
//      end
//     else
//      if ii=sg2.RowCount-2 then                //小于当前行并且是最后一行
//       sg2.Rows[ii+1].Text := sg1.Rows[i].Text;
//   sg2.RowCount := sg2.RowCount+1;
//  end;
//                                  //第二步实现stg1的删除
// for i:=sg1.Selection.Top to sg1.Selection.Bottom do
//  begin
//   for j:=sg1.Selection.Top to sg1.RowCount-2 do
//    sg1.Rows[j].Text:=sg1.Rows[j+1].Text;
//   if sg1.Selection.Top<=sg1.RowCount-2 then
//    sg1.RowCount:=sg1.RowCount-1;
//  end;
//
//if sg2.RowCount>=19 then sg2.ColWidths[1]:=75;
//if sg1.RowCount<=18 then sg1.ColWidths[1]:=88;
end;

procedure TfrmMultiPrint_Mod29.btn2Click(Sender: TObject);
var
  i:Integer;
begin
//  for i := 1 to sg2.RowCount - 2 do
//    sg2.Rows[i].Clear;
//  sg2.RowCount:=2;
  if sg1.RowCount=2 then Exit;
  for i := 1 to sg1.RowCount - 2 do
  begin
    sg2.Rows[sg2.RowCount-1].Text:= sg1.Rows[i].Text;
    sg2.RowCount:= sg2.RowCount + 1;
  end;

  for i := 1 to sg1.RowCount - 2 do
    sg1.Rows[i].Clear;
  sg1.RowCount:=2;
end;

procedure TfrmMultiPrint_Mod29.btn3Click(Sender: TObject);
var
 i,j:integer;
begin
                                 //第一步实现stg1的插入
  for i:=sg2.Selection.Top to sg2.Selection.Bottom do
  begin
    if i = sg1.RowCount - 1 then Break;
    sg1.Rows[sg1.RowCount -1]:= sg2.Rows[i];
    sg1.RowCount:= sg1.RowCount + 1;
  end;
  for i:=sg2.Selection.Top to sg2.Selection.Bottom do//第二步实现stringgrid2的删除
  begin
    for j:=sg2.Selection.Top to sg2.RowCount-2 do sg2.Rows[j].Text:=sg2.Rows[j+1].Text;
    if sg2.Selection.Top<=sg2.RowCount-2 then sg2.RowCount:=sg2.RowCount-1;
  end;


// if i<>sg2.RowCount-1 then //如果当前行不是最后一行
//  begin
//   if sg1.RowCount=2 then  //如果STG1当前是空行
//    sg1.Rows[1].Text := sg2.Rows[i].Text
//   else
//    for ii:=1 to sg1.RowCount-2 do //排序寻找插入的位置
//     if strtoint(sg1.Cells[3,ii])>strtoint(sg2.Cells[3,i]) then
//      begin
//       for jj:=sg1.RowCount-1 downto ii do
//        if jj<>ii then
//         sg1.Rows[jj].Text := sg1.Rows[jj-1].Text
//        else
//         sg1.Rows[jj].Text := sg2.Rows[i].Text;
//       break;   //插入后跳出内循环
//      end
//     else                                                         //增加
//      if ii=sg1.RowCount-2 then//小于当前行并且是最后一行
//       sg1.Rows[ii+1].Text := sg2.Rows[i].Text;
//   sg1.RowCount := sg1.RowCount+1;
//  end;
////******************************************************************************
//for i:=sg2.Selection.Top to sg2.Selection.Bottom do//第二步实现stringgrid2的删除
// begin
//  for j:=sg2.Selection.Top to sg2.RowCount-2 do sg2.Rows[j].Text:=sg2.Rows[j+1].Text;
//  if sg2.Selection.Top<=sg2.RowCount-2 then sg2.RowCount:=sg2.RowCount-1;
// end;
//if sg2.RowCount<19 then sg2.ColWidths[1]:=92;
//if sg1.RowCount>=19 then sg1.ColWidths[1]:=74;
end;

procedure TfrmMultiPrint_Mod29.btn4Click(Sender: TObject);
var
  i:Integer;
begin
//  for i := 1 to sg1.RowCount - 2 do
//    sg1.Rows[i].Clear;
//  sg1.RowCount:=2;
  if sg2.RowCount=2 then Exit;

  for i := 1 to sg2.RowCount - 2 do
  begin
    sg1.Rows[sg1.RowCount-1].Text:= sg2.Rows[i].Text;
    sg1.RowCount:= sg1.RowCount + 1;
  end;

  for i := 1 to sg2.RowCount - 2 do
    sg2.Rows[i].Clear;
  sg2.RowCount:=2;
end;

procedure TfrmMultiPrint_Mod29.btnPrintClick(Sender: TObject);
begin
  if sg2.RowCount <= 2 then
  begin
    ShowMessage('请选择要打印的订单！');
    Exit;
  end;
  ModalResult:= mrOk;
end;

procedure TfrmMultiPrint_Mod29.GetData;
var
  LSql:string;
begin
  LSql:= cds1.CommandText;
  if not gSvrIntf.IntfGetDataBySql(LSql,cds1) then exit;
end;

procedure TfrmMultiPrint_Mod29.Init_UI;
begin
  sg1.Cells[0,0]:='采购单编号';
  sg1.Cells[1,0]:='供应商';
  sg2.Cells[0,0]:='采购单编号';
  sg2.Cells[1,0]:='供应商';
end;

end.
