unit JoinReport_mod33;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm,ucommfunc,uBaseSinglePickListFrm,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Data.DB, Datasnap.DBClient;

type
  TfrmJoinReport_mod33 = class(TfrmBaseEdit)
    Label1: TLabel;
    SG1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    SG2: TStringGrid;
    Label2: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData();
    procedure Init_UI();
  end;

var
  frmJoinReport_mod33: TfrmJoinReport_mod33;

implementation

{$R *.dfm}

procedure TfrmJoinReport_mod33.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmJoinReport_mod33.btnSaveClick(Sender: TObject);
begin
  if sg2.RowCount <= 2 then
  begin
    ShowMessage('请选择要打印的订单！');
    Exit;
  end;
  ModalResult:= mrOk;
end;

procedure TfrmJoinReport_mod33.Button1Click(Sender: TObject);
var
 i,j,ii,jj:integer;
begin                             //第一步实现stg2的插入
for i:=sg1.Selection.Top to sg1.Selection.Bottom do
 if i<>sg1.RowCount-1 then       //如果当前行不是最后一行
  begin
   if sg2.RowCount=2 then        //如果STG2当前是空行
    sg2.Rows[1].Text := sg1.Rows[i].Text
   else
    for ii:=1 to sg2.RowCount-2 do  //排序寻找插入的位置 大于当前行
     if strtoint(sg2.Cells[3,ii])>strtoint(sg1.Cells[3,i]) then
      begin
       for jj:=sg2.RowCount-1 downto ii do
        if jj<>ii then
         sg2.Rows[jj].Text := sg2.Rows[jj-1].Text
        else
         sg2.Rows[jj].Text := sg1.Rows[i].Text;
       break;   //插入后跳出内循环
      end
     else
      if ii=sg2.RowCount-2 then                //小于当前行并且是最后一行
       sg2.Rows[ii+1].Text := sg1.Rows[i].Text;
   sg2.RowCount := sg2.RowCount+1;
  end;
                                  //第二步实现stg1的删除
 for i:=SG1.Selection.Top to SG1.Selection.Bottom do
  begin
   for j:=SG1.Selection.Top to SG1.RowCount-2 do
    SG1.Rows[j].Text:=SG1.Rows[j+1].Text;
   if SG1.Selection.Top<=SG1.RowCount-2 then
    SG1.RowCount:=SG1.RowCount-1;
  end;

if sg2.RowCount>=19 then SG2.ColWidths[1]:=75;
if SG1.RowCount<=18 then SG1.ColWidths[1]:=88;
end;

procedure TfrmJoinReport_mod33.Button2Click(Sender: TObject);
var
  i:Integer;
begin
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

procedure TfrmJoinReport_mod33.Button3Click(Sender: TObject);
var
 i,ii,j,jj:integer;
begin                               //第一步实现stg1的插入
for i:=SG2.Selection.Top to SG2.Selection.Bottom do
 if i<>SG2.RowCount-1 then //如果当前行不是最后一行
  begin
   if SG1.RowCount=2 then  //如果STG1当前是空行
    SG1.Rows[1].Text := SG2.Rows[i].Text
   else
    for ii:=1 to SG1.RowCount-2 do //排序寻找插入的位置
     if strtoint(SG1.Cells[3,ii])>strtoint(SG2.Cells[3,i]) then
      begin
       for jj:=SG1.RowCount-1 downto ii do
        if jj<>ii then
         SG1.Rows[jj].Text := SG1.Rows[jj-1].Text
        else
         SG1.Rows[jj].Text := SG2.Rows[i].Text;
       break;   //插入后跳出内循环
      end
     else                                                         //增加
      if ii=SG1.RowCount-2 then//小于当前行并且是最后一行
       SG1.Rows[ii+1].Text := SG2.Rows[i].Text;
   SG1.RowCount := SG1.RowCount+1;
  end;
//******************************************************************************
for i:=SG2.Selection.Top to SG2.Selection.Bottom do//第二步实现stringgrid2的删除
 begin
  for j:=SG2.Selection.Top to SG2.RowCount-2 do SG2.Rows[j].Text:=SG2.Rows[j+1].Text;
  if SG2.Selection.Top<=SG2.RowCount-2 then SG2.RowCount:=SG2.RowCount-1;
 end;
if SG2.RowCount<19 then SG2.ColWidths[1]:=92;
if SG1.RowCount>=19 then SG1.ColWidths[1]:=74;
end;

procedure TfrmJoinReport_mod33.Button4Click(Sender: TObject);
var
  i:Integer;
begin
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

procedure TfrmJoinReport_mod33.GetData;
begin
end;

procedure TfrmJoinReport_mod33.Init_UI;
begin
  sg1.Cells[0,0]:='采购单编号';
  sg1.Cells[1,0]:='供应商';
  sg2.Cells[0,0]:='采购单编号';
  sg2.Cells[1,0]:='供应商';
  SG1.ColWidths[2]:=-1;
  SG1.ColWidths[3]:=-1;
  SG2.ColWidths[2]:=-1;
  SG2.ColWidths[3]:=-1;
end;

end.
